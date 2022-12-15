#ifndef KINENIK_UR_H
#define KINENIK_UR_H

#include "kinenik.h"

/* This class encapsulate all the funcionality for kinematics of Universal Robot (UR3, UR5 and UR10)
 * */
//
using JointPos = std::array<double,6>;
enum URType{ UR3, UR5, UR10, UR3e, UR5e, UR10e, UR16e};

//A UR3 JointPos, that can be valid or not
struct Solution {
     Solution() : valid(false) {}
     bool valid;
     JointPos theta;
};

class KinenikUR
{
private:
  URType model;
  std::array<double, 6> alpha;
  std::array<double, 6> a;
  std::array<double, 6> d;
  std::array<double, 6> offset;
  std::array<double, 6> low_limit;
  std::array<double, 6> high_limit;
  std::array<std::string,6> joint_name;

  std::map<std::string,URType> list_names;
  std::vector<std::string> robot_names;
  // transform base -> base_link
  Eigen::AffineCompact3d Tbase_2_base_link;
  Eigen::AffineCompact3d invTbase_2_base_link;

  //Returns false if x is not in the interval [xmin-tol, xmax+tol]
  //Otherwise, returns true and x is adjuesteb to be in the interval [xmin, xmax]
  bool inInterval(double &x, const double xmin, const double xmax, const double tol = 1e-6);


  //Adjusts the specified joint value to be the nearest one next to the
  //reference, in the physically achievable interval
  void adjust(double &theta, const double theta_ref);

  //Returns theta in the [-pi, pi] interval
  double saturate(double theta);

  //Solves the UR3 inverse kinematics for the 3rd and 4th joints
  //and decides if the solution is valid
  //joint value will be the nearest one next to the reference
  void findTheta34(const Eigen::AffineCompact3d &transform, Solution *solution,
                    const JointPos &theta_min,
                    const JointPos &theta_max,
                    const double s5, const double c5, const double s6, const double c6,
                    const double  x, const double  y);


  //Solves the UR3 inverse kinematics for the 6th joint and the two possible values of the 2nd joint
  //and calls the function of the next joints to be found
  //joint value will be the nearest one next to the reference
  void findTheta62(const Eigen::AffineCompact3d &transform, Solution *solution,
                    const JointPos &theta_ref,
                    const JointPos &theta_min,
                    const JointPos &theta_max,
                    const double s1, const double c1, const double tol = 1e-6);


  //Solves the UR3 inverse kinematics for the two possible values of the 5th joint
  //and calls the function of the next joints to be found
  //joint value will be the nearest one next to the reference
  void findTheta5(const Eigen::AffineCompact3d &transform, Solution *solution,
                   const JointPos &theta_ref,
                   const JointPos &theta_min,
                   const JointPos &theta_max);


  //Solves the UR3 inverse kinematics for the two possible values of the 1st joint
  //and calls the function of the next joints to be found
  //joint value will be the nearest one next to the reference
  void findTheta1(const Eigen::AffineCompact3d &transform, Solution *solution,
                   const JointPos &theta_ref,
                   const JointPos &theta_min,
                   const JointPos &theta_max);

  // Return Eigen::AffineCompact3d from X, Y, Z, RX, RY, RZ
  Eigen::AffineCompact3d getTransfromData(const double x, const double y, const double z,
                                                     const double eulerX, const double eulerY, const double eulerZ);

  // Return Eigen::AffineCompact3d from X, Y, Z and Quaternion Qx, Qy, Qz, Qw
  Eigen::AffineCompact3d getTransfromData(const double x, const double y, const double z,
                                                     const double qx, const double qy, const double qz, const double qw);

  // init the class to _model
  void init();

public:
    KinenikUR(URType _model);
    KinenikUR(std::string _model);
    KinenikUR();
    ~KinenikUR();

    // set type of a robot
    bool setType(std::string _model);
    // init the class to _model
    void setType(URType _model);


    //Solves the inverse kinematics to place the TCP in the given pose
    //Returns all possible valid solutions
    // transform is refered wrt base_link
    // this function is deprecated
    bool solveIK(const Eigen::AffineCompact3d &transform,
                      std::vector<JointPos> &theta,
                      const JointPos &theta_ref,
                      const JointPos &theta_min,
                      const JointPos &theta_max);


    //Solves the inverse kinematics to place the TCP in the given pose
    //Returns all possible valid solutions in the std::vector theta
    //retuns true if have found some pose, else false.
    // TCP is wrt base!!!
    bool solveIK(const Eigen::AffineCompact3d &tcp_pose, std::vector<JointPos> &theta);

    //Solves the inverse kinematics to place the TCP in the given pose
    // pose is provided by X, Y, Z, RX, RY, RZ as the teach pendant shows
    // so, TCP is refered wrt base
    //Returns all possible valid solutions in the std::vector theta
    //retuns true if have found some pose, else false.
    bool solveIK(const double x, const double y, const double z,
                 const double eulerX, const double eulerY, const double eulerZ,
                 std::vector<JointPos> &theta);

    //Solves the inverse kinematics to place the TCP in the given pose
    // pose is provided by X, Y, Z, and Quaternion Qx, Qy, Qz and Qw
    // so, TCP is refered wrt base
    //Returns all possible valid solutions in the std::vector theta
    //retuns true if have found some pose, else false.
    bool solveIK(const double x, const double y, const double z,
                            const double qx, const double qy, const double qz, const double qw,
                            std::vector<JointPos> &theta);

    // Debug function
    // Print solutions
    void printSolution(std::vector<JointPos> &theta);

};
#endif // KINENIK_UR_H


