#!/bin/bash
apt-get update 
DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration
DEBIAN_FRONTEND=noninteractive TZ="Europe/London" apt-get install -y tzdata
apt-get -y upgrade

apt-get install -y --force-yes \
    wget \
    tmux \
    zip \
    unzip \
    git \
    build-essential \
    software-properties-common \
    pypy \
    cmake \
    curl \
    xterm \
    psmisc \
    software-properties-common \
    apt-utils \
    python3-pip \
    libxext6 \
    libx11-6 \
    libglvnd0 \
    libgl1 \
    libglx0 \
    libegl1 \
    freeglut3-dev \
    && apt-get -y autoremove \
    && apt-get clean

# # Installation of NVidia Drivers and Cuda
# apt install -y --force-yes \
#     nvidia-driver-470 \
#     nvidia-cuda-toolkit \
#     && apt-get -y autoremove \
#     && apt-get clean

# cd /tmp
# wget https://developer.download.nvidia.com/compute/cuda/11.3.1/local_installers/cuda_11.3.1_465.19.01_linux.run
# sh ./cuda_11.3.1_465.19.01_linux.run --toolkit --silent --override

CUSTOM_ENV=/.singularity.d/env/99-zz_custom_env.sh
cat >$CUSTOM_ENV <<EOF
#!/bin/bash
PS1="[lerobot] Singularity> \w \$ "
EOF
chmod 755 $CUSTOM_ENV

