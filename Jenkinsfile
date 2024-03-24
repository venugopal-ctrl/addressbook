pipeline {
    agent any
	tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mymaven"
    }
	
 stages {
        stage('Compile') {
	steps {
	 echo "this is compile stage "
	 }
 }
}

 stages {
        stage('UnitTest ') {
	steps {
	 echo "this is UnitTest stage "
	 }
 }
}

 stages {
        stage('Package ') {
	steps {
	 echo "this is Package stage "
	 }
 }
}

 stages {
        stage('Deploy ') {
	steps {
	 echo "this is deploy stage "
	 }
 }
}
}