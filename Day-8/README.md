# Shell Scripting Project Used In Real Time | GitHub API Integration

Shell Script ==> Github Integration
on broad level if you want to Integrate or talk to an application there are two ways
1. APIs
2. CLI
applications can be Github, Jenkins, GitLab or any thing even Kubernetes

For GitHUB API is much simpler.

What is API?
For Example I'm talking to Github through UI, Instead of doing this we can also get info programmatically which means we can talk to them through shell or python or any programming language if that particular app exposes the API. where we will run some models like curls in shell and request in python.

Should DevOps Engineer writes the APIs?
No as a DevOps Engineer we didn't write the APIs we use or consume the APIs. 
when we want to talk to AWS either you can use CLI or yu can write python  program and use boto3 model to interact wit AWS.

For every API there is an API Refernce documentation which DevOps Engineer use
Reference URL : https://docs.github.com/en/rest

## As a DevOps engineer how can you list the people who have access to repo? why you need it?
suppose someone is leaving an org and today is her last day so as a devops Engineer you want to find this person has access to the repo, if he has the access we want to revoke the access. 
Instead of going to UI check the repo and goto settings and then remove the person. Instead of doing this list a group of people who have access to repo if the person is there revoke them through shell script. 
automate with shell script












