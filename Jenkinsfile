#!/usr/bin/env groovy


node('docker') {
    checkout scm

    stage 'Prepare base RVM container'
    sh './build-base.sh'

    stage 'Build Containers for Rubies'
    sh './build-rubies.sh'

    stage 'Publish Containers'
    /* Using credentials with the ID 'dockerhub' from the Jenkins installation */
    withCredentials([[$class: 'UsernamePasswordMultiBinding',
                        credentialsId: 'dockerhub',
                     passwordVariable: 'DOCKERHUB_TOKEN',
                     usernameVariable: 'DOCKERHUB_EMAIL']]) {
        /* Our variables be exposed in the environment and we must log in before trying to publish to Dockerhub */
        sh 'docker login --username rtyler --password ${DOCKERHUB_TOKEN}'
        sh './push-rubies.sh'
    }
}
