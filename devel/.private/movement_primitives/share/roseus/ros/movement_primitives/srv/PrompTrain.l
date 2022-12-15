;; Auto-generated. Do not edit!


(when (boundp 'movement_primitives::PrompTrain)
  (if (not (find-package "MOVEMENT_PRIMITIVES"))
    (make-package "MOVEMENT_PRIMITIVES"))
  (shadow 'PrompTrain (find-package "MOVEMENT_PRIMITIVES")))
(unless (find-package "MOVEMENT_PRIMITIVES::PROMPTRAIN")
  (make-package "MOVEMENT_PRIMITIVES::PROMPTRAIN"))
(unless (find-package "MOVEMENT_PRIMITIVES::PROMPTRAINREQUEST")
  (make-package "MOVEMENT_PRIMITIVES::PROMPTRAINREQUEST"))
(unless (find-package "MOVEMENT_PRIMITIVES::PROMPTRAINRESPONSE")
  (make-package "MOVEMENT_PRIMITIVES::PROMPTRAINRESPONSE"))

(in-package "ROS")



(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass movement_primitives::PrompTrainRequest
  :super ros::object
  :slots (_promp_name ))

(defmethod movement_primitives::PrompTrainRequest
  (:init
   (&key
    ((:promp_name __promp_name) "")
    )
   (send-super :init)
   (setq _promp_name (string __promp_name))
   self)
  (:promp_name
   (&optional __promp_name)
   (if __promp_name (setq _promp_name __promp_name)) _promp_name)
  (:serialization-length
   ()
   (+
    ;; string _promp_name
    4 (length _promp_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _promp_name
       (write-long (length _promp_name) s) (princ _promp_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _promp_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _promp_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass movement_primitives::PrompTrainResponse
  :super ros::object
  :slots (_traj_data ))

(defmethod movement_primitives::PrompTrainResponse
  (:init
   (&key
    ((:traj_data __traj_data) (instance std_msgs::UInt32MultiArray :init))
    )
   (send-super :init)
   (setq _traj_data __traj_data)
   self)
  (:traj_data
   (&rest __traj_data)
   (if (keywordp (car __traj_data))
       (send* _traj_data __traj_data)
     (progn
       (if __traj_data (setq _traj_data (car __traj_data)))
       _traj_data)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/UInt32MultiArray _traj_data
    (send _traj_data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/UInt32MultiArray _traj_data
       (send _traj_data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/UInt32MultiArray _traj_data
     (send _traj_data :deserialize buf ptr-) (incf ptr- (send _traj_data :serialization-length))
   ;;
   self)
  )

(defclass movement_primitives::PrompTrain
  :super ros::object
  :slots ())

(setf (get movement_primitives::PrompTrain :md5sum-) "bae4a804188261b587b4284e77e5b0ba")
(setf (get movement_primitives::PrompTrain :datatype-) "movement_primitives/PrompTrain")
(setf (get movement_primitives::PrompTrain :request) movement_primitives::PrompTrainRequest)
(setf (get movement_primitives::PrompTrain :response) movement_primitives::PrompTrainResponse)

(defmethod movement_primitives::PrompTrainRequest
  (:response () (instance movement_primitives::PrompTrainResponse :init)))

(setf (get movement_primitives::PrompTrainRequest :md5sum-) "bae4a804188261b587b4284e77e5b0ba")
(setf (get movement_primitives::PrompTrainRequest :datatype-) "movement_primitives/PrompTrainRequest")
(setf (get movement_primitives::PrompTrainRequest :definition-)
      "string promp_name
#string path_to_training_data
---
#uint32 step
#uint32[] traj_data
std_msgs/UInt32MultiArray traj_data


================================================================================
MSG: std_msgs/UInt32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
uint32[]          data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
")

(setf (get movement_primitives::PrompTrainResponse :md5sum-) "bae4a804188261b587b4284e77e5b0ba")
(setf (get movement_primitives::PrompTrainResponse :datatype-) "movement_primitives/PrompTrainResponse")
(setf (get movement_primitives::PrompTrainResponse :definition-)
      "string promp_name
#string path_to_training_data
---
#uint32 step
#uint32[] traj_data
std_msgs/UInt32MultiArray traj_data


================================================================================
MSG: std_msgs/UInt32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
uint32[]          data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
")



(provide :movement_primitives/PrompTrain "bae4a804188261b587b4284e77e5b0ba")


