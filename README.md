# ros2-humble-lite

A Docker image with ROS2 Humble, MoveIT and pymoveit2, for demo development purposes. Uses [pymoveit2](https://github.com/AndrejOrsula/pymoveit2) and some modified configs from [panda_ign_moveit2](https://github.com/AndrejOrsula/panda_ign_moveit2).

## Usage

* **Build** the image with: `build.sh`. This will create image named `ros2-humble-lite`.
* **Run** the image with: `run.sh`. This will open a TMUX session with four shells.

The following commands can be useful:

* `~/starttmux.sh` - this is run automatically upon Docker startup. You can customize this script (add more panes, commands run upon startup etc).
* `~/killtmux.sh` - kills all tmux windows (and the Docker container itself)
* `~/panda-rviz.sh` - shows Panda robot in RVIZ2
* `~/panda-movejoint.sh` - a demo script that executes a joint move action through `pymoveit2`. You need to run `~/panda-rviz.sh` first.
