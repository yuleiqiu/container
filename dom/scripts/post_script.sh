#!bin/bash
export PYTHON_VERSION=3.10
export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get install -y --no-install-recommends \
        build-essential cmake git git-lfs openssh-client \
        nano vim vim-gtk less util-linux tree \
        htop atop nvtop \
        sed gawk grep curl wget zip unzip \
        tcpdump sysstat screen tmux \

        libglib2.0-0 libgl1-mesa-glx libegl1-mesa ffmpeg \
        speech-dispatcher libgeos-dev \
        python${PYTHON_VERSION}-pip python${PYTHON_VERSION}-dev python${PYTHON_VERSION}-venv \
        software-properties-common \
        libxext6 libx11-6 libglvnd0 libgl1 libglx0 libegl1 \
        freeglut3-dev libglfw3 libglew2.1 libosmesa6 \
        libglew-dev libnvidia-gl-535 \
        && apt-get -y autoremove \
        && apt-get clean && rm -rf /var/lib/apt/lists/*

# ln -s /usr/bin/python${PYTHON_VERSION} /usr/bin/python
# python -m venv /opt/venv
# echo "source /opt/venv/bin/activate" >> /root/.bashrc

# git lfs install
# git clone https://github.com/huggingface/lerobot.git /lerobot
# cd /lerobot
# pip install --upgrade --no-cache-dir pip
# pip install --no-cache-dir ".[test, aloha, xarm, pusht, dynamixel]"
CUSTOM_ENV=/.singularity.d/env/99-zz_custom_env.sh
cat >$CUSTOM_ENV <<EOF
#!/bin/bash
PS1="[lerobot] Singularity> \w \$ "
EOF
chmod 755 $CUSTOM_ENV