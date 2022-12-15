; Auto-generated. Do not edit!


(cl:in-package movement_primitives-msg)


;//! \htmlinclude RobotTraj.msg.html

(cl:defclass <RobotTraj> (roslisp-msg-protocol:ros-message)
  ((robot_dofs
    :reader robot_dofs
    :initarg :robot_dofs
    :type cl:fixnum
    :initform 0)
   (traj
    :reader traj
    :initarg :traj
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass RobotTraj (<RobotTraj>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotTraj>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotTraj)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_primitives-msg:<RobotTraj> is deprecated: use movement_primitives-msg:RobotTraj instead.")))

(cl:ensure-generic-function 'robot_dofs-val :lambda-list '(m))
(cl:defmethod robot_dofs-val ((m <RobotTraj>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-msg:robot_dofs-val is deprecated.  Use movement_primitives-msg:robot_dofs instead.")
  (robot_dofs m))

(cl:ensure-generic-function 'traj-val :lambda-list '(m))
(cl:defmethod traj-val ((m <RobotTraj>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-msg:traj-val is deprecated.  Use movement_primitives-msg:traj instead.")
  (traj m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotTraj>) ostream)
  "Serializes a message object of type '<RobotTraj>"
  (cl:let* ((signed (cl:slot-value msg 'robot_dofs)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'traj))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'traj))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotTraj>) istream)
  "Deserializes a message object of type '<RobotTraj>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_dofs) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'traj) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'traj)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotTraj>)))
  "Returns string type for a message object of type '<RobotTraj>"
  "movement_primitives/RobotTraj")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotTraj)))
  "Returns string type for a message object of type 'RobotTraj"
  "movement_primitives/RobotTraj")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotTraj>)))
  "Returns md5sum for a message object of type '<RobotTraj>"
  "0a5c2376d2b17933b7131c7de868f64e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotTraj)))
  "Returns md5sum for a message object of type 'RobotTraj"
  "0a5c2376d2b17933b7131c7de868f64e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotTraj>)))
  "Returns full string definition for message of type '<RobotTraj>"
  (cl:format cl:nil "int8 robot_dofs~%float32[] traj  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotTraj)))
  "Returns full string definition for message of type 'RobotTraj"
  (cl:format cl:nil "int8 robot_dofs~%float32[] traj  ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotTraj>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'traj) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotTraj>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotTraj
    (cl:cons ':robot_dofs (robot_dofs msg))
    (cl:cons ':traj (traj msg))
))
