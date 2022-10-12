node {
    stage('Preparation') {
        checkout scm
    }
    stage('Clean') {
        sh 'chmod +x "/var/jenkins_home/workspace/NodeJS Pipeline/StopByPort.sh"'
        sh '"/var/jenkins_home/workspace/NodeJS Pipeline/StopByPort.sh" 3000'
    }
    stage('test') {
        def myTestContainer = docker.build('ubuntu-flask')
        //myTestContainer.pull()
        myTestContainer.run('-it --name flask-App -p 5000:5000 -v /var/jenkins_home/workspace/FlashProject:/var/FlaskProject')
        myTestContainer.inside {
            sh 'export FLASK_APP=/var/FlaskProject/Tutorial.py'
            sh 'flask run'
        }
    }
}