#!/usr/bin/env python3

import sys
import rospy
import time
from std_msgs.msg import Float64
from control_msgs.msg import JointControllerState
from sensor_msgs.msg import JointState
import tf
from ur_ikfast import ur_kinematics
import roboticstoolbox as rtb
import numpy as np



class UR3Reach():

    """ Move a robot joint to a given position. """

    def __init__(self):

        # Menu choices
        self.joints = {
            1: 'shoulder_pan_joint',
            2: 'shoulder_lift_joint',
            3: 'elbow_joint',
            4: 'wrist_1_joint',
            5: 'wrist_2_joint',
            6: 'wrist_3_joint'
        }
        # Initialize a dictionary to store joint position/set_point/error
        self.joint = {}
        self.pos={}
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
        result = self.wait_for_confirmation(timeout=5, max_error=5e-3)
        if not result:
            rospy.logwarn("Max timeout! Joint couldn't reach destination point.")
        # Unsubscribe to the topic until next call
        sub.unregister()
        #self.reach_destination(self.joints[query_joint], query_position)
   
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
    
    
    
    def get_pose_listener(self):
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

    	
    	   
    def define_trajectory(self):
    	ur3e_arm = ur_kinematics.URKinematics('ur3')
    	while not rospy.is_shutdown():
    		self.get_pose_listener()
    		joint_angles=self.pos['position']
    		pose_quat = ur3e_arm.forward(joint_angles)
    		sys.stdout.write('pose_quad: '+ format(pose_quat)+'\n')
    		sys.stdout.write('ja'+'\n')
    		#rospy.sleep(1)    
    
    

    	
    	
	


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

    def runner(self):

        """ Main executor. The program runs until it's interrupted. """

        query = 1
        ur3e_arm = ur_kinematics.URKinematics('ur3')
        ###############################################################################
        #Configure the initial point
        self.get_pose()
        joint_angles=self.pos['position']
        pose_quat = ur3e_arm.forward(joint_angles)
        pose_quat[0]=0.5
        pose_quat[1]=0.01
        pose_quat[2]=0.03
        new_pos=ur3e_arm.inverse(pose_quat, True)
        sucre=new_pos
        for i in range(6):
        	query_joint=i+1
        	query_position=pose_quat[i]
        	self.publish_pos(self.joints[query_joint], query_position)
        
        
        #raw_input('Please, press <enter> to run the program...')
        self.get_pose()
        joint_angles_ini=self.pos['position']
        #sys.stderr.write("\x1b[2J\x1b[H")
        while not rospy.is_shutdown():

            
            
            self.print_menu_choices(query)
            trans, rot = self.listener.lookupTransform("base_link", 'wrist_3_link', rospy.Time(0))
            trans =  [round(x, 4) for x in trans]
            rot =  [round(x, 4) for x in rot]
            sys.stdout.write('\r' + '=> Actual position of the end effector relative to the base {}'.format(trans) + '\n' +'=> Actual orientation of the end effector relative to the base {}'.format(rot) + '\n')
            query_joint = int(input('Enter the associated number: '))
            # Check number is in menu
            llista=self.joints
            
            
            #rospy.loginfo(self.joints[query_joint])
            query_joint = int(query_joint)
            if query_joint not in self.joints.keys():
                sys.stdout.write('\033[1;31m') # Print in RED
                sys.stdout.write('\r' + 'Please, enter a valid number.' + '\n')
                sys.stdout.write('\033[0;0m') # Reset color

                continue
            # Ask set-point
            move= str(input('Enter up or down: [u/d]: '))
            #troba ultima join value
            ###########################################################################################3################################
            #trobar la puta query position!!!!!
            self.get_pose()
            joint_angles_ini=self.pos['position']
            query_position=joint_angles[query_joint-1]
            #query_position=joint
            sys.stdout.write('query_position'+format(query_position))
            if move == 'u':
            	query_position = query_position + 0.05
            else:
            	query_position=query_position - 0.05
            	
            query_position=float(query_position)
            # Send position to robot
            self.publish_pos(self.joints[query_joint], query_position)
            self.reach_destination(self.joints[query_joint], query_position)
            # Position (x, y, z) and orientation in quaternion (x, y, z, w)
            trans, rot = self.listener.lookupTransform(
                        "base_link", 'wrist_3_link', rospy.Time(0)
                        )
            # Round numbers in the lists for 'nicer' printing
            trans =  [round(x, 4) for x in trans]
            rot =  [round(x, 4) for x in rot]
            # Show summary
            self.print_summary_report(trans, rot)
            # Update query counter
            query += 1
            
 
            
               	
            	

if __name__ == '__main__':
    try:
        rospy.init_node('ur3_reach_pose')
        ur3_reach = UR3Reach()
        ur3_reach.runner()
    except rospy.ROSInterruptException:
        pass
