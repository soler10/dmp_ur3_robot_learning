
(cl:in-package :asdf)

(defsystem "movement_primitives-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PrompQueryTrigger" :depends-on ("_package_PrompQueryTrigger"))
    (:file "_package_PrompQueryTrigger" :depends-on ("_package"))
    (:file "PrompTrainMsg" :depends-on ("_package_PrompTrainMsg"))
    (:file "_package_PrompTrainMsg" :depends-on ("_package"))
    (:file "RobotTraj" :depends-on ("_package_RobotTraj"))
    (:file "_package_RobotTraj" :depends-on ("_package"))
    (:file "TPHSMMQueryTrigger" :depends-on ("_package_TPHSMMQueryTrigger"))
    (:file "_package_TPHSMMQueryTrigger" :depends-on ("_package"))
    (:file "TPHSMMTrainMsg" :depends-on ("_package_TPHSMMTrainMsg"))
    (:file "_package_TPHSMMTrainMsg" :depends-on ("_package"))
  ))