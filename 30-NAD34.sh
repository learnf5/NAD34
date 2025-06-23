# Sorry for my mistake (Vicki June 21, 2025) - I left nap.conf and nap.orig on the NGINX base VM
# So I'll remove it for all NGINX labs from this script
sudo ssh nginx sudo rm /etc/nginx/conf.d/nap.{conf,orig}

# Install tree command on NGINX server
sudo ssh nginx sudo apt install tree

# restart NGINX
sudo ssh nginx sudo systemctl stop nginx
sudo ssh nginx sudo systemctl start nginx
