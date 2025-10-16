# Deploy and Expose your Nodejs App to AWS

## Run on your local PC
- First clone repo
- We will first run this app locally 
- we want some environment variable to be set
- create .env file 
 - environment variable file is where you set that particular variable which you use again & again. It is basically used to store secret credentials.
- copy the env variable in .env file.

	- DOMAIN= "" 
	- PORT=3000
	- STATIC_DIR="./client"
	- PUBLISHABLE_KEY="" ==> Stripe APIs Key
	- SECRET_KEY=""

Run the application
	-npm install 
	-npm run start
	- run locally now

<img width="1366" height="730" alt="localhost" src="https://github.com/user-attachments/assets/ddc012dc-af49-44e5-9b2b-a27f4b948484" />


## Now It's AWS Time
- Create an IAM user
- Attach Policies ==> AdministratorAccess
- Now login through IAM user
- Launch EC2 Instance ==> demo-nodejs ==> Ubuntu ==> t3.micro ==> key ==> Rest    Default ==> Launch  
- Conect EC2 Through SSH
- Goto the folder where your .pem file is
- chmod 400 demo.pem
- ssh -i demo.pem ubuntu@ipaddress
- sudo apt update ==> update all the nencessary package and dependencies in our instance
- Install git and clone the repo in EC2 Instance
- Configure nodejs ==> we will follow digital ocean
- sudo apt install nodejs
- To verify ==> node -v
- sudo apt install npm
- npm --version
Now we have Three Initial things for Application i.e 1. GIT 2. Nodejs 3. Npm
- now clone the repo in EC2 
- cd into repo
- set the environment variable and create .env file
- vim .env ==> grab the environement variable ==> paste it
- how to access private and public key of stripe
- create account with strip and on test mode goto developers and the API keys
- COPY the Publishable Key[ ... ]
- Secret Key [ ... ]
- exit vim 
- npm install
- npm run start
- Before running an Application through EC2 make sure expose the port 3000 in security groups. Goto Instance ==> security tab ==> Edit Inbound rules ==> Add       3000 ports

<img width="1366" height="728" alt="Deployed" src="https://github.com/user-attachments/assets/db6c01f0-2f5c-444d-8537-4578c1ab4a01" />




























