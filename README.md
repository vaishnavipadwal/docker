# Docker

## What is Docker
Docker is a containerization platform that enables developers to package applications and their dependencies into lightweight, portable containers. Containers ensure that applications run consistently across different computing environments, whether it's a developer's laptop, a test server, or a production cloud environment.

## Containerization
Containerization is a technology that allows applications to be packaged along with their dependencies into lightweight, portable, and isolated units called containers. These containers can run consistently across different environments, such as development, testing, and production

## Virtualization
Virtualization is the process of creating a virtual version of computing resources, such as servers, storage, networks, or operating systems, instead of using physical hardware. It allows multiple virtual machines (VMs) to run on a single physical machine, improving efficiency and resource utilization.

## Disadvantages of virtualization
1. **Performance Overhead**: Virtual machines (VMs) may have slower performance compared to physical machines due to sharing of CPU, memory, and storage resources.
2. **High Initial Setup Cost**: Although virtualization saves costs in the long run, the initial setup requires investment in powerful hardware, virtualization software, and skilled professionals.
3. **Security Risks**: If a hypervisor or host is compromised, all the guest VMs can be affected. Shared resources may lead to **security vulnerabilities** like VM escape.
4. **Resource Contention**: Multiple VMs running on a single host can compete for resources, which may lead to performance degradation if not managed properly.
5. **Complex Management**: Managing a virtual environment, especially large-scale deployments, can be complex and requires **specialized knowledge** and tools.
6. **Licensing Issues**: Some software used within virtual machines may require separate licenses, increasing **licensing complexity and cost**.
7. **Limited Hardware Support**: Certain hardware-dependent applications or drivers may not function correctly in a virtual environment.
8. **Backup and Recovery Challenges**: While backup is possible, restoring a corrupted VM or recovering a full environment can be **time-consuming and require large storage**.
9. **Not Ideal for All Workloads**: Applications that require **high processing power or real-time performance** (e.g., high-end graphics rendering, low-latency trading systems) may not perform well in a virtualized setup.
10. **Downtime Risks with Host Failure**: If the physical host fails, **all VMs on that host go down**, potentially affecting multiple services at once.

## Difference between virtualization and containerization
Virtualization uses a hypervisor to create multiple virtual machines (VMs), each with its own full OS (Windows, Linux, etc.). This makes VMs heavier, as each OS consumes RAM, CPU, and storage separately. The isolation is stronger but comes with performance overhead. while,
Containerization runs multiple containers on a shared OS kernel. Instead of duplicating entire operating systems, containers only package the application and its dependencies, making them lighter, faster, and more efficient than VMs. However, they have weaker isolation since they rely on the same OS.

![diagram of cintanerition and virutulaization](con-vs-virtu.png)
## Hypervisor 
A hypervisor is software or firmware that allows multiple virtual machines (VMs) to run on a single physical machine by managing and allocating hardware resources like CPU, memory, and storage. It enables virtualization by creating and running isolated virtual environments on the same system

### Types of hypervisor

### 1. **Type 1 Hypervisor (Bare-metal Hypervisor)**
it Installed directly on the physical hardware and it does not require a host operating system. It manages guest operating systems directly through the hardware. and it aslo offers better performance and efficiency . it is commonly used in enterprise environments and data centers.
**Examples**:
* VMware ESXi
* Microsoft Hyper-V (in server mode)
* Xen
* KVM (Kernel-based Virtual Machine, often used with Linux)

### 2. **Type 2 Hypervisor (Hosted Hypervisor)**
It installed on top of a host operating system. It relies on the host OS for device support and management. It Easier to set up, suitable for personal or development use. it slightly lower performance compared to Type 1 due to an extra OS layer.
**Examples**:
* Oracle VirtualBox
* VMware Workstation
* VMware Player
* Parallels Desktop (for macOS)

## Installation of Docker in unbuntu machine 
```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

#Install the Docker packages, install the latest version, run:
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```
## Commands
### Working with Docker Images
```
docker pull <image_name>           # Download an image from Docker Hub  
docker images                      # List all downloaded images  
docker rmi <image_id>              # Remove an image  
docker build -t <image_name> .     # Build an image from a Dockerfile
```
### Running and Managing Containers
```
docker run <image_name>                     # Run a container from an image  
docker run -d -p 8080:80 <image_name>       # Run in detached mode & map port 8080  
docker run --name my_container <image>      # Assign a custom name to the container  
docker ps                                   # List running containers  
docker ps -a                                # List all containers (including stopped)  
docker stop <container_id>                  # Stop a running container  
docker start <container_id>                 # Restart a container  
docker rm <container_id>                    # Remove a container  
```
### Accessing Running Containers
```
docker exec -it <container_id> bash       # Open an interactive shell inside the container  
docker logs <container_id>                # View container logs  
docker inspect <container_id>             # Get detailed container info  
```


## Monolithic vs. Microservices 
- A monolithic application is a single, unified codebase where all components are tightly coupled and deployed as one unit. This makes it simpler to develop but harder to scale because any update requires redeploying the entire application. A failure in one part can bring down the whole system.
- In contrast, a microservices application is built as multiple independent services, each handling a specific function and communicating via APIs. This allows teams to develop, deploy, and scale services separately, making it more flexible and scalable but also more complex to manage.
While monolithic architectures are suitable for small applications due to their simplicity, microservices are better for large-scale applications that require scalability, flexibility, and fault isolation.

## Build image from Dockerfile 
A Dockerfile is a text file that contains a set of instructions to automate the creation of a Docker image. It defines the environment and dependencies required for an application to run inside a Docker container.

### Commands for build Docker image by Dockerfile
- Build image
```
docker build -t <img-name>:<tag> .
```
- run or create container
```
docker run -d -p <port>:<port> <img-name>:<tag>
```
- check on instance IP with port number

## DockerHub
Docker Hub is an online repository for container images, allowing developers to store, share, and manage Docker images easily. It serves as the default registry for Docker, where users can pull prebuilt images or push their own custom images

### command related to DockerHub
- To pull image from docker hub
```
docker pull nginx
```
- To push image to docker hub
```
docker tag <local-img-name>:<tag/imgname> <dock-hub-id>/<repo-name>:<tag/imgname>
docker push <dock-hub-id>/<repo-name>:<tag/imgname>
```
- search for an image
```
docker search ubuntu
```
Installation for minikube
```
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

Installtion for kubectl
```
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.32.0/2024-12-20/bin/linux/amd64/kubectl
```
