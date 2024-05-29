#!/bin/bash
# For Ubuntu 22.04
# Install Docker
sudo apt-get update
sudo apt-get install docker.io -y
docker --version
sudo usermod -aG docker ubuntu
sudo systemctl restart docker
sudo chmod 777 /var/run/docker.sock
sudo apt install docker-compose

# Run Jenkins using doker.
 #docker pull jenkins/jenkins:lts --name jenkins-container
 sudo apt-get update -y
 docker run -d -p 8080:8080  --name jenkins-container jenkins/jenkins:lts
 sudo systemctl enable jenkins
 sudo systemctl start jenkins
 sudo usermod -a -G docker jenkins

 # Installing Trivy
#!/bin/bash
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt update
sudo apt install trivy -y