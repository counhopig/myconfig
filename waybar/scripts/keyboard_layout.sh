#!/bin/bash

# 获取Caps Lock状态
caps_lock=$(xset q | grep "Caps Lock:" | awk '{print $4}')

# 获取Num Lock状态
num_lock=$(xset q | grep "Num Lock:" | awk '{print $8}')

# 输出状态，使用Pango Markup实现换行
echo "Caps Lock: $caps_lock\nNum Lock: $num_lock"