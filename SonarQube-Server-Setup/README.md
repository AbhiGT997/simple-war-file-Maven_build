##SonarQube Local Server Steps:

1. Add sonarqube user to users:
   adduser sonarqube (Switch to rootuser while creating this: sudo su - )
   
   {Note!: **adduser** is a more user-friendly command that simplifies the process of creating a new user, while **useradd** is a more powerful command that allows for       greater flexibility and customization while manually entering all the required details}
   
   Switch to Sonarqube user ie: sudo su - sonarqube (And follow the next steps)
   
2. Install unzip:
   sudo apt install unzip

3. Wget the Zip file to proper directory:
   wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.4.0.54424.zip
   use: unzip sonarqube-9.4.0.54424.zip (to unzip all the contents to the directory)
   
4. Giving permission to sonarqube to run:
   
   ```
   chmod -R 755 <proper_directory_location>/sonarqube-9.4.0.54424
   
   chown -R sonarqube:sonarqube <proper_directory_location>/sonarqube-9.4.0.54424
   ```
   
5. Change directory: to Start-up SonarQube server:
   cd sonarqube-9.4.0.54424/bin/linux-x86-64/
   ./sonar.sh start
   
   (Started SonarQube message would pop-up indicating that the server is up and runninig)
   
6. Accessing SonarQube: 
   By default SonarQube server runs on port 9000
   http://localhost:9000/ (can be used to access SonarQube server 
   
   (By default admin & admin would be the default username and password once entered it would ask to change the default)

7. Generating Tokens:
   Tokens can be used by jenkins to access sonar server for code quality analysis 
   My account--> Security --> Generate tokenns
   {Give a name sonarqube and generate the token and copy the secret code & add it to the credentials as **Secrect text** option such that it can be used in pipeline jobs}

8. Configuring Jenkins global settings to add SonarQube:
   Go to Jenkins --> Manage jenkins --> System --> SonarQube server
   Enable Environment variables
   Add SonarQuber serbver by providing the credentials:
   url:  http://localhost:9000/
   Server authentication token: sonarqube to access the server
   
 Note!!: If the server is restarted then we need to re-start the sonarqube server switch to sonaruser (because the file structure would be different for different users)
 ```
 sudo su - sonarqube
 chmod -R 755 <file-location>
 chown -R sonarqube:sonarqube <file-location>
 
 ```
   
   Finally add the following in the pipeline to use the SonarQube server:
 
 ```
   
   stage('SonarQube Static-Code Analysis') {
            steps {
                withSonarQubeEnv('sonarqube') { 
        // If you have configured more than one global server connection, you can specify its name //      
        sh "${scannerHome}/bin/sonar-scanner"
        sh "mvn sonar:sonar"
            }
         }
      }
   }
}

```
   
