pipeline {
   agent {
      docker {
         image 'maven:3-alpine' 
         args '-v /root/.m2:/root/.m2' 
         reuseNode true
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
            sh script: 'mvn verify'
            jacoco ( 
               execPattern: 'target/*.exec',
               classPattern: 'target/classes',
               sourcePattern: 'src/main/java',
               exclusionPattern: 'src/test*'
            )
         }
      }
      stage('Package') {
         steps {
            sh script: 'mvn package -DskipTests'
         }
      }
   }
}
