pipeline {
   agent {
      label 'docker' 
   }

   stages {
      stage('Compile') {
         docker {
            label 'docker'
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
         }
         steps {
            git 'https://github.com/shohnn/master-salle-ci.git'
            sh 'mvn compile'
         }
      }

      stage('Test') {
         steps {
            sh 'mvn test'
            junit 'target/surefire-reports/*.xml'
         }
      }

      stage('Package') {
         steps {
            sh script: 'mvn package -DskipTests clean package'
         }
      }
   }
}
