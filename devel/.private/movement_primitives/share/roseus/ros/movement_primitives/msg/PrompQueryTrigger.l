;; Auto-generated. Do not edit!


(when (boundp 'movement_primitives::PrompQueryTrigger)
  (if (not (find-package "MOVEMENT_PRIMITIVES"))
    (make-package "MOVEMENT_PRIMITIVES"))
  (shadow 'PrompQueryTrigger (find-package "MOVEMENT_PRIMITIVES")))
(unless (find-package "MOVEMENT_PRIMITIVES::PROMPQUERYTRIGGER")
  (make-package "MOVEMENT_PRIMITIVES::PROMPQUERYTRIGGER"))

(in-package "ROS")
;;//! \htmlinclude PrompQueryTrigger.msg.html


(defclass movement_primitives::PrompQueryTrigger
  :super ros::object
  :slots (_promp_name _input_dofs _input ))

(defmethod movement_primitives::PrompQueryTrigger
  (:init
   (&key
    ((:promp_name __promp_name) "")
    ((:input_dofs __input_dofs) 0)
    ((:input __input) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _promp_name (string __promp_name))
   (setq _input_dofs (round __input_dofs))
   (setq _input __input)
   self)
  (:promp_name
   (&optional __promp_name)
   (if __promp_name (setq _promp_name __promp_name)) _promp_name)
  (:input_dofs
   (&optional __input_dofs)
   (if __input_dofs (setq _input_dofs __input_dofs)) _input_dofs)
  (:input
   (&optional __input)
   (if __input (setq _input __input)) _input)
  (:serialization-length
   ()
   (+
    ;; string _promp_name
    4 (length _promp_name)
    ;; int8 _input_dofs
    1
    ;; float32[] _input
    (* 4    (length _input)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _promp_name
       (write-long (length _promp_name) s) (princ _promp_name s)
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
   ;; string _promp_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _promp_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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

(setf (get movement_primitives::PrompQueryTrigger :md5sum-) "2a147e77dd4851c94b12ecfd24c9afb4")
(setf (get movement_primitives::PrompQueryTrigger :datatype-) "movement_primitives/PrompQueryTrigger")
(setf (get movement_primitives::PrompQueryTrigger :definition-)
      "string promp_name
int8 input_dofs
float32[] input

")



(provide :movement_primitives/PrompQueryTrigger "2a147e77dd4851c94b12ecfd24c9afb4")


