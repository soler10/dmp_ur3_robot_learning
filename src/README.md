- terminal 1: (servidor que crea els serveis de les dmp)
catkin build
source devel/setup.bash
roslaunch dmp dmp.launch

- terminal 2: (obra gazebo amb model ur3)
source devel/setup.bash
roslaunch my_ur3_description ur3.launch

-terminal 3: (per crear trajectoria (opc.) i criddar servei dmp i executar)
source devel/setup.bash
roslaucnh my_ur3_reach ur3_reach.launch

-terminal X: (moure joints una per una)
source devel/setup.bash
roslaunch my_ur3_reach ur3_move_joint.launch

-terminal X: (guardar trajectoria??? -no esta massa clar yet)
source devel/setup.bash
roslaunch my_ur3_reach ur3_move_joint.launch
