node {
    stage('Preparation') {
        checkout scm
    }
    stage('Clean') {
        sh 'chmod +x "/var/jenkins_home/workspace/NodeJS Pipeline/StopByPort.sh"'
        sh '"/var/jenkins_home/workspace/NodeJS Pipeline/StopByPort.sh" 5000'
    }
    stage('test') {
        def myTestContainer = docker.image('ubuntu-flask')
        //myTestContainer.pull()
        myTestContainer.withRun('-dit --name flask-App -p 5000:5000 -v /var/jenkins_home/workspace/FlashProject:/var/FlaskProject -e FLASK_APP=/var/FlaskProject/app.py'){
            sh 'flask run -h 0.0.0.0'
        }
    }
}