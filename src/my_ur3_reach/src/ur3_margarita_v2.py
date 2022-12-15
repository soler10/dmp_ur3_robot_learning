#!/usr/bin/env python3

import sys
import rospy
import time
from std_msgs.msg import Float64
from control_msgs.msg import JointControllerState
from sensor_msgs.msg import JointState
import tf
from ur_ikfast import ur_kinematics
#import kineik

import roboticstoolbox as rtb
import numpy as np
#pel dmp:
import roslib; 
roslib.load_manifest('dmp')
import rospy 
import numpy as np
from dmp.srv import *
from dmp.msg import *
import sys
import random

#global variables:
num_bases = 10 

class UR3Reach():

    """ Move a robot joint to a given position. """

    def __init__(self):

        # Menu choices
        self.joints = {
            1: 'elbow_joint',
            2: 'shoulder_lift_joint',
            3: 'shoulder_pan_joint',
            4: 'wrist_1_joint',
            5: 'wrist_2_joint',
            6: 'wrist_3_joint'
        }
        # Initialize a dictionary to store joint position/set_point/error
        self.joint = {}
        self.pos={}
        self.traj=[]
        # Initialize TF listener
        self.listener = tf.TransformListener()
        # Run publishers
        [rospy.Publisher('/ur3/' + v + '_position_controller/command',
         Float64, queue_size=1) for v in self.joints.values()]
        # Set rate
        self.rate = rospy.Rate(10)
        a=np.array([3])

    def state_callback(self, msg):

        """ Stores in a dictionary the set point
        of a joint, its actual position and the pose error
        measured as the difference between the desired position
        and the current one.
        :return:
        """

        self.joint['set_point'] = msg.set_point
        self.joint['process_value'] = msg.process_value
        self.joint['error'] = msg.error
        
        
    def state_callback2(self, msg):

        """ Stores in a dictionary the set point
        of a joint, its actual position and the pose error
        measured as the difference between the desired position
        and the current one.
        :return:
        """

        self.pos['name'] = msg.name
        
        self.pos['position'] = msg.position
        self.pos['tpm'] = msg.effort

    def wait_for_confirmation(self, timeout, max_error):

        """ Tracks the execution of a robot's action. It waits
        until the robot succesfully reaches a desired position with some
        given tolerance. If moving the robot is taking more time than
        a certain maximum waiting time (arg in seconds), then it stops
        waiting and returns a 'False' flag to indicate the robot
        didn't reach the final position.
        :return: Bool
        """

        # Store current time
        start = time.time()
        elapsed = 0
        # The error has to be lower than the maximum and elapsed time
        # should not exceed the maximum waiting time
        while abs(self.joint['error']) > max_error and not elapsed > timeout:
            elapsed = time.time() - start
            self.rate.sleep()
        # Return a confirmation flag
        if elapsed > timeout:
            return False
        else:
            return True

    def reach_destination(self, joint, query):
        """ Creates a subscriber to a given joint state,
        and waits until the robot has reached a desired position.
        If the robot wasn't able to get there, it prints
        a warning messsage to notify the user the task wasn't completed.
        :return:
        """

        joint = str(joint)
        topic = '/ur3/' + joint + '_position_controller/state'
        sub = rospy.Subscriber(topic, JointControllerState, self.state_callback)
        # Make sure the subscriber has information
        while not self.joint:
            self.rate.sleep()
        # Make sure the final pose matches the query
        while self.joint['set_point'] != query:
            self.rate.sleep()
        # Make sure the robot reaches the actual position (here we pass a max timeout
        # in case the robot gets stuck - see function 'wait_for_confirmation')
        result = self.wait_for_confirmation(timeout=25, max_error=0.05)
        if not result:
            rospy.logwarn("Max timeout! Joint couldn't reach destination point.")
        # Unsubscribe to the topic until next call
        sub.unregister()
        #self.reach_destination(self.joints[query_joint], query_position)
        return result
   
    def get_pose(self):
    	
    	#topic = '/ur3/' + joint + '_position_controller/state'
    	topic='/ur3/joint_states'
    	sub = rospy.Subscriber(topic, JointState, self.state_callback2)
    	# Make sure the subscriber has information
    	#sys.stdout.write('aaaaaaaaaaaaaaaaaaaaaaah '+format(self.pos)+'\n')
    	while not self.pos:
            self.rate.sleep()
    	# Make sure the final pose matches the query
    	set_p= self.pos['position']
    	
    	sub.unregister()



    
    def publish_pos(self, joint, query):
    	""" Creates a publisher to a given joint and sends
    	the desired position of it.:return:"""
    	topic = '/ur3/' + joint + '_position_controller/command'
    	pub = rospy.Publisher(topic, Float64, queue_size=1)
    	pub.publish(query)
    

	


    def print_menu_choices(self, n):

        """ Shows in the terminal the list of joints
        that can be actionable.
        :return:
        """

        sys.stdout.write('\r' + '='*17 + ' QUERY #{} '.format(n) + '='*17 + '\n')
        sys.stdout.write('\r Please, select one of the following joints: \n')
        sys.stdout.write("\n".join("{}\t{}".format(k, v) for k, v in self.joints.items()) + "\n")

    def print_summary_report(self, trans, rot):

        """ Shows in the terminal a summary report indicating
        the joint's goal position, its actual current position,
        the error in the position relative to the desired set-point,
        and the position and orientation of the end effector relative
        to the base.
        :return:
        """

        sys.stdout.write('\r' + '** SUMMARY **' + '\n')
        sys.stdout.write('\r' +
            '=> Goal position: {}'.format(round(self.joint['set_point'], 4)) + '\n' +
            '=> Current position: {}'.format(round(self.joint['process_value'], 4)) + '\n' +
            '=> Error: {}'.format(round(self.joint['error'], 4)) + '\n' +
            '=> Position of the end effector relative to the base {}'.format(trans) + '\n' +
            '=> Orientation of the end effector relative to the base {}'.format(rot) + '\n'
        )

    def runner_trajectory(self):

        """ Main executor. The program runs until it's interrupted. """

        new_traj=str(input('New trajectory demo:[y/n] '))
        query = 1
        ur3_arm = ur_kinematics.URKinematics('ur3')
        ###############################################################################
        #Configure the initial point
        self.get_pose()
        joint_angles_ini=self.pos['position']
        pose_quat = ur3_arm.forward(joint_angles_ini)
        #pose quat: A vector of 7 values: a 3x1 translation (tX), and a 1x4 quaternion (w + i + j + k) as input for inverse!!!!!!!!!!!!!!
        new_pos=ur3_arm.inverse(pose_quat, True)
        
        
        
        #raw_input('Please, press <enter> to run the program...')
        # Clean terminal
        #sys.stderr.write("\x1b[2J\x1b[H")
        if new_traj == 'Y' or new_traj == 'y':
        	#print('Continue moving or Quit [c/q]')
        	traj=[]
        	#sys.stdout.write('Want to save another point? \n')
        	#save=str(input('save the point?[s/d] \n'))
        	#sys.stdout.write('here\n')
        	cont='c'
        	while cont == 'c' or cont == 'C':
        		#choose new point
        		self.print_menu_choices(query)
        		query_joint = int(input('Enter the associated joint number: '))
        		if query_joint not in self.joints.keys():
        			sys.stdout.write('\033[1;31m') # Print in RED
        			sys.stdout.write('\r' + 'Please, enter a valid number.' + '\n')
        			sys.stdout.write('\033[0;0m') # Reset color
        			continue
        			
        		
        		#troba ultima join value
        		self.get_pose()
        		joint_angles=self.pos['position']
        		query_position = input('Enter the position to move this joint to: ')
        		#query_position = input('Enter the position to move this joint '+str(query_joint)+' aka '+str(llista[query_joint])+' to: ')
        		query_position=float(query_position)
        		if query_position > 6.283:
        			query_position = 6.23
        		self.publish_pos(self.joints[query_joint], query_position)
        		result=self.reach_destination(self.joints[query_joint], query_position)
        		save = str(input('Save point, Continue moving or Quit [s/c/q]'))
        		if save == 's' or save == 'S':
        			self.get_pose()
        			traj.append(joint_angles)
        			cont = str(input('Continue moving or Quit [c/q]'))
        		else:
        			cont='c'
				
        				
        				     		
        		
 
        		      		
        		
        		
        		      	
        	
        	print(traj)
        	sys.stdout.write('trajectoria nova'+format(traj)+'\n')
        	
        		
		
        		
        	
        else:
        	traj=[[-0.9988178482671994, 0.003128336862832981, -0.8213701612868309, -0.08524487160157346, -0.06191487291410791, -0.33444247883941447],[-0.9990976680864359, -0.197809168105902, -0.821486968512712, -0.08509807665385072, -0.061818923663350844, -0.3342307979974457],[-0.9991287411334486, -0.1987202945677975, 0.19925326188306425, -0.08435518408605258, -0.06190375397354675, -0.3353576317224354],[-0.9991887889785653, -0.1989704170184785, 0.4992983366710808, -0.08415410820630509, -0.0619101775929396, -0.33558161021820165],[-0.9992999171023778, -0.1992102665873059, 0.7994014140104522, -0.4967736608087696, -0.06168628101320106, -0.335575711767679]]
        	
        	
        return traj

        
        
        
        
        
        
        
        
        
        	

        	
        	
        
        

	
