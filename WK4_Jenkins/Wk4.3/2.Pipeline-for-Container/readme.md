# Use Jenkins Blue Ocean to Build a Container

Now let's try to build a Docker image and deploy it to your machine.

## Prerequisites

* Jenkins
* Jenkins Blue Ocean
* Docker
* GitHub account

## Docker Image Build Pipeline

```Groovy
pipeline {
    agent any
    
    stages {
        stage('Build Docker image') {
            steps {
                sh 'docker build -t docker-getting-started .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -dp 3000:3000 docker-getting-started'
            }
          }
    }
}
```

## Hands-On

1. Fork this repo to your GitHub <https://github.com/RayMaAU/docker-getting-started>

2. In Jenkins Blue Ocean view, click no "New Pipeline".

    ![Alt text](images/create-new-blue-pipeline.png?raw=true)

3. In your pipeline configuration wizard, connect to your orgnization and the repo, then click on "**Create Pipeline**":

    ![Alt text](images/connect-blue-to-repo.png?raw=true)

    ![Alt text](images/blue-pipeline-choose-repo.png?raw=true)

4. Once the pipeline is been successfully created, it should start to have the first run automatically.

    ![Alt text](images/blue-pipeline-running.png?raw=true)

5. Click on the pipeline running result to view the running details:

    ![Alt text](images/blue-pipeline-running-details.png?raw=true)

6. Visit your **Port 3000** of your **hostname**, you should see the container running.

    > Note
    >
    > Make sure your port 3000 is open for traffic from OS Firewall and/or cloud platform networking settings.

    ![Alt text](images/container-running.png?raw=true)
