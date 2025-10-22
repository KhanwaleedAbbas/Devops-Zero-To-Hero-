# Jenkins ZERO to HERO | 3 Projects Live |Docker Agent

## Install Jenkins, configure Docker as agent, set up cicd, deploy applications to k8s and much more.

## AWS EC2 Instance
- Go to AWS Console
- Instances(running)
- Launch instances
<img width="1176" height="501" alt="EC2 Instance" src="https://github.com/user-attachments/assets/00480204-6ce5-438d-ac68-e04c3df6e7ba" />

# Install Jenkins
Pre-Requisites:
- Java (JDK)

## Run the below commands to install Java and Jenkins
Install Java
- sudo apt update
- sudo apt install openjdk-17-jre

Verify Java is Installed
-java -version

Now, you can proceed with installing Jenkins

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins

**Note: ** By default, Jenkins will not be accessible to the external world due to the inbound traffic restriction by AWS. Open port 8080 in the inbound traffic rules as show below.

- EC2 > Instances > Click on
- In the bottom tabs -> Click on Security
- Security groups
- Add inbound traffic rules as shown in the image (you can just allow TCP 8080 as well, in my case, I allowed All traffic).

<img width="1162" height="412" alt="SG" src="https://github.com/user-attachments/assets/2a2cf9b6-436b-43df-bf49-b9fe0e554859" />

Login to Jenkins using the below URL:<br>
http://:8080 [You can get the ec2-instance-public-ip-address from your AWS EC2 console page] <br>

Note: If you are not interested in allowing All Traffic to your EC2 instance 1. Delete the inbound traffic rule for your instance 2. Edit the inbound traffic rule to only allow custom TCP port 8080 <br>

After you login to Jenkins, - Run the command to copy the Jenkins Admin Password - sudo cat /var/lib/jenkins/secrets/initialAdminPassword - Enter the Administrator password <br>

<img width="1291" height="596" alt="Unlock Jenkins" src="https://github.com/user-attachments/assets/4cee7633-9967-4dbe-a3e1-ae4d80f4a714" />

## Click on Install suggested plugins
<img width="1291" height="596" alt="Customize Jenkins" src="https://github.com/user-attachments/assets/9174e836-c855-4829-9587-08bcec01f64f" />

Wait for the Jenkins to Install suggested plugins

<img width="1291" height="596" alt="Getting Started" src="https://github.com/user-attachments/assets/0c47cdd4-3540-4618-a2ab-367acd4dcfd9" />

Create First Admin User or Skip the step [If you want to use this Jenkins instance for future use-cases as well, better to create admin user]

<img width="990" height="616" alt="User" src="https://github.com/user-attachments/assets/0647a0cb-13d0-4e9f-945b-a86ec60f4643" />

Jenkins Installation is Successful. You can now starting using the Jenkins

<img width="990" height="616" alt="Setup" src="https://github.com/user-attachments/assets/3aea78ce-e8b5-4449-81c5-cbfb6e10e030" />

## Install the Docker Pipeline plugin in Jenkins:
- Log in to Jenkins.
- Go to Manage Jenkins > Manage Plugins.
- In the Available tab, search for "Docker Pipeline".
- Select the plugin and click the Install button.
- Restart Jenkins after the plugin is installed.

<img width="1392" height="556" alt="docker pipeline" src="https://github.com/user-attachments/assets/c5138111-ec21-448b-9dca-00245db52ede" />
Wait for the Jenkins to be restarted.

## Docker Agent Configuration
Run the below command to Install Docker

- sudo apt update
- sudo apt install docker.io

## Grant Jenkins user and Ubuntu user permission to docker deamon.
- sudo su - 
- usermod -aG docker jenkins
- usermod -aG docker ubuntu
- systemctl restart docker
Once you are done with the above steps, it is better to restart Jenkins.<br>
http://<ec2-instance-public-ip>:8080/restart

The docker agent configuration is now successful.


