#####################################################################################################            
#funcions del dmpi 


#Learn a DMP from demonstration data
def makeLFDRequest(dims, traj, dt, K_gain, 
                   D_gain, num_bases):
    demotraj = DMPTraj()
    
        
    for i in range(len(traj)):
        pt = DMPPoint();
        pt.positions = traj[i]
        demotraj.points.append(pt)
        demotraj.times.append(dt*i)
            
    k_gains = [K_gain]*dims
    d_gains = [D_gain]*dims
        
    print( "Starting LfD...")
    rospy.wait_for_service('learn_dmp_from_demo')
    try:
        lfd = rospy.ServiceProxy('learn_dmp_from_demo', LearnDMPFromDemo)
        resp = lfd(demotraj, k_gains, d_gains, num_bases)
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)
    print( "LfD done" )   
            
    return resp;


#Set a DMP as active for planning
def makeSetActiveRequest(dmp_list):
    try:
        sad = rospy.ServiceProxy('set_active_dmp', SetActiveDMP)
        sad(dmp_list)
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)


#Generate a plan from a DMP
def makePlanRequest(x_0, x_dot_0, t_0, goal, goal_thresh, 
                    seg_length, tau, dt, integrate_iter):
    print( "Starting DMP planning...")
    rospy.wait_for_service('get_dmp_plan')
    try:
        gdp = rospy.ServiceProxy('get_dmp_plan', GetDMPPlan)
        resp = gdp(x_0, x_dot_0, t_0, goal, goal_thresh, 
                   seg_length, tau, dt, integrate_iter)
           
    except rospy.ServiceException as e:
        print ("Service call failed: %s"%e)
        
    print ("DMP planning done"  )
            
    return resp;

