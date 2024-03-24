pipeline {
    agent any
	tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mymaven"
    }
    parameters {
        string(name: 'Environment', defaultValue: 'Test', description: 'version to deploy?')
       //choice(name:'Environment', choices: ['L1', 'L2', 'PROD'], description: 'Pick something')

        //text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')

        booleanParam(name: 'executetests', defaultValue: true, description: 'Decide to run test cases')

        choice(name:'APPVERSION', choices: ['1.1', '1.2', '1.3'], description: 'Pick something')
    }
	stages { 
        stage('Compile') {
            steps {
                echo "This is compile stage ${params.APPVERSION}"
            }
        }
		        stage('Unit Test') {
            steps {
                echo 'This is Unitest stage'
            }
        }
		        stage('Package') {
            steps {
                echo "This is package stage ${params.Environment}"
            }
        }
		        stage('Deploy') {
            steps {
                echo 'This is deploy stage'
            }
        }
  }
}