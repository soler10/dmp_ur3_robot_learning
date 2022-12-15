#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/abril/catkin_ws/src/openai_ros_2/openai_ros"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/abril/catkin_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/abril/catkin_ws/install/lib/python3/dist-packages:/home/abril/catkin_ws/build/openai_ros/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/abril/catkin_ws/build/openai_ros" \
    "/usr/bin/python3" \
    "/home/abril/catkin_ws/src/openai_ros_2/openai_ros/setup.py" \
     \
    build --build-base "/home/abril/catkin_ws/build/openai_ros" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/abril/catkin_ws/install" --install-scripts="/home/abril/catkin_ws/install/bin"