############### funcions del dmp #############################
def dmp_plan(trajectory):
	
    #from joint traj to EE traj:
    ur3_arm = ur_kinematics.URKinematics('ur3')
    
    traj=trajectory
    
    	
    #Create a DMP from a 2-D trajectory now 3-D lin + 4 rot = 7
    dims = 6                
    dt = 0.2               
    K = 100    #y (2puntos) = k*(g-y)-D * y(punt)            
    D = 2.0 * np.sqrt(K) 
    BF=int(input('Number of basic functions to define dmp: '))  
    global num_bases   
    num_bases = BF  #number of basis functions        
    #traj = [[1.0,1.0,1.0],[2.0,2.0,2.0],[3.0,4.0, 4.0],[6.0,8.0,8.0]]
    #traj=trajectory
    #x_0=traj[0]           #first point of trajectory is the initial point 
    x_0=[0.59, -0.8916514792130137, 0.49900151046296237, -1.9991087146652537, -0.06040110934530851, -0.33549807422862177]
    for i in range(6):
    	query_joint=i+1
    	sys.stdout.write('joint me '+str(query_joint) +'\n')
    	query_position=x_0[i]
    	ur3_reach.publish_pos(ur3_reach.joints[query_joint], query_position)
    	result=ur3_reach.reach_destination(ur3_reach.joints[query_joint], query_position)
    #x_0=x_0[0:3]
    #goal=traj[-1]         #goal the last point of trajectory??????????????????????????
    goal=[0.59, -0.8916514792130137, -0.9, -1.9964930979464022, 0.19913231397479692, -0.3016474102027118]
    goal_trash = [0.59, -0.8916514792130137, 0.49900151046296237, -1.9991087146652537, -0.06, -0.3]
    
    #goal=goal[0:3]
    sys.stdout.write('x_0: '+format(x_0)+'\n'+'\n')
    sys.stdout.write('goal: '+format(goal)+'\n'+'\n')
    #sys.stdout.write('before remove traj: '+format(traj)+'\n'+'\n')
    traj.remove(traj[0])
    traj.remove(traj[-1])   #1st point removed from trajectory
    #sys.stdout.write('ater remove traj: '+format(traj)+'\n'+'\n')
    resp = makeLFDRequest(dims, traj, dt, K, D, num_bases)
    #sys.stdout.write('here the resp -> '+format(resp)+'\n')
    #sys.stdout.write('here the resp.dmp_list 0 '+format(resp.dmp_list[0])+'\n')
    #Set it as the active DMP
    makeSetActiveRequest(resp.dmp_list)

    #Now, generate a plan
     
    x_dot_0 = [0.0,0.0,0.0, 0.0, 0.0, 0.0, 0.0]   
    t_0 = 0                
    #goal = [8.0,7.0,8.0]         #Plan to a different goal than demo
    goal_thresh = [0.2,0.2,0.2, 0.2, 0.2, 0.2, 0.2]
    seg_length = -1          #Plan until convergence to goal
    tau = 2 * resp.tau       #Desired plan should take twice as long as demo
    dt = 0.5
    integrate_iter = 5       #dt is rather large, so this is > 1  
    plan = makePlanRequest(x_0, x_dot_0, t_0, goal, goal_thresh,                        seg_length, tau, dt, integrate_iter)
    #sys.stdout.write('plan crec: '+format(plan)+' \n')

    return plan
    
    
    
