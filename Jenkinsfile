pipeline {
   agent {
      docker {
         image 'maven:3-alpine' 
         args '-v /root/.m2:/root/.m2' 
      }
   }

   stages {
      stage('Compile & Test') {
         steps {
            sh 'mvn clean compile test'
            junit 'target/surefire-reports/*.xml'
         }
      }
      stage('Code Quality') {
         steps {
            sh 'mvn pmd:check'
         }
      }
      stage('Integration Tests & Coverage') {
         steps {
            sh script: 'mvn package -DskipTests'
         }
      }
   }
}
