#!/usr/bin/env bash

CHOME=/home/devconsole

docker run -v "${HOME}/.gitconfig:${CHOME}/.gitconfig" -v "${HOME}/.gnupg:${CHOME}/.gnupg" -v "${HOME}/.ssh:${CHOME}/.ssh" -v "${HOME}/.aws:${CHOME}/.aws" --rm -it devconsole
