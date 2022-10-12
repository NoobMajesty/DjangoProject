node {
    stage('Preparation') {
        checkout scm
    }
    stage('Clean') {
        sh 'chmod +x "/var/jenkins_home/workspace/NodeJS Pipeline/StopByPort.sh"'
        sh '"/var/jenkins_home/workspace/NodeJS Pipeline/StopByPort.sh" 5000'
        sh 'echo hi'
    }
    stage('test') {
        def myTestContainer = docker.image('ubuntu-flask')
        //myTestContainer.pull()
        myTestContainer.run('-it --name flask-App -p 5000:5000 -v /var/jenkins_home/workspace/FlashProject:/var/FlaskProject')
        myTestContainer.inside {
            sh 'cd /var/FlaskProject'
            sh 'flask run'
        }
    }
}