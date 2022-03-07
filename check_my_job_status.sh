#!/bin/bash
cmd='nvidia-smi --query-compute-apps=pid --format=csv,noheader | sort | uniq | xargs -I {} ps -o uname,pid,args -p {} | grep ^ziyxiang | grep -v ipykernel_launcher'
for i in $(seq 1 9)
do
    ssh node0${i}-ccncluster "${cmd} | awk -v prefix='node0${i}: ' '{printf prefix} {print}'"
done
for i in $(seq 0 9)
do
    ssh node1${i}-ccncluster "${cmd} | awk -v prefix='node1${i}: ' '{printf prefix} {print}'"
done
