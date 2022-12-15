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
        
        # Set rate
        self.rate = rospy.Rate(10)
        a=np.array([3])


        
        
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
    	
    	
    def define_trajectory(self):
    	ur3e_arm = ur_kinematics.URKinematics('ur3')
    	stop = 0
    	list_pose=[]
    	while not rospy.is_shutdown():
    		i=0
    		while 1 < 50:
    			trans, rot = self.listener.lookupTransform("base_link", 'wrist_3_link', rospy.Time(0))
    			# Round numbers in the lists for 'nicer' printing
    			trans =  [round(x, 4) for x in trans]
    			rot =  [round(x, 4) for x in rot]
    			list_pose.append(trans)
    			
	    		#self.get_pose_listener()
	    		#joint_angles=self.pos['position']
	    		#pose_quat = ur3e_arm.forward(joint_angles)
	    		#list_pose.append(pose_quad)
	    		#sys.stdout.write('pose_quad: '+ format(pose_quat)+'\n')
	    		#sys.stdout.write('ja'+'\n')
	    		#rospy.sleep(1)
    		if i > 49:
    			sys.stdout.write('trajectory: '+ format(list_pose)+'\n')
    		
    	
    

if __name__ == '__main__':
	try:
		rospy.init_node('ur3_traj')
		ur3_reach = UR3Reach()
		ur3_reach.define_trajectory() #copi also get_pose_listener and state_callback2
	except rospy.ROSInterruptException:
		pass
    		
    	
    	
    	
    	
	
 
    
