# Virtual Machines

 ## What is Servers?
  Suppose your app or website is in local computer and you want to show to the customers or real world so, you hosted your wesbite/app to the Public Server. 
     
## What is Virtualization & hypervisor?
  A hypervisor is a crucial component in virtualization technology. 
  It allows multiple operating systems (OSes) to run simultaneously on a single physical machine (host), each in its own isolated environment (called a virtual machine or VM). 
  This process is known as virtualization.
  Two Types of Hypervisors:
  **Type 1 Hypervisor (Bare-metal):**
  This hypervisor runs directly on the physical computer, without needing an operating system.
  **Type 2 Hypervisor (Hosted):**
  This one runs on top of an existing operating system (like Windows or Linux). It’s like an app running inside your main OS that lets you create and manage virtual computers.
    
## Why the Virtualization Concept came into being?
  Suppose an organization have 5 Servers and deployed an app in server 1 with app required 4 GB RAM and 4 CPUs and the Server size is 100 GB and 100 cores, so the remaining resources of the server is unused 
  and we are wasting the resources. So this was the actual problem that organization were facing to not utilize resources properly so there came the Virtualization concept.
    
## So what Virtualization does?
   Suppose We bought a server1 and does a hypervisor on it. so **what is hypervisor?**
   Hypervisor is a s/w that install, create & manage VM on your machines. It allows multiple OS to run concurrently on a single physical machine .
   It is a logical isolation or logical partition. breaking server into logical partition.
   we call logical because they don't exist physically. so they are VMs. we add efficiency by adding hypervisor
   **Popular hypervisor:** VMware, xen etc
   Every VM is have it's own Memory, Cpu, Storage.
