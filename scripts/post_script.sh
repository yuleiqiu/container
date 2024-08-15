#!/bin/bash
apt-get update 
DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration
DEBIAN_FRONTEND=noninteractive TZ="Europe/London" apt-get install -y tzdata
apt-get -y upgrade

apt-get update && apt-get install -y --no-install-recommends \
    build-essential cmake \
    git git-lfs openssh-client \
    nano vim vim-gtk less util-linux tree \
    htop atop nvtop \
    sed gawk grep curl wget zip unzip \
    tcpdump sysstat screen tmux \
    libglib2.0-0 libgl1-mesa-glx libegl1-mesa \
    python3 python3-pip python3-venv \
    software-properties-common \
    pypy xterm psmisc \
    apt-utils \
    libxext6 \
    libx11-6 \
    libglvnd0 \
    libgl1 \
    libglx0 \
    libegl1 \
    freeglut3-dev \
    libglfw3 \
    libglew2.1 \
    libosmesa6 \
    libglew-dev \
    libnvidia-gl-535 \
    && apt-get -y autoremove \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Installation of miniconda3
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
conda config --set auto_activate_base false


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

