# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# Custom files required for this lab
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/lab01/default.conf
sudo scp /tmp/default.conf                                   nginx:/etc/nginx/conf.d/default.conf
