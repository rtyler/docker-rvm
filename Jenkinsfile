#!/usr/bin/env groovy

def rubies = ['2.3.0', '2.3.1', '2.2.5', '2.1.10', 'jruby', 'jruby-9.1.2.0', 'ree']

node('docker') {
    checkout scm

    stage 'Prepare base RVM container'
    sh './build-base.sh'

    stage 'Push base RVM container'
    withCredentials([[$class: 'UsernamePasswordMultiBinding',
                        credentialsId: 'dockerhub',
                    passwordVariable: 'DOCKERHUB_TOKEN',
                    usernameVariable: 'DOCKERHUB_USERNAME']]) {
        /* Our variables be exposed in the environment and we must log in before trying to publish to Dockerhub */
        sh 'docker login --username=${DOCKERHUB_USERNAME} --email=tyler@monkeypox.org --password=${DOCKERHUB_TOKEN}'
        sh './push-base.sh'
    }

    stage 'Build Containers for Rubies'
    def stepsForParallel = [:]
    for (int i = 0; i < rubies.size(); i++) {
        def ruby = rubies.get(i)
        stepsForParallel[ruby] = {
            node {
                checkout scm
                sh "./build-rubies.sh ${ruby}"
                /* Using credentials with the ID 'dockerhub' from the Jenkins installation */
                withCredentials([[$class: 'UsernamePasswordMultiBinding',
                                    credentialsId: 'dockerhub',
                                passwordVariable: 'DOCKERHUB_TOKEN',
                                usernameVariable: 'DOCKERHUB_USERNAME']]) {
                    /* Our variables be exposed in the environment and we must log in before trying to publish to Dockerhub */
                    sh 'docker login --username=${DOCKERHUB_USERNAME} --email=tyler@monkeypox.org --password=${DOCKERHUB_TOKEN}'
                    sh "./push-rubies.sh ${ruby}"
                }
            }
        }
    }
    /* Fan everything out like crazy */
    parallel(stepsForParallel)
}
