#include <ros/ros.h>
#include <sensor_msgs/JointState.h>


double deltaPan;
double deltaTilt;
double scale;
const double degree2rad = M_PI/180;

int main(int argc, char **argv)
{
  ros::init(argc, argv, "urdf_tutorial");
  ros::NodeHandle n;

  //The node advertises the joint values of the pan-tilt
  ros::Publisher joint_pub = n.advertise<sensor_msgs::JointState>("joint_states", 1);

  ros::Rate loop_rate(30);

  // message declarations
  sensor_msgs::JointState joint_state;
  joint_state.name.resize(10);
  joint_state.position.resize(10);
  double pan = 0.0;
  double tilt = 0.0;

  deltaPan = 0.0;
  deltaTilt = 0.0;
  scale =0.5;
  //define joint names
  joint_state.name[0]="bottom_joint";
  joint_state.name[1]="shoulder_pan_joint";
  joint_state.name[2]="shoulder_pitch_joint";
  joint_state.name[3]="elbow_roll_joint";
  joint_state.name[4]="elbow_pitch_joint";
  joint_state.name[5]="wrist_roll_joint";
  joint_state.name[6]="wrist_pitch_joint";
  joint_state.name[7]="gripper_roll_joint";
  joint_state.name[8]="finger_joint1";
  joint_state.name[9]="finger_joint2";
  //set intial positions
  joint_state.position[0]=0;
  joint_state.position[1]=0;
  joint_state.position[2]=0;
  joint_state.position[3]=0;
  joint_state.position[4]=0;
  joint_state.position[5]=0;
  joint_state.position[6]=0;
  joint_state.position[7]=0;
  joint_state.position[8]=0;
  joint_state.position[9]=0;



  while (ros::ok())
  {
      //moving one degree
      deltaPan =  degree2rad * scale;
      deltaTilt = degree2rad * scale;

      pan = pan + deltaPan;
      tilt = tilt + deltaTilt;

      //update joint_state
      joint_state.header.stamp = ros::Time::now();

      joint_state.position[0] = pan;

      joint_state.position[1] = tilt;

      //send the joint state
      joint_pub.publish(joint_state);

      loop_rate.sleep();
  }
  return 0;
}
