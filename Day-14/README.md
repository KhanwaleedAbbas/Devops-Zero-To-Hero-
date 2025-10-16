# Configuration Management With Ansible

Suppose your Company's System Administrator is using on-premises server. On this on-premises server ypu have 100 servers and 50 are hosted on linux and 25 are o centOS and 25 are on ubuntu.<br>
100 --> Servers<br>
	50 --> Linux<br>
	25 --> CentOS<br>
	25 --> Ubuntu<br>
and system admin is managing this server and managing means he have to take care of many things like upgrade the versions(to improve performance) and secure the patches and 3rd point is installation.
Suppose we are team of 5 and To do this on 100 server it is extremely difficult to login into 100 server and update the packages or to install something.<br>
Before advanced tools the people use to write scripts. For example for linux they will write shell scripts for windows they will write in powershell and for every distribution <br>
there might be a different scripts so it was a challenge.<br>

Now after moving to cloud the number of servers are increased by 10x. <br>

## What was the problem industry were facing before ansible tools?
**The Problem — Life Before Ansible** <br>
Imagine you have 10, 100, or even 1,000 servers that all need:<br>
- OS updates
- Application deployments 
- Configuration files 
- User management 
- Security patches
- Before automation tools like Ansible, this was mostly done manually or with custom shell scripts. <br>

Let’s break down the key pain points <br>

**1. Manual Configuration**
- Every server was configured by hand (SSH → run commands → edit files).
- Time-consuming and error-prone.
**Example:**
- You install Nginx manually on 10 servers — you might forget a step or mistype a config on one of them → one server behaves differently.

**2. No Standardization**
- Each system admin used their own custom scripts (Bash, Python, etc.).
- No centralized or reusable approach.
- Difficult for teams to collaborate or onboard new engineers.
**Example:**
- One admin writes a deploy script in Bash, another in Python → no standard way to automate setups.

**3. Scaling Was a Nightmare**
- Managing 5–10 servers was okay.
- But 100+ servers meant massive repetition of manual work.
- No way to “apply one change everywhere” reliably.
**Example:**
- You need to update one line in an Apache config file → must SSH into every machine. <br>

### Example: Before vs After <br>
**Before:** <br>
SSH into 50 servers and install Nginx manually or via custom scripts. <br>
**After (Ansible):** <br>
**Create one YAML playbook: <br>
	- hosts: webservers <br>
  	become: yes <br>
  	tasks: <br>
    	 - name: Install nginx <br>
      	   apt: <br>
           name: nginx <br>
           state: present** <br>
Run: ansible-playbook nginx.yml <br>
All 50 servers are updated automatically and consistently.<br>

**Problem:** If it was a window machine we have to write some psh script or if it was a linux machine we have to write shell script <br>
and inside shell script there was a clause because linux has many distribution and for every distribution there might have different commands. <br>
To address this problem the concept of configuration management came into picture. <br>
The configure management will aim to solve the problem of managing the configuration of multiple servers.<br>

To manage 1000 of servers there was a concept that was introduced to manage the configuration of server. <br>

Inside config management there are many tools
1. Puppet ==> old
2. Chef
3. Ansible[RedHat Ansible] ==> mostly used and devops find much better
4. Salt

## Puppet vs Ansible? why ansible? and why it is better?
- Puppet is a pull mechanism and Ansible is a push mechanism. 
**Scenario:** In an Org xyz DevOps Engineer manages the congiuration of AWS so in this AWS he created 10 EC2 Instances and his reponsibility is to manage 10 EC2 Instances means <br>
when there is a security update or some packages to be monitored or change, this Devop engineer uses the Ansible tool to update the config of 10 EC2 Servers. <br>
Push model ==> Write ansible scripts or playbook at one place(called as laptop) and push it to 10 EC2 instance and everything is updated. <br>
Ansible uses Agentless model which means if someone uses puppet it follows master/slaves(node) architecture. <br>
In puppet the DevOps Engineer have to write the Instances as slave like Slave1, slave 2. whereas with ansible we can just put the name of the server in inventory file and just have passwordless authentication. <br>

**Scenario**: For example during a christmas day you think your company load to go up and the company scaleup their server and after that they want to scale down the servers, <br>
so this is dynamic environemnt, so with ansible if your scaling up servers you just need to provide ip address and you are good to go<br>

**Dynamic Inventory:** If you are creating 100 servers and with some settings what you can do is you can tell ansible whenever a new ec2 Instance is created on my AWS Account in a specific region or AZ <br>
you have to take care of it. Ansible will auto detect that the new server which is created have to be managed by me.<br>

Because of Agent less architecture life is very easy. <br>

Ansible is very easy and good support for windows and especially for Linux it is very good <br>

Ansible is very simple i.e yaml language and in Puppet you have to learn Puppet language like Ruby <br>

we can write own Ansible modules and Ansible is basically written in python <br>

Ansible Galaxy is a bridge through which you can share the modules <br>

Disadvantages of Ansible ==> These are the areas to Improve
1. Not that good with windows
2. Debugging is not good
3. Performance

## Q-1. What is Programming language Ansible uses?
Python is a programming language in which you can write custom modules.
## Q-2. Does Ansible support windows or only linux?
It supports both for Linux it uses ssh protocol and for windows it uses Win RM protocol
## Q-3 Is Ansible is push mechanism or pull mechanism?
Push mechanism
## Q-4 In which language you write Ansible file?
Yaml
## Q-5 Does Ansible support all the cloud providers?
It does not matter the cloud provider what its matter is Public IP, ssh enabled and allowed.

## Why ansible is better that puppet?
### Ansible vs Puppet
Both Ansible and Puppet are configuration management tools — they automate server setup, software installation, and configuration.

**Language & Simplicity**
**Feature	        	        Ansible        		          Puppet**
Language		              YAML (human-readable)      	Domain Specific Language (DSL based on Ruby)
Learning Curve		        Very Easy	                  Steeper — need to understand Ruby DSL
Setup	                    Simple,agentless	          Complex, agent-based

- Ansible connects directly to your servers using SSH (no agent to install).
- Puppet requires installing a Puppet Agent on each node and setting up a Puppet Master server for control.
- You can start using Ansible right after installation with:sudo apt install ansible
- But Puppet requires configuration of certificates, agents, and master-slave communication.

**Execution Model**
- Ansible uses a push model — you run a playbook, and it immediately applies changes via SSH.
- Puppet uses a pull model — each node checks in with the master every few minutes (default 30 min).

- 👉 This means Ansible gives instant results and better control.