##############function to sent dmp points to robot ##############
def run_dmp(plan):
	ur3_arm = ur_kinematics.URKinematics('ur3')
	move=str(input('Start moving the robot? [y/n] '))
	if move == 'y' or move == 'Y':
		punts=plan.plan.points
		
		p_traj=[]
		v_traj=[]
		#per tema formats, que sino no va gaire bé jaja
		joint_angles=ur3_reach.pos['position']
		pose_quat = ur3_arm.forward(joint_angles)
		#pose_quat=np.array([0,0,0])
		print(pose_quat)
		sys.stdout.write('len(punts) '+format(len(punts))+'\n')
		for i in range(len(punts)):
			p_traj.append(punts[i].positions)
			v_traj.append(punts[i].velocities)
			#sys.stdout.write('punts de traj: '+format(punts[i].positions)+'\n')
		
		sys.stdout.write('p_traj '+format(p_traj)+'\n')
		
		for p in p_traj:
			sys.stdout.write('punto evaluado '+format(p)+'\n')
			sys.stdout.write('punto evaluado tipo '+format(type(p))+'\n')
			for i in range(6):
				query_joint=i+1
				sys.stdout.write('joint me '+str(query_joint) +'\n')
				query_position=p[i]
				sys.stdout.write('moved to '+str(query_position) +'\n')
				ur3_reach.publish_pos(ur3_reach.joints[query_joint], query_position)
				result=ur3_reach.reach_destination(ur3_reach.joints[query_joint], query_position)
				
				if result == False:
        				print('omfg')
        				sys.stdout.write('joint que falla '+format(query_joint)+'\n')
        				ur3_reach.publish_pos(ur3_reach.joints[2], 1.2)
        				ur3_reach.reach_destination(ur3_reach.joints[query_joint], query_position)
					#traballem amb els joints i no els punts finals
			
				
			
               	
            	

if __name__ == '__main__':
	rospy.init_node('ur3_reach_pose')
	ur3_reach = UR3Reach()
	
	#define a trajectory:
	traject=ur3_reach.runner_trajectory()
	#sys.stdout.write('trajectory: '+format(traject)+' \n')
	
	#with the trajectory, calls dmp services:
	plan=dmp_plan(traject)
	sys.stdout.write('trajectory '+format(traject)+'\n')
	sys.stdout.write('plaann: '+format(plan)+'\n'+'\n')
	#sent the points to the robot:
	run_dmp(plan)
	points_0=plan.plan.points
	type(points_0)

	
		
