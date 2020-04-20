#!/usr/bin/env sh


set -ex

echo 1 > /sys/class/pwm/pwmchip0/export
echo 1000000 > /sys/class/pwm/pwmchip0/pwm1/period
echo 200000 > /sys/class/pwm/pwmchip0/pwm1/duty_cycle
echo 1 > /sys/class/pwm/pwmchip0/pwm1/enable
sleep 1
echo 0 > /sys/class/pwm/pwmchip0/pwm1/enable
echo 1 > /sys/class/pwm/pwmchip0/unexport


echo 1 > /sys/class/pwm/pwmchip0/export

/overlay/www/cgi-bin/hello_driving_pwm

ls -l /sys/class/pwm/pwmchip0/pwm1/period
cat /sys/class/pwm/pwmchip0/pwm1/period

sleep 1

echo 1 > /sys/class/pwm/pwmchip0/unexport