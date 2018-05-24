#!/bin/bash

echo "Starting Netbeans Docker"

docker run --name netbean --rm -d \
-e DISPLAY=192.168.59.3:0  \
-v ~/Workspace/.m2:/home/netbeans/.m2 \
-v ~/Workspace/NetBeansProjects/.git:/home/netbeans/NetBeansProjects/.git \
-v ~/Workspace/NetBeansProjects/.netbeans:/home/netbeans/.netbeans \
-v ~/Workspace/NetBeansProjects:/home/netbeans/NetBeansProjects \
mvpjava/netbeans:8.2
