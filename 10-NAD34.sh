# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# get lab-info.md for student guide bravais id
#curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/lab-info.md --output /tmp/lab-info.md
#brav_id=$(awk -F '|' "/$LAB_ID/"' {print $2}' /tmp/lab-info.md)

# install tree on nginx server
sudo ssh nginx apt-get install tree

# common files for all labs
sudo ssh nginx mkdir --parents /home/ubuntu/public_html/application1
sudo ssh nginx mkdir --parents /home/ubuntu/public_html/application2
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/common/ubuntu/public_html/index.html
sudo scp /tmp/index.html                                   nginx:/home/ubuntu/public_html/index.html
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/common/ubuntu/public_html/application1/app1.html
sudo scp /tmp/app1.html                                    nginx:/home/ubuntu/public_html/application1/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/common/ubuntu/public_html/application2/app2.html
sudo scp /tmp/app2.html                                    nginx:/home/ubuntu/public_html/application2/

sudo ssh nginx mkdir --parents /home/ubuntu/public_html/shop/product
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/common/ubuntu/public_html/shop/product/product{1,2,3}.html
sudo scp /tmp/product*.html                                nginx:/home/ubuntu/public_html/shop/product/

sudo ssh nginx mkdir --parents /home/ubuntu/public_html/shop/services
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/common/ubuntu/public_html/shop/services/service{1,2,3,4,5}.html
sudo scp /tmp/service*.html                                nginx:/home/ubuntu/public_html/shop/services/

sudo ssh nginx mkdir --parents /data/images
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/common/data/images/logo.png
sudo scp /tmp/logo.png                                    nginx:/data/images/

sudo ssh nginx mkdir --parents /data/server2/sampleapp
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/common/data/server2/sampleapp/index.html
sudo scp /tmp/index.html                                  nginx:/data/server2/sampleapp/


# install 30 day nginx one trial licenses from Salesforce 
set +x
curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token $TOKEN" https://raw.githubusercontent.com/learnf5/eval-reg-keys/main/nginx/nginx-one-eval.{crt,key,jwt}
echo curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" https://raw.githubusercontent.com/learnf5/eval-reg-keys/main/nginx/nginx-one-eval.{crt,key,jwt}
set -x
until sudo scp /tmp/nginx-one-eval.crt nginx:/etc/ssl/nginx/nginx-repo.crt || (( count++ > 5 )); do sleep 5; done
until sudo scp /tmp/nginx-one-eval.key nginx:/etc/ssl/nginx/nginx-repo.key || (( count++ > 5 )); do sleep 5; done
until sudo scp /tmp/nginx-one-eval.jwt nginx:/etc/nginx/license.jwt || (( count++ > 5 )); do sleep 5; done
