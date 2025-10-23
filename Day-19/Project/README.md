# Complete CI/CD Implementation in Jenkins (Step-by-Step)

Let’s go step-by-step — from installation all the way to automated deployment.<br>
We’ll use a simple Python app example to make it concrete.

### CREATE EC2 INSTANCE
<img width="1152" height="133" alt="EC2" src="https://github.com/user-attachments/assets/fb39d15f-a897-4d6d-85af-6ea0428ecba1" />

### Phase 1: Prerequisites Setup
##### 1. Install Dependencies. <br>
      sudo apt update
      sudo apt install openjdk-17-jdk git docker.io -y 
##### Verify java is Installed
    java --version
#### 2. Install Jenkins <br>
        curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
        /usr/share/keyrings/jenkins-keyring.asc > /dev/null
        echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
        https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
        /etc/apt/sources.list.d/jenkins.list > /dev/null

        sudo apt update 
        sudo apt install jenkins -y 
        sudo systemctl enable jenkins 
        sudo systemctl start jenkins 
        sudo systemctl status jenkins

**Note:** By default, Jenkins will not be accessible to the external world due to the inbound traffic restriction by AWS. Open port 8080 in the inbound traffic rules as show below.
  - EC2 > Instances > Click on
  - In the bottom tabs -> Click on Security
  - Security groups
  - Add inbound traffic rules as shown in the image (you can just allow TCP 8080 as well, in my case, I allowed All traffic).
<img width="1160" height="189" alt="sg" src="https://github.com/user-attachments/assets/06ffd5c9-c946-4abb-8796-97052c89a003" />

#### 3. Get Jenkins Admin Password
        sudo cat /var/lib/jenkins/secrets/initialAdminPassword
Go to:
👉 **http://<server-ip>:8080**
Paste the password and install the suggested plugins.

<img width="994" height="567" alt="Unlock" src="https://github.com/user-attachments/assets/eaf91be2-3c60-4a7e-8785-32b63dbb14cb" />

<img width="987" height="567" alt="Customize Jenkins" src="https://github.com/user-attachments/assets/8a036058-4d36-4689-b957-456584f108a4" />

<img width="792" height="575" alt="Create user" src="https://github.com/user-attachments/assets/ca0a4799-d010-434a-a1a2-765a2825a95d" />

#### Jenkins is Ready

### Phase 2: Jenkins Configuration

#### 4. Install Key Plugins
In Jenkins dashboard:
- Go to Manage Jenkins → Plugins → Available
- Install:
    - Pipeline
    - Git
    - Docker
    - Blue Ocean (optional, for better UI)
    - Credentials Binding

#### 5. Configure Docker Access
Give Jenkins permission to use Docker:<br>
         sudo usermod -aG docker jenkins <br>
         sudo systemctl restart jenkins <br>
Then log out and back in (or reboot).

### Phase 3: Create a Simple Python App
Create a simple Python project and push it to GitHub:

**File: hello.py** <br>
      print("Hello WALEED, CI/CD from Jenkins!")

**File: Jenkinsfile**

            pipeline {
              agent {
                docker { image 'python:3.10-alpine' }
              }
            
              stages {
                stage('Checkout Code') {
                  steps {
                    git branch: 'main', url: 'https://github.com/KhanwaleedAbbas/Devops-Zero-To-Hero-.git'
                  }
                }
            
                stage('Run Python Script') {
                  steps {
                    sh '''
                      echo "Running Python Application from subdirectory..."
                      python Day-19/Project/hello.py
                    '''
                  }
                }
              }
            }

### Phase 4: Create Jenkins Pipeline
1. Open Jenkins → New Item
2. Enter name → select Pipeline
3. Scroll to Pipeline Definition
   - Choose Pipeline script from SCM
   - SCM: Git
   - Repo URL: your GitHub repo URL
   - Branch: main
4. Click Save

### Phase 5: Run Your First Build
1. Click Build Now
2.  Watch the console output
      You'll see Jenkins:
          - Pull the code
          - Launch a Docker container
          - Run the Python app
          - Save artifacts
   ✅ Success means CI/CD setup is working!




















