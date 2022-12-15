; Auto-generated. Do not edit!


(cl:in-package movement_primitives-msg)


;//! \htmlinclude PrompQueryTrigger.msg.html

(cl:defclass <PrompQueryTrigger> (roslisp-msg-protocol:ros-message)
  ((promp_name
    :reader promp_name
    :initarg :promp_name
    :type cl:string
    :initform "")
   (input_dofs
    :reader input_dofs
    :initarg :input_dofs
    :type cl:fixnum
    :initform 0)
   (input
    :reader input
    :initarg :input
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass PrompQueryTrigger (<PrompQueryTrigger>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PrompQueryTrigger>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PrompQueryTrigger)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_primitives-msg:<PrompQueryTrigger> is deprecated: use movement_primitives-msg:PrompQueryTrigger instead.")))

(cl:ensure-generic-function 'promp_name-val :lambda-list '(m))
(cl:defmethod promp_name-val ((m <PrompQueryTrigger>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-msg:promp_name-val is deprecated.  Use movement_primitives-msg:promp_name instead.")
  (promp_name m))

(cl:ensure-generic-function 'input_dofs-val :lambda-list '(m))
(cl:defmethod input_dofs-val ((m <PrompQueryTrigger>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-msg:input_dofs-val is deprecated.  Use movement_primitives-msg:input_dofs instead.")
  (input_dofs m))

(cl:ensure-generic-function 'input-val :lambda-list '(m))
(cl:defmethod input-val ((m <PrompQueryTrigger>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-msg:input-val is deprecated.  Use movement_primitives-msg:input instead.")
  (input m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PrompQueryTrigger>) ostream)
  "Serializes a message object of type '<PrompQueryTrigger>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'promp_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'promp_name))
  (cl:let* ((signed (cl:slot-value msg 'input_dofs)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'input))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'input))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PrompQueryTrigger>) istream)
  "Deserializes a message object of type '<PrompQueryTrigger>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'promp_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'promp_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'input_dofs) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'input) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'input)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PrompQueryTrigger>)))
  "Returns string type for a message object of type '<PrompQueryTrigger>"
  "movement_primitives/PrompQueryTrigger")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PrompQueryTrigger)))
  "Returns string type for a message object of type 'PrompQueryTrigger"
  "movement_primitives/PrompQueryTrigger")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PrompQueryTrigger>)))
  "Returns md5sum for a message object of type '<PrompQueryTrigger>"
  "2a147e77dd4851c94b12ecfd24c9afb4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PrompQueryTrigger)))
  "Returns md5sum for a message object of type 'PrompQueryTrigger"
  "2a147e77dd4851c94b12ecfd24c9afb4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PrompQueryTrigger>)))
  "Returns full string definition for message of type '<PrompQueryTrigger>"
  (cl:format cl:nil "string promp_name~%int8 input_dofs~%float32[] input~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PrompQueryTrigger)))
  "Returns full string definition for message of type 'PrompQueryTrigger"
  (cl:format cl:nil "string promp_name~%int8 input_dofs~%float32[] input~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PrompQueryTrigger>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'promp_name))
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'input) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PrompQueryTrigger>))
  "Converts a ROS message object to a list"
  (cl:list 'PrompQueryTrigger
    (cl:cons ':promp_name (promp_name msg))
    (cl:cons ':input_dofs (input_dofs msg))
    (cl:cons ':input (input msg))
))
