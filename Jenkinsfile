pipeline {
    agent none
	tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mymaven"
    }
    parameters {
        //string(name: 'Environment', defaultValue: 'Test', description: 'version to deploy?')
       choice(name:'Environment', choices: ['L1', 'L2', 'PROD'], description: 'Pick something')

        //text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')

        booleanParam(name: 'executetests', defaultValue: true, description: 'Decide to run test cases')

        choice(name:'APPVERSION', choices: ['1.1', '1.2', '1.3'], description: 'Pick something')
    }
    environment {
        PACKAGE_SERVER='ec2-user@172.31.37.35'
    }
	stages { 
        stage('Compile') {
            agent{label 'linux_slave'}
            steps {
                script{
                echo "This is compile stage ${params.APPVERSION}"
                sh 'mvn compile'
                }
            }
        }
		        stage('Unit Test') {
                    agent any
        when {
            expression{
                params.executetests ==true
            }
        }

            steps {
                script{
                echo 'This is Unitest stage'
                sh 'mvn test'
                }
            }
        }
		    stage('Package') {
            agent any
            steps {
                script{
                sshagent(['slave2']) {
               echo "Package the code ${params.Env}"
               sh "scp -o StrictHostKeyChecking=no server-config.sh ${PACKAGE_SERVER}:/home/ec2-user"
               sh "ssh -o StrictHostKeyChecking=no ${PACKAGE_SERVER} 'bash ~/server-config.sh'"
               
            }
            }
        }
        }
		        stage('Deploy') {
                    input {
                        message "Select the version to deploy"
                        ok "PLATFORM"
                        parameters{
                           choice(name:'PLATFORM', choices: ['EKS', 'KBS', 'ONPREM','AZURE'], description: 'Pick something') 
                        }
                    }
            steps {
                script{
                echo 'This is deploy stage'
                //sh 'mvn deploy'
                }
            }
        }
  }
}