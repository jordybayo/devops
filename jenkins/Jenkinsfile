pipeline {
    agent any
    parameters {
        choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
        booleanParam(name: 'executeTests', defaultValue: true, description:'')
    }
    // for accessing build tools
    // tools{
    //    maven 'Maven'
    // }
    environment{
        NEW_VERSION = '1.3.0'
        SERVER_CREDENTIALS = credentials('jordy')
    }
    stages {
        stage('init'){
            steps{
                script {
                    gv = load "script.groovy"
                }
            }
        }
        stage('build') {
            steps {
                script{
                    gv.buildApp()
                }
                // echo "building version ${NEW_VERSION}"
            }
        }
        stage('test') {
            // when{
            //     expression{
            //         BRANCH_NAME == 'dev' || BRANCH_NAME == 'master'
            //     }
            // }
            when{
                expression {
                    params.executeTests
                }
            }
            steps{
                script {
                    gv.testApp()
                }
            }
        }
        stage('deploy') {
            steps{
                script {
                    env.ENV = input message: "select the env to deploy to", ok: "Done", parameters: [choice(name: 'ONE', choices: ['dev', 'staging', 'prod'], description: ''), choice(name: 'TWO', choices: ['dev', 'staging', 'prod'], description: '')]
                
                    gv.deployApp()
                    // echo "deploying version ${params.VERSION}"  
                }+
            }
        }
    }
    // post{
    //     always{
    //         //
    //     }
    //     success{
    //         //
    //     }
    //     failure{
    //         //
    //     }
    // }
}
