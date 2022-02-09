# Description

This is to demo how to build Jenkins pipeline using Blue Ocean interface

## About Blue Ocean

Blue Ocean is a new user experience for Jenkins based on a personalizable, modern design that allows users to graphically create, visualize and diagnose Continuous Delivery (CD) Pipelines. For more info please refer to <https://www.jenkins.io/projects/blueocean/about/>

## Pre-requisite

- Github Account
- Jenkins Server

## Hands-On

### Install Blue Ocean

If you use standard Jenkins installation, rather than the image `jenkinsci/blueocean`, Blue Ocean is not installed by default. You need to install it from Jenkins Plug-in Manager.

1. Navigate to Jenkins Dashboard -> Manage Jenkins -> Manage Plugins.

2. Search **"Blue Ocean"** from the "Available" tab.

    ![Alt text](images/plugin-blue-ocean-search.png?raw=true)

3. Only select the **"`Blue Ocean`"** and click the "**Install without restart**" button at the bottom of the page.

### Connect to a GitHub repo

1. In Github, fork a repo with Jenkinsfile under your account

    Fork <https://github.com/JiangRenDevOps/hello-Jenkinsfile> into your account.

    ![Alt text](images/jenkins-blueocean-pipeline-01.png?raw=true)

2. Navigate to "Blue Ocean view" by clicking the "Open Blue Ocean" button on Jenkins homepage

    ![Alt text](images/jenkins-blueocean-pipeline-02.png?raw=true)

3. Create a pipeline from your github repository

    ![Alt text](images/jenkins-blueocean-pipeline-03.png?raw=true)

    3.1 Click "New Pipeline" on the top right corner.
    Choose "Github" as the source.

    3.2 Generate a token by clicking "Create an access token here" and provide the token to Jenkins.

    3.3 Choose your account as the organization this repository belongs to.

    3.4 Choose the repository you just forked into your account.

    3.5 Create pipeline.

4. View your pipeline deployment process

    ![Alt text](images/jenkins-blueocean-pipeline-04.png?raw=true)
    You should be able to see all Build, Test and Deploy stage output.

5. Update pipeline configuration

    ![Alt text](images/jenkins-blueocean-pipeline-05.png?raw=true)
    In "configure", update the "Scan repository triggers" to every minute.

6. Create another branch in your forked repository

    Create a "develop" branch in your repository, make some changes to the Jenkinsfile and push the branch.

7. You should see Jenkins pipeline automatically trigger the build for develop branch shortly after you push it

    ![Alt text](images/jenkins-blueocean-pipeline-06.png?raw=true)

8. Update your Jenkins file and observe how that changes your pipeline deployment behaviour.

    Refer to these Jenkinsfile examples to update your config: <https://github.com/JiangRenDevOps/DevOpsLectureNotesV6/tree/master/Wk4.3/1.Jenkins-BlueOcaen-Pipeline/Pipeline-examples>
