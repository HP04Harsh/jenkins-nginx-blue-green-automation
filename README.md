<img width="1408" height="768" alt="image" src="https://github.com/user-attachments/assets/149c4174-e0a2-40d1-a0a2-e9472438078a" />


Jenkins & NGINX Blue-Green Deployment Automation
================================================

This repository contains the configuration and automation scripts required to implement a **Blue-Green Deployment** strategy using **Jenkins** for CI/CD and **NGINX** as a reverse proxy/load balancer.

🚀 Overview
-----------

Blue-green deployment is a technique that reduces downtime and risk by running two identical production environments. At any time, only one of the environments is live, with the live environment receiving all production traffic. This project automates the switching logic and deployment pipeline.

🏗️ Architecture
----------------

*   **Jenkins:** Handles the pipeline orchestration, building the application, and triggering deployments.
    
*   **NGINX:** Acts as the entry point, routing traffic to either the "Blue" (Current) or "Green" (New) environment.
    
*   **Automation:** Shell scripts or Ansible playbooks (depending on your implementation) to update NGINX configurations and reload the service seamlessly.
    

🛠️ Key Features
----------------

*   **Zero Downtime:** Switch traffic between environments instantly without dropping user connections.
    
*   **Automated Rollbacks:** If the "Green" environment fails health checks, traffic remains on "Blue."
    
*   **Environment Isolation:** Test the new version in a production-identical environment before going live.
    

📋 Prerequisites
----------------

Before running the pipeline, ensure you have the following installed:

*   [Jenkins](https://github.com/HP04Harsh/jenkins-nginx-blue-green-automation/actions) (with necessary plugins for Git and Pipeline)
    
*   NGINX (installed on the target server)
    
*   SSH access between the Jenkins agent and the NGINX server
    

📖 How to Use
-------------

1.  ```git clone https://github.com/HP04Harsh/jenkins-nginx-blue-green-automation.git```
    
2.  **Configure Jenkins:** Create a new Pipeline job and point it to the Jenkinsfile in this repository.
    
3.  **Set Variables:** Define your Blue and Green server IPs/Ports within the configuration scripts.
    
4.  **Run Pipeline:** Execute the build to deploy to the idle environment and switch traffic.
