pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mymaven"
    }

    parameters{
string(name: 'Environment', defaultValue: 'test', description: 'version to deploy')

      //  text(name: 'executeTests', defaultValue: 'True', description: 'Enter some information about the person')

        booleanParam(name: 'executeTests', defaultValue: true, description: 'Decide to run it ')

        choice(name: 'APPVERSION', choices: ['1.1','1.2','1.3','1.4'], description: 'select the version')

    }

    stages {
        stage('Compile') {
            steps {
                echo "this is compile stage ${params.APPVERSION}"
            }
          }
		  
		          stage('UnitTest') {
     when {
        expression {
            params.executeTests==true
        }
     }
            steps {
                echo "this is UnitTest stage"
            }
          }
		  
		          stage('Package') {
            steps {
                echo "this is Package stage ${params.Environment} "
            }
          }
		  
		          stage('Deploy') {
                    input {
                message "Select the version to deploy?"
                ok "Version Selected "
                submitter "Discared"
                parameters{
                    choice(name:'PLATFORM',choices:['EKS','ONPREM_KBS','AWS','AZURE'])
                }
                    }
            steps {
                echo "this is Deploy stage" 
            }
          }
    }
}
