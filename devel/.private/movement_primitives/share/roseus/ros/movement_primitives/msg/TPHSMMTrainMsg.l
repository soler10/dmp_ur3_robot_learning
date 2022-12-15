;; Auto-generated. Do not edit!


(when (boundp 'movement_primitives::TPHSMMTrainMsg)
  (if (not (find-package "MOVEMENT_PRIMITIVES"))
    (make-package "MOVEMENT_PRIMITIVES"))
  (shadow 'TPHSMMTrainMsg (find-package "MOVEMENT_PRIMITIVES")))
(unless (find-package "MOVEMENT_PRIMITIVES::TPHSMMTRAINMSG")
  (make-package "MOVEMENT_PRIMITIVES::TPHSMMTRAINMSG"))

(in-package "ROS")
;;//! \htmlinclude TPHSMMTrainMsg.msg.html


(defclass movement_primitives::TPHSMMTrainMsg
  :super ros::object
  :slots (_tphsmm_name _path_to_data _num_demos _num_frames ))

(defmethod movement_primitives::TPHSMMTrainMsg
  (:init
   (&key
    ((:tphsmm_name __tphsmm_name) "")
    ((:path_to_data __path_to_data) "")
    ((:num_demos __num_demos) 0)
    ((:num_frames __num_frames) 0)
    )
   (send-super :init)
   (setq _tphsmm_name (string __tphsmm_name))
   (setq _path_to_data (string __path_to_data))
   (setq _num_demos (round __num_demos))
   (setq _num_frames (round __num_frames))
   self)
  (:tphsmm_name
   (&optional __tphsmm_name)
   (if __tphsmm_name (setq _tphsmm_name __tphsmm_name)) _tphsmm_name)
  (:path_to_data
   (&optional __path_to_data)
   (if __path_to_data (setq _path_to_data __path_to_data)) _path_to_data)
  (:num_demos
   (&optional __num_demos)
   (if __num_demos (setq _num_demos __num_demos)) _num_demos)
  (:num_frames
   (&optional __num_frames)
   (if __num_frames (setq _num_frames __num_frames)) _num_frames)
  (:serialization-length
   ()
   (+
    ;; string _tphsmm_name
    4 (length _tphsmm_name)
    ;; string _path_to_data
    4 (length _path_to_data)
    ;; int8 _num_demos
    1
    ;; int8 _num_frames
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _tphsmm_name
       (write-long (length _tphsmm_name) s) (princ _tphsmm_name s)
     ;; string _path_to_data
       (write-long (length _path_to_data) s) (princ _path_to_data s)
     ;; int8 _num_demos
       (write-byte _num_demos s)
     ;; int8 _num_frames
       (write-byte _num_frames s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _tphsmm_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _tphsmm_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _path_to_data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _path_to_data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int8 _num_demos
     (setq _num_demos (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _num_demos 127) (setq _num_demos (- _num_demos 256)))
   ;; int8 _num_frames
     (setq _num_frames (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _num_frames 127) (setq _num_frames (- _num_frames 256)))
   ;;
   self)
  )

(setf (get movement_primitives::TPHSMMTrainMsg :md5sum-) "e4144652d3d9743179c2af47f39a3c3f")
(setf (get movement_primitives::TPHSMMTrainMsg :datatype-) "movement_primitives/TPHSMMTrainMsg")
(setf (get movement_primitives::TPHSMMTrainMsg :definition-)
      "string tphsmm_name
string path_to_data
int8 num_demos #How many of the demos from path_to_data do you want to use
int8 num_frames #Number of important frames of reference in the demonstrations

")



(provide :movement_primitives/TPHSMMTrainMsg "e4144652d3d9743179c2af47f39a3c3f")


