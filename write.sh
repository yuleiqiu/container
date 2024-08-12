#!/bin/bash
singularity shell --fakeroot \
    --writable \
    --home=home:$HOME \
    $(if [ -f "${HOME}/.gitconfig" ]; then echo ' --bind='${HOME}'/.gitconfig'; else echo ''; fi) \
    lerobot

