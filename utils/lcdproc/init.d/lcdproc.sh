#!/bin/sh
#
# Source Mage init.d install information
# SMGL-START:3 4 5:S50
# SMGL-STOP:0 1 2 6:K50
#

#  1. select paramiters for:  LCD_TYPE,     LCD_DRIVERS,   LCD_DEVICE,
#                             LCD_CONTRAST, LCD_BACKLIGHT
#  2. comment next 2 lines
echo "/etc/init.d/lcdproc needs to be edited before usage"
exit

#  20x4, 16x2
LCD_TYPE=20x4

#  CFontz, curses, HD44780, irmanin, joy, MtxOrb, LB216, text
LCD_DRIVERS=CFontz

#  /devices/cua/0, /devices/cua/1, /dev/lcd
LCD_DEVICE=/devices/cua/1

#  0-200
LCD_CONTRAST=100

#  open, on, off
LCD_BACKLIGHT=open

case  $1  in
 start|restart)  echo "$1ing lcdproc deamon."
                 pkill "^LCDd$"
                 /usr/sbin/LCDd  -t $LCD_TYPE                 \
                                 -d $LCD_DRIVERS              \
                                 "--device    $LCD_DEVICE     \
                                 --contrast   $LCD_CONTRAST"  \
                                 -b  $LCD_BACKLIGHT           &
                 ;;
      
          stop)  echo "$1ping lcdproc deamon."
                 pkill "^LCDd$"
                 ;;
             *)  echo "Usage: /usr/sbin/cast {start|stop|restart}"
                 ;;
esac
