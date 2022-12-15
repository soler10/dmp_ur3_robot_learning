;; Auto-generated. Do not edit!


(when (boundp 'movement_primitives::PrompTrainMsg)
  (if (not (find-package "MOVEMENT_PRIMITIVES"))
    (make-package "MOVEMENT_PRIMITIVES"))
  (shadow 'PrompTrainMsg (find-package "MOVEMENT_PRIMITIVES")))
(unless (find-package "MOVEMENT_PRIMITIVES::PROMPTRAINMSG")
  (make-package "MOVEMENT_PRIMITIVES::PROMPTRAINMSG"))

(in-package "ROS")
;;//! \htmlinclude PrompTrainMsg.msg.html


(defclass movement_primitives::PrompTrainMsg
  :super ros::object
  :slots (_promp_name _path_to_data _sensor_dofs _robot_dofs ))

(defmethod movement_primitives::PrompTrainMsg
  (:init
   (&key
    ((:promp_name __promp_name) "")
    ((:path_to_data __path_to_data) "")
    ((:sensor_dofs __sensor_dofs) 0)
    ((:robot_dofs __robot_dofs) 0)
    )
   (send-super :init)
   (setq _promp_name (string __promp_name))
   (setq _path_to_data (string __path_to_data))
   (setq _sensor_dofs (round __sensor_dofs))
   (setq _robot_dofs (round __robot_dofs))
   self)
  (:promp_name
   (&optional __promp_name)
   (if __promp_name (setq _promp_name __promp_name)) _promp_name)
  (:path_to_data
   (&optional __path_to_data)
   (if __path_to_data (setq _path_to_data __path_to_data)) _path_to_data)
  (:sensor_dofs
   (&optional __sensor_dofs)
   (if __sensor_dofs (setq _sensor_dofs __sensor_dofs)) _sensor_dofs)
  (:robot_dofs
   (&optional __robot_dofs)
   (if __robot_dofs (setq _robot_dofs __robot_dofs)) _robot_dofs)
  (:serialization-length
   ()
   (+
    ;; string _promp_name
    4 (length _promp_name)
    ;; string _path_to_data
    4 (length _path_to_data)
    ;; int8 _sensor_dofs
    1
    ;; int8 _robot_dofs
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _promp_name
       (write-long (length _promp_name) s) (princ _promp_name s)
     ;; string _path_to_data
       (write-long (length _path_to_data) s) (princ _path_to_data s)
     ;; int8 _sensor_dofs
       (write-byte _sensor_dofs s)
     ;; int8 _robot_dofs
       (write-byte _robot_dofs s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _promp_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _promp_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _path_to_data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _path_to_data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int8 _sensor_dofs
     (setq _sensor_dofs (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _sensor_dofs 127) (setq _sensor_dofs (- _sensor_dofs 256)))
   ;; int8 _robot_dofs
     (setq _robot_dofs (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _robot_dofs 127) (setq _robot_dofs (- _robot_dofs 256)))
   ;;
   self)
  )

(setf (get movement_primitives::PrompTrainMsg :md5sum-) "4ac2b3de384f10c19d662ca80d3020f8")
(setf (get movement_primitives::PrompTrainMsg :datatype-) "movement_primitives/PrompTrainMsg")
(setf (get movement_primitives::PrompTrainMsg :definition-)
      "string promp_name
string path_to_data
int8 sensor_dofs #Number of individual numbers in the sensor input
int8 robot_dofs #Number of controllable robot joints

")



(provide :movement_primitives/PrompTrainMsg "4ac2b3de384f10c19d662ca80d3020f8")


