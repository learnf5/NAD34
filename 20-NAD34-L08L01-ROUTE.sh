# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# update Student Workstation host for the specific lab
# only if need a simpler /etc/hosts file do the following 2 steps
# curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/lab01/hosts
# sudo cp /tmp/hosts                                  /etc/hosts

#Remove default.conf file since this lab requires only default.bak
sudo ssh nginx rm /etc/nginx/conf.d/default.conf

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/lab03/default.bak
sudo scp /tmp/default.bak                              nginx:/etc/nginx/conf.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/lab08/mywebserver.conf
sudo scp /tmp/mywebserver.conf                              nginx:/etc/nginx/conf.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/lab03/return_test.bak
sudo scp /tmp/return_test.bak                              nginx:/etc/nginx/conf.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/lab06/variable_test.bak
sudo scp /tmp/variable_test.bak                              nginx:/etc/nginx/conf.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/lab08/sampleapp.conf
sudo scp /tmp/sampleapp.conf                              nginx:/etc/nginx/conf.d/
