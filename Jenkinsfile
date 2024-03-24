pipeline {
    agent any
	tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mymaven"
    }
	stages { 
        stage('Compile') {
            steps {
                echo 'This is compile stage'
            }
        }
		        stage('Unit Test') {
            steps {
                echo 'This is compile stage'
            }
        }
		        stage('Package') {
            steps {
                echo 'This is package stage'
            }
        }
		        stage('Deploy') {
            steps {
                echo 'This is deploy stage'
            }
        }
  }
}