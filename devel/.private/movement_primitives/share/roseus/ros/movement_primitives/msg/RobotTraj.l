;; Auto-generated. Do not edit!


(when (boundp 'movement_primitives::RobotTraj)
  (if (not (find-package "MOVEMENT_PRIMITIVES"))
    (make-package "MOVEMENT_PRIMITIVES"))
  (shadow 'RobotTraj (find-package "MOVEMENT_PRIMITIVES")))
(unless (find-package "MOVEMENT_PRIMITIVES::ROBOTTRAJ")
  (make-package "MOVEMENT_PRIMITIVES::ROBOTTRAJ"))

(in-package "ROS")
;;//! \htmlinclude RobotTraj.msg.html


(defclass movement_primitives::RobotTraj
  :super ros::object
  :slots (_robot_dofs _traj ))

(defmethod movement_primitives::RobotTraj
  (:init
   (&key
    ((:robot_dofs __robot_dofs) 0)
    ((:traj __traj) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _robot_dofs (round __robot_dofs))
   (setq _traj __traj)
   self)
  (:robot_dofs
   (&optional __robot_dofs)
   (if __robot_dofs (setq _robot_dofs __robot_dofs)) _robot_dofs)
  (:traj
   (&optional __traj)
   (if __traj (setq _traj __traj)) _traj)
  (:serialization-length
   ()
   (+
    ;; int8 _robot_dofs
    1
    ;; float32[] _traj
    (* 4    (length _traj)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _robot_dofs
       (write-byte _robot_dofs s)
     ;; float32[] _traj
     (write-long (length _traj) s)
     (dotimes (i (length _traj))
       (sys::poke (elt _traj i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _robot_dofs
     (setq _robot_dofs (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _robot_dofs 127) (setq _robot_dofs (- _robot_dofs 256)))
   ;; float32[] _traj
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _traj (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _traj i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get movement_primitives::RobotTraj :md5sum-) "0a5c2376d2b17933b7131c7de868f64e")
(setf (get movement_primitives::RobotTraj :datatype-) "movement_primitives/RobotTraj")
(setf (get movement_primitives::RobotTraj :definition-)
      "int8 robot_dofs
float32[] traj  

")



(provide :movement_primitives/RobotTraj "0a5c2376d2b17933b7131c7de868f64e")


