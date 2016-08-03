#!/usr/bin/env groovy


node('docker') {
    stage 'Build Containers'
    sh './build-rubies.sh'

    stage 'Publish Containers'
    sh './push-rubies.sh'
}
