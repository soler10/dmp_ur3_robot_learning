; Auto-generated. Do not edit!


(cl:in-package movement_primitives-msg)


;//! \htmlinclude PrompTrainMsg.msg.html

(cl:defclass <PrompTrainMsg> (roslisp-msg-protocol:ros-message)
  ((promp_name
    :reader promp_name
    :initarg :promp_name
    :type cl:string
    :initform "")
   (path_to_data
    :reader path_to_data
    :initarg :path_to_data
    :type cl:string
    :initform "")
   (sensor_dofs
    :reader sensor_dofs
    :initarg :sensor_dofs
    :type cl:fixnum
    :initform 0)
   (robot_dofs
    :reader robot_dofs
    :initarg :robot_dofs
    :type cl:fixnum
    :initform 0))
)

(cl:defclass PrompTrainMsg (<PrompTrainMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PrompTrainMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PrompTrainMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_primitives-msg:<PrompTrainMsg> is deprecated: use movement_primitives-msg:PrompTrainMsg instead.")))

(cl:ensure-generic-function 'promp_name-val :lambda-list '(m))
(cl:defmethod promp_name-val ((m <PrompTrainMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-msg:promp_name-val is deprecated.  Use movement_primitives-msg:promp_name instead.")
  (promp_name m))

(cl:ensure-generic-function 'path_to_data-val :lambda-list '(m))
(cl:defmethod path_to_data-val ((m <PrompTrainMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-msg:path_to_data-val is deprecated.  Use movement_primitives-msg:path_to_data instead.")
  (path_to_data m))

(cl:ensure-generic-function 'sensor_dofs-val :lambda-list '(m))
(cl:defmethod sensor_dofs-val ((m <PrompTrainMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-msg:sensor_dofs-val is deprecated.  Use movement_primitives-msg:sensor_dofs instead.")
  (sensor_dofs m))

(cl:ensure-generic-function 'robot_dofs-val :lambda-list '(m))
(cl:defmethod robot_dofs-val ((m <PrompTrainMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-msg:robot_dofs-val is deprecated.  Use movement_primitives-msg:robot_dofs instead.")
  (robot_dofs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PrompTrainMsg>) ostream)
  "Serializes a message object of type '<PrompTrainMsg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'promp_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'promp_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path_to_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path_to_data))
  (cl:let* ((signed (cl:slot-value msg 'sensor_dofs)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'robot_dofs)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PrompTrainMsg>) istream)
  "Deserializes a message object of type '<PrompTrainMsg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'promp_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'promp_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'path_to_data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'path_to_data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensor_dofs) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_dofs) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PrompTrainMsg>)))
  "Returns string type for a message object of type '<PrompTrainMsg>"
  "movement_primitives/PrompTrainMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PrompTrainMsg)))
  "Returns string type for a message object of type 'PrompTrainMsg"
  "movement_primitives/PrompTrainMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PrompTrainMsg>)))
  "Returns md5sum for a message object of type '<PrompTrainMsg>"
  "4ac2b3de384f10c19d662ca80d3020f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PrompTrainMsg)))
  "Returns md5sum for a message object of type 'PrompTrainMsg"
  "4ac2b3de384f10c19d662ca80d3020f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PrompTrainMsg>)))
  "Returns full string definition for message of type '<PrompTrainMsg>"
  (cl:format cl:nil "string promp_name~%string path_to_data~%int8 sensor_dofs #Number of individual numbers in the sensor input~%int8 robot_dofs #Number of controllable robot joints~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PrompTrainMsg)))
  "Returns full string definition for message of type 'PrompTrainMsg"
  (cl:format cl:nil "string promp_name~%string path_to_data~%int8 sensor_dofs #Number of individual numbers in the sensor input~%int8 robot_dofs #Number of controllable robot joints~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PrompTrainMsg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'promp_name))
     4 (cl:length (cl:slot-value msg 'path_to_data))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PrompTrainMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'PrompTrainMsg
    (cl:cons ':promp_name (promp_name msg))
    (cl:cons ':path_to_data (path_to_data msg))
    (cl:cons ':sensor_dofs (sensor_dofs msg))
    (cl:cons ':robot_dofs (robot_dofs msg))
))
