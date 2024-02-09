#!/bin/bash

# Please don't include third party documents with unclear copyright.
# Let's just grab them when needed

# Wemos S2 mini
wget -nc https://www.wemos.cc/en/latest/_static/boards/s2_mini_v1.0.0_1_16x16.jpg
wget -nc https://www.wemos.cc/en/latest/_static/boards/s2_mini_v1.0.0_2_16x16.jpg
wget -nc https://www.wemos.cc/en/latest/_static/files/sch_s2_mini_v1.0.0.pdf

# ESP32
wget -nc https://www.espressif.com/sites/default/files/documentation/esp32-s2_datasheet_en.pdf
wget -nc https://www.espressif.com/sites/default/files/documentation/esp32_technical_reference_manual_en.pdf

# Pololu A4988 carrier board
wget -nc https://a.pololu-files.com/picture/0J3359.1200.png -O Pololu_A4988_carrier_board.png

# A4988
wget -nc https://www.pololu.com/file/0J450/a4988_DMOS_microstepping_driver_with_translator.pdf

# Holbuchsen
wget -nc https://www.pollin.de/productdownloads/D452316D.PDF -O D452316D_2_1_mm.pdf
wget -nc https://www.pollin.de/productdownloads/D451810D.PDF -O D451810D_2_5_mm.pdf
