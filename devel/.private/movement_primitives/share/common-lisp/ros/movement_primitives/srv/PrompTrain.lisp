; Auto-generated. Do not edit!


(cl:in-package movement_primitives-srv)


;//! \htmlinclude PrompTrain-request.msg.html

(cl:defclass <PrompTrain-request> (roslisp-msg-protocol:ros-message)
  ((promp_name
    :reader promp_name
    :initarg :promp_name
    :type cl:string
    :initform ""))
)

(cl:defclass PrompTrain-request (<PrompTrain-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PrompTrain-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PrompTrain-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_primitives-srv:<PrompTrain-request> is deprecated: use movement_primitives-srv:PrompTrain-request instead.")))

(cl:ensure-generic-function 'promp_name-val :lambda-list '(m))
(cl:defmethod promp_name-val ((m <PrompTrain-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-srv:promp_name-val is deprecated.  Use movement_primitives-srv:promp_name instead.")
  (promp_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PrompTrain-request>) ostream)
  "Serializes a message object of type '<PrompTrain-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'promp_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'promp_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PrompTrain-request>) istream)
  "Deserializes a message object of type '<PrompTrain-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'promp_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'promp_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PrompTrain-request>)))
  "Returns string type for a service object of type '<PrompTrain-request>"
  "movement_primitives/PrompTrainRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PrompTrain-request)))
  "Returns string type for a service object of type 'PrompTrain-request"
  "movement_primitives/PrompTrainRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PrompTrain-request>)))
  "Returns md5sum for a message object of type '<PrompTrain-request>"
  "bae4a804188261b587b4284e77e5b0ba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PrompTrain-request)))
  "Returns md5sum for a message object of type 'PrompTrain-request"
  "bae4a804188261b587b4284e77e5b0ba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PrompTrain-request>)))
  "Returns full string definition for message of type '<PrompTrain-request>"
  (cl:format cl:nil "string promp_name~%#string path_to_training_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PrompTrain-request)))
  "Returns full string definition for message of type 'PrompTrain-request"
  (cl:format cl:nil "string promp_name~%#string path_to_training_data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PrompTrain-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'promp_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PrompTrain-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PrompTrain-request
    (cl:cons ':promp_name (promp_name msg))
))
;//! \htmlinclude PrompTrain-response.msg.html

(cl:defclass <PrompTrain-response> (roslisp-msg-protocol:ros-message)
  ((traj_data
    :reader traj_data
    :initarg :traj_data
    :type std_msgs-msg:UInt32MultiArray
    :initform (cl:make-instance 'std_msgs-msg:UInt32MultiArray)))
)

(cl:defclass PrompTrain-response (<PrompTrain-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PrompTrain-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PrompTrain-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name movement_primitives-srv:<PrompTrain-response> is deprecated: use movement_primitives-srv:PrompTrain-response instead.")))

(cl:ensure-generic-function 'traj_data-val :lambda-list '(m))
(cl:defmethod traj_data-val ((m <PrompTrain-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader movement_primitives-srv:traj_data-val is deprecated.  Use movement_primitives-srv:traj_data instead.")
  (traj_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PrompTrain-response>) ostream)
  "Serializes a message object of type '<PrompTrain-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'traj_data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PrompTrain-response>) istream)
  "Deserializes a message object of type '<PrompTrain-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'traj_data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PrompTrain-response>)))
  "Returns string type for a service object of type '<PrompTrain-response>"
  "movement_primitives/PrompTrainResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PrompTrain-response)))
  "Returns string type for a service object of type 'PrompTrain-response"
  "movement_primitives/PrompTrainResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PrompTrain-response>)))
  "Returns md5sum for a message object of type '<PrompTrain-response>"
  "bae4a804188261b587b4284e77e5b0ba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PrompTrain-response)))
  "Returns md5sum for a message object of type 'PrompTrain-response"
  "bae4a804188261b587b4284e77e5b0ba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PrompTrain-response>)))
  "Returns full string definition for message of type '<PrompTrain-response>"
  (cl:format cl:nil "#uint32 step~%#uint32[] traj_data~%std_msgs/UInt32MultiArray traj_data~%~%~%================================================================================~%MSG: std_msgs/UInt32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%uint32[]          data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PrompTrain-response)))
  "Returns full string definition for message of type 'PrompTrain-response"
  (cl:format cl:nil "#uint32 step~%#uint32[] traj_data~%std_msgs/UInt32MultiArray traj_data~%~%~%================================================================================~%MSG: std_msgs/UInt32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%uint32[]          data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PrompTrain-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'traj_data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PrompTrain-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PrompTrain-response
    (cl:cons ':traj_data (traj_data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PrompTrain)))
  'PrompTrain-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PrompTrain)))
  'PrompTrain-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PrompTrain)))
  "Returns string type for a service object of type '<PrompTrain>"
  "movement_primitives/PrompTrain")