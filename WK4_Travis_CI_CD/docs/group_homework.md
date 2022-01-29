Pick up a webapp project
https://github.com/JiangRenDevOps/EasyCRM
https://github.com/dockersamples/example-voting-app
or any project that you know about or worked on before or found from github.com

Let us improve its CI/CD. 
Things to do for CI:
1. Automate the build and test part with any CI tool (e.g. Jenkins/Travis/Bitbucket Pipeline etc.(pick any))
2. Trigger Build and test when submitting a pull request  
3. Practice Peer Review


Things to do for CD:
1. Create a master, a staging, and a production branches
2. Fast-forward the master branch to the staging branch every hour and deploy the code to a staging environment in AWS   
3. Write load test and end-to-end test (e.g. webdriver test) for you application
4. Once deployed, automatically trigger the tests that you just wrote.
5. Once all tests passed, soak in staging for an hour.
6. Fast-forward staging to the production branch   
7. Auto promote/deploy the code to a production environment in AWS
   
Note: Try to create a Jira Kanban/Sprint board and tickets and discuss with your team members about:
* definition of done of each ticket
* technology to use  
* time estimation
* assignee (who is doing what?)
