//repo-per-microservice

node{
    stage('SCM Checkout from GitHub'){
        git 'https://github.com/sushantac/scshop-product-service'
    }
    
    stage('MVN Package'){
        def mvnHome = tool name: 'Apache Maven', type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        
        sh label: '', script: "\"${mvnCMD}\" clean package -f pom.xml"
    }
    
    stage('Build Docker Image') {
        sh label: '', script: 'docker build -t sushantac/product-service:0.0.1 --file Dockerfile .'
    }
    
    stage('Push to docker hub') {
	
	    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPassword')]) {
            sh label: '', script: "docker login -u sushantac -p ${dockerHubPassword}"
        }

        sh label: '', script: 'docker push sushantac/product-service:0.0.1'
    }

    stage('Run container on Dev server'){
        try{
            sh label: '', script: 'docker stop product-service'
        } catch(all) {

        }
        
        try{
            sh label: '', script: 'docker rm product-service'
        } catch(all) {

        }

        sh label: '', script: 'docker run -d -p 8003:8003 --name product-service sushantac/product-service:0.0.1'
    }
    
}