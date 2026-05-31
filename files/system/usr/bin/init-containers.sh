#!/bin/bash
if [ ! -f ~/.config/containers_created ]; then
    distrobox-create --name arch-aur --image archlinux:latest --yes
    distrobox-create --name ubuntu-deb --image ubuntu:latest --yes
    touch ~/.config/containers_created
fi
