pipeline {
   agent {
      docker {
         image 'maven:3-alpine' 
         args '-v /root/.m2:/root/.m2' 
         reuseNode true
      }
   }
   // Test webhook with new docker updated hook. test
   stages {
      stage('Compile & Test') {
         steps {
            sh script: 'mvn clean compile test'
            junit 'target/surefire-reports/*.xml'
         }
      }
      stage('Code Quality') {
         steps {
            sh script: 'mvn pmd:check'
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
      stage('Staging') {
         steps {
            sh script: './scripts/staging.sh'
         }
      }
   }

   post {
      failure {
         mail to: 'menchaca8808@gmail.com',
            subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
            body: "Something is wrong with ${env.BUILD_URL}"
      }
   }
}
