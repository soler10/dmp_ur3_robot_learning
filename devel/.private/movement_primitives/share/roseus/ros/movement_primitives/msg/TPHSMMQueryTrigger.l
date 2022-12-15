;; Auto-generated. Do not edit!


(when (boundp 'movement_primitives::TPHSMMQueryTrigger)
  (if (not (find-package "MOVEMENT_PRIMITIVES"))
    (make-package "MOVEMENT_PRIMITIVES"))
  (shadow 'TPHSMMQueryTrigger (find-package "MOVEMENT_PRIMITIVES")))
(unless (find-package "MOVEMENT_PRIMITIVES::TPHSMMQUERYTRIGGER")
  (make-package "MOVEMENT_PRIMITIVES::TPHSMMQUERYTRIGGER"))

(in-package "ROS")
;;//! \htmlinclude TPHSMMQueryTrigger.msg.html


(defclass movement_primitives::TPHSMMQueryTrigger
  :super ros::object
  :slots (_tphsmm_name _input_dofs _input ))

(defmethod movement_primitives::TPHSMMQueryTrigger
  (:init
   (&key
    ((:tphsmm_name __tphsmm_name) "")
    ((:input_dofs __input_dofs) 0)
    ((:input __input) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _tphsmm_name (string __tphsmm_name))
   (setq _input_dofs (round __input_dofs))
   (setq _input __input)
   self)
  (:tphsmm_name
   (&optional __tphsmm_name)
   (if __tphsmm_name (setq _tphsmm_name __tphsmm_name)) _tphsmm_name)
  (:input_dofs
   (&optional __input_dofs)
   (if __input_dofs (setq _input_dofs __input_dofs)) _input_dofs)
  (:input
   (&optional __input)
   (if __input (setq _input __input)) _input)
  (:serialization-length
   ()
   (+
    ;; string _tphsmm_name
    4 (length _tphsmm_name)
    ;; int8 _input_dofs
    1
    ;; float32[] _input
    (* 4    (length _input)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _tphsmm_name
       (write-long (length _tphsmm_name) s) (princ _tphsmm_name s)
     ;; int8 _input_dofs
       (write-byte _input_dofs s)
     ;; float32[] _input
     (write-long (length _input) s)
     (dotimes (i (length _input))
       (sys::poke (elt _input i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _tphsmm_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _tphsmm_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int8 _input_dofs
     (setq _input_dofs (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _input_dofs 127) (setq _input_dofs (- _input_dofs 256)))
   ;; float32[] _input
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _input (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _input i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get movement_primitives::TPHSMMQueryTrigger :md5sum-) "883baf93b9caddc4aaf750ea56eb24f1")
(setf (get movement_primitives::TPHSMMQueryTrigger :datatype-) "movement_primitives/TPHSMMQueryTrigger")
(setf (get movement_primitives::TPHSMMQueryTrigger :definition-)
      "string tphsmm_name
int8 input_dofs #Number of via_pts
float32[] input

")



(provide :movement_primitives/TPHSMMQueryTrigger "883baf93b9caddc4aaf750ea56eb24f1")


