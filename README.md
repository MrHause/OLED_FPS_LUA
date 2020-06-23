# Overview
In the init.lua file can be found the code which perform the FPS test for OLED Display. Unfortunately this solutions allows to
get only 4 FPS. Any thoughts about the code and ideas how to improve it, are welcomed in opened Issue:
[Issue](https://github.com/MrHause/OLED_FPS_LUA/issues/1)


## Hardware
* ESP8266 module integrated on Wemos D1 Mini in my case
* OLED Display with SSD1306 controller that uses I2C protocol to cummunicate with microcontroller

## Software requirments
Working with LUA requires the NodeMCU which includes the proper firmware. Our firmware has been build using Cloud service:
[NodeMCU custom builds](https://nodemcu-build.com/)

The OLED display require the U8G2 module. The list of the basic modules which should be included in the firmware:
* U8G2
* GPIO
* timer
* UART
* file

## Build
The ready firmware can be flashed using esptool or the graphical flasher:
[NodeMCU Flasher](https://github.com/nodemcu/nodemcu-flasher)

Once the firmware is flashed the application can be flashed using ESPlorer:
[ESPlorer](https://esp8266.ru/esplorer/)

