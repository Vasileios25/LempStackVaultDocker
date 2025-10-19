#  LEMP Stack with Vault Integration (Work in Progress)

##  Overview
This project is a Docker-based personall project running inside a Dockerized environment with 7 containers,to explore secure application deployment using:
1. **3 NGINX servers**: 3 nginx servers 1 load balancer and  2 backend servers.
2. **2 MySQL servers**: Stores in a db table user name and password from the php web page. 1 acts as master and the other one as replica.
3. **Vault**: Manages and securely stores database credentials.
4. **1 php container**: Serves simple php pages for login,logout,register, a welcome page,db connection.


The main goal is to **integrate Vault for secure credential handling** and prepare the stack for a future Kubernetes deployment.

---

##  Current Status
 Working components:
- LEMP stack fully containerized (Nginx, PHP, MySQL Master–Replica)
- Vault container running with HTTPS
- Initial configuration files and certificates in place
- Tested local replication and load balancing

 In progress:
- Replace hard-coded database root password with Vault-retrieved secret
- Implement Vault authentication via `userpass` instead of root token
- Connect PHP app dynamically to Vault during runtime
- Plan Helm migration for Kubernetes (EKS / Minikube testbed)

---

##  What I’ve Learned So Far
- Deepened understanding of **Docker networking** and service dependencies  
- Improved Vault setup, **TLS configuration**, and **policy management**  
- Understood practical challenges of **secret injection in runtime containers**  
- Reinforced troubleshooting discipline through trial-and-error experimentation

---

##  Next Steps
1. Finish PHP–Vault integration using dynamic secret retrieval  
2. Migrate Vault config from file storage to HA backend (optional)  
3. Deploy same stack on **Kubernetes** using **Helm**  
4. Integrate **Terraform** for infrastructure provisioning  
5. Add monitoring (Prometheus + Grafana) for observability

---

##  Project Context
This is a **personal learning project**, not production-ready code.  
Its purpose is to document my growth as a Cloud / DevOps engineer — from manual operations to automated, secure infrastructure design.

I started this to connect my interests in:
- **Linux**
- **Networking**
- **Automation**
- **Secure secrets management**

---

My aim is to demonstrate:
- Curiosity and willingness to explore complex topics  
- Practical, hands-on problem solving  
- Continuous improvement mindset  

---

## Tech Stack
| Component | Description |
|------------|-------------|
| **Nginx** | Reverse proxy & load balancer |
| **PHP-FPM** | Web backend |
| **MySQL** | Primary + replica database |
| **Vault** | Secret management |
| **Docker Compose** | Container orchestration |
| *(Future)* | Kubernetes + Helm + Terraform |




## Getting Started

### Prerequisites
- Docker & Docker Compose plugin (`docker compose`)
- OpenSSL / Let's Encrypt (for local TLS where applicable)

### Clone
```bash
git clone https://your-repo-url.git
cd LempStackVaultDocker

   ```

2. Create a `.env` file for environment variables (database credentials) if not using Vault yet.

3. Build and start the Docker containers:
   ```bash
   docker-compose up --build
   ```

### Executing program

Run the application using:
```bash
docker-compose up
```

Once the app is running, run in other terminal:
```bash
docker container ls
```

connect to any  app container:
```bash
docker exec -t <container> /bin/bash
```

to connect to to mysql run the following:
```bash
mysql -u root -p( or dedicated admin user)
```

Use database:
```bash
use app;
```

List users of the users table:
```bash
select * from users;
```

## Help

For common issues, check the logs or run the following command for help:
```bash
docker-compose logs
```
---

##  Author
**Vasileios Siaploulis**  
Cloud / DevOps Engineer in progress 
Passionate about Linux, networking, and secure automation.  



---
# test commit
