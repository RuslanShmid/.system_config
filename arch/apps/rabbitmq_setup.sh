#!/bin/sh

yay -S rabbitmq --noconfirm
sudo systemctl start rabbitmq.service
sudo rabbitmq-plugins enable rabbitmq_managementrabbitmq_management

