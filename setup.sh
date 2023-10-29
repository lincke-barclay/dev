#!/bin/bash


ln -sf /home/communeo/dev/system/communeo-api.service /etc/systemd/system/communeo-api.service
ln -sf /home/communeo/dev/system/communeo-psql.service /etc/systemd/system/communeo-psql.service
systemctl daemon-reload

systemctl restart communeo-psql
systemctl restart communeo-api # Banking on the one before completing faster :)
