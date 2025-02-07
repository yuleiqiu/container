#!/bin/bash

# --contain without binding /dev was causing some strange CPU usage whenever MuJoCo
# was running, two solutions found: not using --contain at all, or using --contain and
# binding host's /dev to container.
# If you use Singularity and you need GUI you will get errors saying someting about the display.
# You can easily bypass this error if you edit your `run.sh` script that you use to
# get into the container and make sure that you bind `tmp`.

rm -rf workdir/*

singularity run \
    --contain \
    $(if lspci | grep -qi nvidia; then echo ' --nv'; else echo ''; fi) \
    $(if [ -f "${HOME}/.gitconfig" ]; then echo ' --bind='${HOME}'/.gitconfig'; else echo ''; fi) \
    --bind=/etc/hosts \
    --bind=/etc/localtime \
    --workdir=workdir \
    --bind=/proc \
    --bind=/sys \
    --bind=/dev \
    --bind=/tmp \
    --bind=scripts:/scripts \
    --home=home:${HOME} \
    --bind=/run/user/${UID} \
    --bind=$HOME/.ssh \
    lerobot
