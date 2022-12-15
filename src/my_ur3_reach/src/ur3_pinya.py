#!/usr/bin/env python3

import sys
import rospy
import time
from std_msgs.msg import Float64
from control_msgs.msg import JointControllerState
import tf
from ur_ikfast import ur_kinematics


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
        # Initialize TF listener
        self.listener = tf.TransformListener()
        # Run publishers
        [rospy.Publisher('/ur3/' + v + '_position_controller/command',
         Float64, queue_size=1) for v in self.joints.values()]
        # Set rate
        self.rate = rospy.Rate(10)

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
   
   
    def get_pose(self, joint):
    	joint=str(joint)
    	topic = '/ur3/' + joint + '_position_controller/state'
    	sub = rospy.Subscriber(topic, JointControllerState, self.state_callback)
    	# Make sure the subscriber has information
    	while not self.joint:
            self.rate.sleep()
    	# Make sure the final pose matches the query
    	set_p= self.joint['set_point']
    	return set_p
    	sub.unregister()



    def publish_pos(self, joint, query):

        """ Creates a publisher to a given joint and sends
        the desired position of it.
        :return:
        """

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

    def runner(self):

        """ Main executor. The program runs until it's interrupted. """

        query = 1
        #raw_input('Please, press <enter> to run the program...')
        # Clean terminal
        sys.stderr.write("\x1b[2J\x1b[H")
        while not rospy.is_shutdown():
            #menu showing diff poses or limit reachable space:
            # get desired pose
            sys.stdout.write('Here we are on the play field\n')
            x_pos = input('position relative to base x: ')
            y_pos = input('position relative to base y: ')
            z_pos = input('position relative to base z: ')
            sys.stdout.write('position: '+x_pos+' '+y_pos+' '+z_pos)
            
            
            #porva 
            query_joint=4
            query_position=0
            
            self.publish_pos(self.joints[query_joint], query_position)
            self.reach_destination(self.joints[query_joint], query_position)
            # Position (x, y, z) and orientation in quaternion (x, y, z, w)
            trans, rot = self.listener.lookupTransform("base_link", 'wrist_3_link', rospy.Time(0))
            # Round numbers in the lists for 'nicer' printing
            trans =  [round(x, 4) for x in trans]
            rot =  [round(x, 4) for x in rot]
            # Show summary
            self.print_summary_report(trans, rot)
            sys.stdout.rite('dicc joints de la 3: '+ self.joint['process_value']+'\n') 
            	
            	
            	
            #working mode 
            mode=input('Enter the mode: 1 normal, 2 for try')
            mode = int(mode)
            if mode > 2:
            	mode = 1
            if mode == 1:
            	self.print_menu_choices(query)
            	# User inputs
            	query_joint = input('Enter the associated number: ')
            	query_joint = int(query_joint)
            	# Check number is in menu
            	llista=self.joints
            	rospy.loginfo("llista")
            	rospy.loginfo(llista)
            	rospy.loginfo(query_joint in llista)
            	rospy.loginfo(self.joints[query_joint])
            	if query_joint not in self.joints.keys():
                	sys.stdout.write('\033[1;31m') # Print in RED
                	sys.stdout.write('\r' + 'Please, enter a valid number.' + '\n')
                	sys.stdout.write('\033[0;0m') # Reset color
                	continue
            # Ask set-point
            	query_position = input('Enter the position to move this joint to: ')
            	#query_position = input('Enter the position to move this joint '+str(query_joint)+' aka '+str(llista[query_joint])+' to: ')
            	query_position=float(query_position)
            	if query_position > 6.283:
            		query_position = 6.23
            	
            	self.publish_pos(self.joints[query_joint], query_position)
            	
            	self.reach_destination(self.joints[query_joint], query_position)
            	
            	# Position (x, y, z) and orientation in quaternion (x, y, z, w)
            	
            	trans, rot = self.listener.lookupTransform("base_link", 'wrist_3_link', rospy.Time(0))
            	# Round numbers in the lists for 'nicer' printing
            	trans =  [round(x, 4) for x in trans]
            	rot =  [round(x, 4) for x in rot]
            	# Show summary
            	self.print_summary_report(trans, rot)
            	# Update query counter
            	query += 1
            	
            else:
            	sys.stdout.write('Here we are on the play field\n')
            	x_pos = input('position relative to base x: ')
            	y_pos = input('position relative to base y: ')
            	z_pos = input('position relative to base z: ')
            	sys.stdout.write('position: '+x_pos+' '+y_pos+' '+z_pos)
            	
            	
            	ur3e_arm = ur_kinematics.URKinematics('ur3')
            	
            	trans, rot = self.listener.lookupTransform("base_link", 'wrist_3_link', rospy.Time(0))
            	trans =  [round(x, 4) for x in trans]
            	sys.stdout.write('\r' +'trans = '+format(trans)+'\n')
            	sys.stdout.write('enviar x a '+format(trans[0])+'\n')
            	#rospy.loginfo("pose de la 0: "+ p_0)
            	joint_angles = [1., -1.6, 1.6, -1.6, -1.6, 0.]  # in radians
            	#print("joint angles", joint_angles)
            	pose_quat = ur3e_arm.forward(joint_angles)
            	pose_matrix = ur3e_arm.forward(joint_angles, 'matrix')
            	#print("forward() quaternion \n", pose_quat)
            	#print("forward() matrix \n", pose_matrix)
            	sys.stdout.write('coses del ur3e_arm.inverse\n')
            	print("inverse() all", ur3e_arm.inverse(pose_quat, True))
            	print("inverse() one from quat", ur3e_arm.inverse(pose_quat, False, q_guess=joint_angles))
            	#print("inverse() one from matrix", ur3e_arm.inverse(pose_matrix, False, q_guess=joint_angles))
            
               	
            	

if __name__ == '__main__':
    try:
        rospy.init_node('ur3_reach_pose')
        ur3_reach = UR3Reach()
        ur3_reach.runner()
    except rospy.ROSInterruptException:
        pass
