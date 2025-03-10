def gv
pipeline {
    agent any
    environment {
        NEW_VERSION = '1.3.0'
        BRANCH_NAME = "${GIT_BRANCH.split("/")[1]}"
    }
    stages {
        stage ("init") {
            steps {
                script {
                    gv = load "script1.groovy"
                }
            }
        }
        stage("Build") {
            steps{
                echo "Build for version ${NEW_VERSION} completed on branch ${env.BRANCH_NAME}."
            }
        }
        stage("Test") {
            when{
                expression{
                    env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'main'
                }
            }
            steps{
                sh 'echo "Test completed."'
            }
        }
        stage("deploy") {
            steps{
                script {
                    gv.buildapp()
                }
            }
        }
    }
}
