pipeline {
    agent any
    stages {
        stage('Clean workspace directory'){
            steps {
                // define un o muchos pasos
                bat 'echo Clean workspace directory'
                cleanWs notFailBuild: true
            }
        }

        stage('Cleanup stage') {
            steps {
                // define un o muchos pasos
                bat 'echo Cleanup stage'
            }
        }

        stage('Git checkout') {
            steps {
                // define un o muchos pasos
                bat 'echo Git checkout'
                checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/eberssgarcia/fw-karatedsl.git']])
            }
        }

        stage('Restore package stage') {
            steps {
                // define un o muchos pasos
                bat 'echo Restore package'
            }
        }

        stage('Build stage') {
            steps {
                // define un o muchos pasos
                bat 'echo Build'
                bat 'mvn clean compile'
            }
        }

        stage ('Deploy'){
            steps {
                bat 'echo Deploying the application..'
            }
        }

        stage('Test execution stage') {
            steps {
                // define un o muchos pasos
                bat 'echo Test execution started'
                bat 'mvn test'
            }
        }
    }

    post {
        always {
            // One or more steps need to be included within each condition's block.
            junit 'target/surefire-reports/*.xml'
            cucumber buildStatus: 'UNCHANGED', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/surefire-reports', pendingStepsNumber: -1, reportTitle: 'Karate Test Execution', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1

        zip zipFile:'target/test-result.zip', archive: true, dir: 'target/surefire-reports', overwrite: true
                    emailext subject: "Job '${env.JOB_NAME} - ${env.BUILD_NUMBER} '", body: 'Refer to the attachment', attachmentsPattern: 'target/test-result.zip', to: 'to@example.com'

        }
    }
}