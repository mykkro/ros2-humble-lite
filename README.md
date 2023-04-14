# ros2-humble-lite

A Docker image with ROS2 Humble, MoveIT and pymoveit2, for demo development purposes.

## Usage

* **Build** the image with: `build.sh`. This will create image named `ros2-humble-lite`.
* **Run** the image with: `run.sh`. This will open a TMUX session with four shells.

The following commands can be useful:

* `~/starttmux.sh` - this is run automatically upon Dopcker startup. You can customize this script (add mnore panes, commands run upon startup etc.).
* `~/killtmux.sh` - kills all tmux windows (and the Docker container)
* `~/panda-rviz.sh` - shows Panda robot in RVIZ
* `~/panda-movejoint.sh` - a demo script that executes a joint move action through `pymoveit2`. Yopu need to run `~/panda-rviz.sh` first.
