; Auto-generated. Do not edit!


(cl:in-package movement_primitives-msg)


;//! \htmlinclude TPHSMMTrainMsg.msg.html

(cl:defclass <TPHSMMTrainMsg> (roslisp-msg-protocol:ros-message)
  ((tphsmm_name
    :reader tphsmm_name
    :initarg :tphsmm_name
    :type cl:string
    :initform "")
   (path_to_data
    :reader path_to_data
    :initarg :path_to_data
    :type cl:string
    :initform "")
   (num_demos
    :reader num_demos
    :initarg :num_demos
    :type cl:fixnum
    :initform 0)
   (num_frames
    :reader num_frames
    :initarg :num_frames
    :type cl:fixnum
    :initform 0))
)

(cl:defclass TPHSMMTrainMsg (<TPHSMMTrainMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TPHSMMTrainMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TPHSMMTrainMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_primitives-msg:<TPHSMMTrainMsg> is deprecated: use movement_primitives-msg:TPHSMMTrainMsg instead.")))

(cl:ensure-generic-function 'tphsmm_name-val :lambda-list '(m))
(cl:defmethod tphsmm_name-val ((m <TPHSMMTrainMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-msg:tphsmm_name-val is deprecated.  Use movement_primitives-msg:tphsmm_name instead.")
  (tphsmm_name m))

(cl:ensure-generic-function 'path_to_data-val :lambda-list '(m))
(cl:defmethod path_to_data-val ((m <TPHSMMTrainMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-msg:path_to_data-val is deprecated.  Use movement_primitives-msg:path_to_data instead.")
  (path_to_data m))

(cl:ensure-generic-function 'num_demos-val :lambda-list '(m))
(cl:defmethod num_demos-val ((m <TPHSMMTrainMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-msg:num_demos-val is deprecated.  Use movement_primitives-msg:num_demos instead.")
  (num_demos m))

(cl:ensure-generic-function 'num_frames-val :lambda-list '(m))
(cl:defmethod num_frames-val ((m <TPHSMMTrainMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-msg:num_frames-val is deprecated.  Use movement_primitives-msg:num_frames instead.")
  (num_frames m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TPHSMMTrainMsg>) ostream)
  "Serializes a message object of type '<TPHSMMTrainMsg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'tphsmm_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'tphsmm_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path_to_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path_to_data))
  (cl:let* ((signed (cl:slot-value msg 'num_demos)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'num_frames)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TPHSMMTrainMsg>) istream)
  "Deserializes a message object of type '<TPHSMMTrainMsg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tphsmm_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'tphsmm_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
      (cl:setf (cl:slot-value msg 'num_demos) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_frames) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TPHSMMTrainMsg>)))
  "Returns string type for a message object of type '<TPHSMMTrainMsg>"
  "movement_primitives/TPHSMMTrainMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TPHSMMTrainMsg)))
  "Returns string type for a message object of type 'TPHSMMTrainMsg"
  "movement_primitives/TPHSMMTrainMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TPHSMMTrainMsg>)))
  "Returns md5sum for a message object of type '<TPHSMMTrainMsg>"
  "e4144652d3d9743179c2af47f39a3c3f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TPHSMMTrainMsg)))
  "Returns md5sum for a message object of type 'TPHSMMTrainMsg"
  "e4144652d3d9743179c2af47f39a3c3f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TPHSMMTrainMsg>)))
  "Returns full string definition for message of type '<TPHSMMTrainMsg>"
  (cl:format cl:nil "string tphsmm_name~%string path_to_data~%int8 num_demos #How many of the demos from path_to_data do you want to use~%int8 num_frames #Number of important frames of reference in the demonstrations~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TPHSMMTrainMsg)))
  "Returns full string definition for message of type 'TPHSMMTrainMsg"
  (cl:format cl:nil "string tphsmm_name~%string path_to_data~%int8 num_demos #How many of the demos from path_to_data do you want to use~%int8 num_frames #Number of important frames of reference in the demonstrations~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TPHSMMTrainMsg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'tphsmm_name))
     4 (cl:length (cl:slot-value msg 'path_to_data))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TPHSMMTrainMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'TPHSMMTrainMsg
    (cl:cons ':tphsmm_name (tphsmm_name msg))
    (cl:cons ':path_to_data (path_to_data msg))
    (cl:cons ':num_demos (num_demos msg))
    (cl:cons ':num_frames (num_frames msg))
))
