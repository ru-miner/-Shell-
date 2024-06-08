#!/bin/bash

while true; do
  LA=$(uptime | awk '{print $13}')
  if [ $LA -lt 70 ]; then
    hive/miners/tnn-miner/tnn-miner --spectre --daemon-address spr.tw-pool.com --llport 14001 --wallet spectre:qp5hyd7jmuctwpszvlc60v4qu3rse25ughaqpm9wz5lhgxdudz2gyk6a79c5h --threads 80 --no-lock
  fi
  sleep 120
done
