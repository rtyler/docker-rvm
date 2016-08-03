#!/usr/bin/env groovy


node('docker') {
    checkout scm

    stage 'Build Containers'
    sh './build-rubies.sh'

    stage 'Publish Containers'
    /* Using credentials with the ID 'dockerhub' from the Jenkins installation */
    withCredentials([[$class: 'UsernamePasswordMultiBinding',
                        credentialsId: 'dockerhub',
                     passwordVariable: 'DOCKERHUB_TOKEN',
                     usernameVariable: 'DOCKERHUB_EMAIL']]) {
        /* Our variables be exposed in the environment and we must log in before trying to publish to Dockerhub */
        sh 'docker login --username ${DOCKERHUB_EMAIL} --password ${DOCKERHUB_TOKEN}'
        sh './push-rubies.sh'
    }
}
