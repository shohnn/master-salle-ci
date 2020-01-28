pipeline {
   agent any
    
       stages {
          stage('Compile & Test') {
             steps {
                    echo 'Hello From Jenkinsfile'
                    git 'https://github.com/shohnn/master-salle-ci.git'
                    sh label: '', script: './mvnw compile test'
                    junit 'target/surefire-reports/*.xml'
             }
          }
          stage('Package') {
              steps {
                echo "Building $version"
                sh script: './mvnw package -DskipTests'
              }
          }
     
   }
}
