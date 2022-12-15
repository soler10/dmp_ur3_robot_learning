
(cl:in-package :asdf)

(defsystem "movement_primitives-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "PrompTrain" :depends-on ("_package_PrompTrain"))
    (:file "_package_PrompTrain" :depends-on ("_package"))
  ))