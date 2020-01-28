pipeline {
   agent any

   stages {
      stage('Compile & Test') {
         steps {
            echo 'Hello From Jenkinsfile'
            git 'https://github.com/shohnn/master-salle-ci'
            sh label: '', script: './mvnw compile test'
            junit 'target/surefire-reports/*.xml'
         }
      }
      stage('Package') {
         steps {
            echo "Building 1.0.${BUILDS_THIS_YEAR}"
            sh script: './mvnw package -DskipTests'
         }
      }
   }
}
