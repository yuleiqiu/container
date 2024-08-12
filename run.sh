#!/bin/bash
# --contain without binding /dev was causing some strange CPU usage whenever MuJoCo
# was running, two solutions found: not using --contain at all, or using --contain and
# binding host's /dev to container.

rm -rf workdir/*

# Check for NVIDIA GPU
if lspci | grep -qi nvidia; then
    GPU_FLAG="--nv"
else
    GPU_FLAG=""
fi

# Check for .gitconfig
if [ -f "${HOME}/.gitconfig" ]; then
    GITCONFIG_FLAG="--bind=${HOME}/.gitconfig"
else
    GITCONFIG_FLAG=""
fi

singularity run \
    --contain \
    $GPU_FLAG \
    $GITCONFIG_FLAG \
    --bind=/etc/hosts \
    --bind=/etc/localtime \
    --workdir=workdir \
    --bind=/proc \
    --bind=/sys \
    --bind=/dev \
    --bind=scripts:/scripts \
    --home=home:${HOME} \
    --bind=/run/user/${UID} \
    --bind=$HOME/.ssh
