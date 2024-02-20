#!/bin/bash

# var
BLOG_1_IMG="blog-a-1" 
BLOG_2_IMG="blog-b-1" 

# rm & rmi
figlet remove all
sudo docker stop $(sudo docker ps -q)
sudo docker rm  $(sudo docker ps -a -q)
sudo docker rmi  $(sudo docker images -q)
sudo docker network rm compose-bridge

figlet build
figlet run

# blog-a, blog-b build
sudo docker build -t $BLOG_1_IMG -f serv-a/Dockerfile serv-a
sudo docker build -t $BLOG_2_IMG -f serv-b/Dockerfile serv-b

# lb build 
sudo docker build -t lb-1 -f lb-compose/Dockerfile lb-compose

# docker network
sudo docker network create compose-bridge


# blog-a
sudo docker run -d --name blog-a --network compose-bridge -p 8001:80 $BLOG_1_IMG 

# blog-b
sudo docker run -d --name blog-b --network compose-bridge -p 8002:80 $BLOG_2_IMG

# lb
sudo docker run -d --name lb --network compose-bridge -p 8003:80 lb-1

figlet ps
sudo docker ps
figlet network ps
sudo docker network inspect compose-bridge

