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
                echo "This is package stage ${params.Environment}"
                sh 'mvn package'
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