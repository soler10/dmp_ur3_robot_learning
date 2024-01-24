<h1>Dynamic Movement Primitives in Robotics</h1>
<h4>Dynamic Movement Primitives (DMPs) in robotics are a computational framework that enables robots to learn and reproduce complex motor skills. Inspired by human motor control, DMPs provide a way to encode and generalize movement patterns. They break down a task into a sequence of submovements with dynamic properties, allowing for adaptation to varying conditions. DMPs facilitate flexible and adaptive control, making them valuable in robotic applications for tasks ranging from grasping objects to more intricate motions, enhancing the robot's ability to interact with the environment.</h4>

<h2>Some user friendly instructions / Una micona d'instruccions user friendly: </h2>

## Inici:

Create the folder and clone / crear carpeta i clonar etc:

>mkdir -p catkin_ws/src

>cd catkin_ws/src

>git clone https://github.com/soler10/dmp_ur3_robot_learning.git

Initiate workspace / iniciar workspace:

> cd ..

> catkin_init_workspace

Compile / compilar:

> catkin build



## Al lio:

#### terminal 0: 

>>roscore


#### terminal 1: (server that creates the dmp's servers / servidor que crea els serveis de les dmp)

>>catkin build

>>source devel/setup.bash

>>roslaunch dmp dmp.launch

#### terminal 2: (Open gazebo with ur3 model / obra gazebo amb model ur3)

>>source devel/setup.bash

>>roslaunch my_ur3_description ur3.launch

#### terminal 3: (To create a trajectory and call the dmp server and execute / per crear trajectoria (opc.) i criddar servei dmp i executar)

>>source devel/setup.bash

>>roslaucnh my_ur3_reach ur3_reach.launch


#### terminal X: (Move joints independently / moure joints una per una)

>>source devel/setup.bash

>>roslaunch my_ur3_reach ur3_original.launch


<img src="https://github.com/soler10/dmp_ur3_robot_learning/blob/master/im.jpeg?raw=true" alt="banner" width="200">


