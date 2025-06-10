# Install tree command on NGINX server
sudo ssh nginx sudo apt install tree
# restart NGINX
sudo ssh nginx sudo systemctl stop nginx
sudo ssh nginx sudo systemctl start nginx
