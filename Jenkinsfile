pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mymaven"
    }

    stages {
        stage('Build') {
            steps {
                echo "this is Build stage"
            }
          }
		  
		          stage('UnitTest') {
            steps {
                echo "this is UnitTest stage" 
            }
          }
		  
		          stage('Package') {
            steps {
                echo "this is Package stage"
            }
          }
		  
		          stage('Deploy') {
            steps {
                echo "this is Deploy stage" 
            }
          }
    }
}
