#!/bin/bash

echo "start pull(lb)-->"
date "+%Y-%m-%d %H:%M:%S"

cd /var/www/html
git pull

echo "<--end pull"
