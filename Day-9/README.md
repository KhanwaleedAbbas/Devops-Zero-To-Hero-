# Git and GitHub
## What is Version Control System (VCS)?
Two Primary roles of VSC :
  1. Sharing
  2. Versioning

## what is sharing?
Two Dev in same org working on same project known as calculator. One is working on Add function and other is working on Subtraction.
End of the day both have toh share the code to build a calculator or centralized app. You can think that we can share this code through gmail, slack etc but the
Problem is we took very small project but In real world scenario project we have 100 of packages and 1000 of files so, it is practically impossible to share for example dev1 has changed 25 files and Dev2 has changed 30 files so how will we give this files and there will be dependecies also and sharing will not be easy, So to overcome this problem we use VCS.

## What is versioning?
Suppose Dev1 is writing Add function and it's adding two numbers and next day manager wants him to add three numbers so finally it end on adding four number and the app is completed and went through the process and live to the customer.
The product management realises that customer are not using addition of three and four number, so we did not want these function so we have to go back to additon of two number or the code we wrote 10 days back so for these we should have multiple versions of the code.

Version Controls
1. CVS ==> Centralized
2. SVN ==> Centralized
3. GIT ==> Distributed

## Difference between Centralized VCS vs Distributed VCS? and how GIT is solving these problem?
So basically what happens before DVCS in an org one Developer is writng add function and other is writing Subtraction and they both are connected to central server(SVN), so if they want to share code they share it to central server(SVN) which was SVN  and the other developer will pick the changes from the central server(SVN), so that why it is called centralized VCS everything is used to happen from central place which is SVN. If the central system is down both developers can't communicate with each other

## Distribution VCS?
Dev1 and Dev2 , if Dev1 want to share code with Dev2 what will he do he will share his code to distributed version system or he can create a multiple copies of distributed VCS, So same Dev2 can also do the same

## What is fork?
create entire copy of original source.

## GIT vs GITHUB?
GIT is a DVCS and it is an open source. We can download GIT and implement in an org.
- Usability
- Issues
- Commenting
- Reviewing
- Project Management

------------------------------------------------------------------------
				PRACTICAL
First we will install git through git website and check the git is installed.
Command ==> git 

Create or initialized git repo
git init

## How to check the git repo is created?
ls -la there will be .git hidden folder or it is called a database of git. eventually git tracks everything in this folder so it is very important folder.
everything in git is tracked as object.
using hooks we can prevent the access of password or API token.

git status ==> it will tell the status of the file that whether it is tracked or untrack
git diff ==> It will tell you the changes you have made 
git commit ==> snapshot of the changes you've made to your files
git reset --hard <commitid> ==> It will revert back to the previous verisons.
