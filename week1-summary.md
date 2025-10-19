# Weekly Summary: Week 1 - Linux Core Concepts

**Date:** June 22, 2025
**Week Focus:** Foundational Linux Commands, Filesystem, Permissions, and Initial Development Environment Setup.

---

## What I Learned and Practiced This Week

This week was focused on building a strong foundation in Linux, from theoretical concepts to practical command-line usage and setting up a basic development environment.

### Theoretical Concepts (Monday & Tuesday)
* **Linux Filesystem Hierarchy Standard (FHS):** Gained understanding of the purpose of key directories like `/bin`, `/etc`, `/home`, and `/var`.
* **User & Group Management:** Explored concepts behind `useradd`, `usermod`.
* **File Permissions:** Studied `chmod` and `chown` in detail.

### Practical Linux Command-Line Skills (Wednesday & Thursday)
* **Filesystem Navigation:**
    * `pwd`: Confirming current directory.
    * `ls` (with `-l`, `-a` flags): Listing contents and viewing detailed information.
    * `cd`: Moving between directories.
    * `mkdir`: Creating new directories, including nested structures (`-p`).
    * `rmdir`: Removing empty directories.
* **File Manipulation:**
    * `touch`: Creating empty files and updating timestamps.
    * `cp`: Copying files and directories (recursively with `-r`).
    * `mv`: Moving and renaming files/directories.
    * `rm`: Deleting files and directories (carefully using `-r`).
* **File Permissions (`chmod`):**
    * Applied changes using both **symbolic notation** (`u+x`, `go-w`, `u=rw`) and **octal (numeric) notation** (`755`, `644`).

### Development Environment Setup & Version Control (Friday & Saturday)
* **Virtualization Setup:** Installed and configured KVM/QEMU via `virt-manager` on my Ubuntu host.
* **Ubuntu Server VM:** Created and installed an Ubuntu Server virtual machine.
* **GitHub Repository:** Created my `linux-journey` repository on GitHub and cloned it locally.
* **Git Basics:** Used `git add`, `git commit`, and `git push` to manage changes.
* **Documentation:** Wrote a detailed `README.md` for my repository, explaining the commands mastered.

---

## What Was Easy

Overall, the theoretical concepts around the Linux Filesystem Hierarchy and User/Group Management were relatively straightforward to grasp. Once the commands were introduced, I found the basic filesystem navigation commands (`pwd`, `ls`, `cd`) and simple file manipulation (`touch`, `cp`, `mv`) to be intuitive and quick to pick up.

The process of installing Git and executing the initial `git clone`, `git add`, and `git commit` commands also felt manageable once the exact steps were provided. The step-by-step guidance really helped in making these initial interactions with the command line feel less daunting.

---

## What Was Challenging

The most significant challenges this week arose during the **"Project: Set up your primary development environment"** on Friday and the subsequent **"Documentation"** task on Saturday.

1.  **Virtual Machine Networking (KVM/virt-manager):**
    * **Challenge:** When setting up the Ubuntu Server VM in `virt-manager`, I faced an unexpected hurdle with network configuration. I initially tried to set up a "Bridged device" for the VM to have direct network access, but `virt-manager` did not present any host interfaces for selection. This indicated a missing network bridge setup on my Ubuntu host system.
    * **Resolution:** To avoid getting stuck, I decided to proceed by using the **"Virtual network 'default': NAT"** option. This successfully allowed the VM to access the internet and enabled SSH access from my host, allowing me to complete the VM installation. This was a critical pivot that allowed me to keep moving forward.

2.  **GitHub Authentication for Pushing Changes:**
    * **Challenge:** After setting up my `linux-journey` repository and creating the `README.md` file, I encountered a `fatal: Authentication failed` error when attempting my first `git push`. The error indicated that password authentication over HTTPS was no longer supported by GitHub since August 2021.
    * **Resolution:** I learned about and successfully generated a **Personal Access Token (PAT)** from my GitHub account settings. By using this PAT as the password during the `git push` command, I was able to successfully authenticate and push my changes to the remote repository. This was a crucial learning point for modern Git workflows.

While no major *challenges* were explicitly reported for `chmod`, mastering both its symbolic and octal notations required focused practice to fully internalize the numeric values and their implications for different permission sets.

---

## Future Goals Based on This Week

* Continue practicing Linux commands to build muscle memory.
* Further explore advanced `chmod` and `chown` scenarios.
* Deepen my understanding of network bridging on my Ubuntu host system for KVM, as identified during the VM setup.
* Become more comfortable with the Git command line, expanding beyond `add`, `commit`, and `push`.
