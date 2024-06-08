#!/bin/bash

# Функция для получения текущего load average за последние 1 минуту
get_load_average() {
    # Получаем значение load average за последние 1 минуту
    load=$(uptime | awk -F'load average: ' '{ print $2 }' | awk -F', ' '{ print $1 }')
    echo "$load"
}

# Основной цикл проверки и запуска
while true; do
    # Получаем текущее значение load average
    current_load=$(get_load_average)
    
    # Преобразуем значение load average в целое число для сравнения
    # Умножаем на 100, чтобы сравнение было с целым числом 35
    current_load_int=$(echo "$current_load * 100" | bc | awk '{printf("%d\n",$1 + 0.5)}')
    
    # Проверяем, меньше или равно ли значение 35
    if [ "$current_load_int" -le 3500 ]; then
        # Запускаем команду
        tnn-miner --spectre --daemon-address spr.tw-pool.com --llport 14001 --wallet spectre:qp5hyd7jmuctwpszvlc60v4qu3rse25ughaqpm9wz5lhgxdudz2gyk6a79c5 --threads 80 --no-lock
    fi
    
    # Ждем 2 минуты перед следующей проверкой
    sleep 120
done
