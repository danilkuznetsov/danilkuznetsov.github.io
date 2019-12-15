#!/bin/sh

CONTAINER_NAME=jekyll-blog-dev

if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; 
then
  docker stop $CONTAINER_NAME
fi  
