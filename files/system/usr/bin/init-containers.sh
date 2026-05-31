#!/bin/bash
# Проверяем, запускался ли скрипт раньше
if [ ! -f ~/.config/containers_created ]; then
    # Создаем скрытый контейнер Arch Linux для AUR
    distrobox-create --name arch-aur --image archlinux:latest --yes
    # Создаем скрытый контейнер Ubuntu для DEB
    distrobox-create --name ubuntu-deb --image ubuntu:latest --yes
    # Создаем файл-маркер, чтобы скрипт больше никогда не запускался
    touch ~/.config/containers_created
fi
