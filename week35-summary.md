# Week 35 Review: Tracing the Continuous Integration (CI) Flow

This week, I successfully bridged the gap between source code and deployable artifacts by engineering a fully autonomous CI pipeline. I resolved Linux permission boundaries, secured API credentials, and eliminated the "Manual Tax" of building and storing Docker images.

Here is the exact architectural flow of what happens when a developer pushes a code change to our FinTech application:

## The CI Lifecycle Trace



### 1. The Trigger (GitHub ➔ Jenkins)
* **Action:** A developer commits a code change and runs `git push origin main` on the `fintech-app-docker` repository.
* **Event:** GitHub detects the push and fires a Webhook (an HTTP POST payload) to my AWS EC2 instance at `http://<JENKINS_IP>:8080/github-webhook/`.
* **Wake-up:** Jenkins receives the payload, verifies the repository matches a configured job, and triggers a new build sequence.

### 2. Initialization & Code Retrieval (Stage 1)
* Jenkins reaches out to the `jenkins-pipeline` repository to fetch the latest Declarative `Jenkinsfile` (Pipeline as Code).
* Once the logic is loaded, Jenkins begins **Stage 1: Cloning Code**. It executes a `git clone` to pull the actual application source code from `fintech-app-docker` into its local workspace.

### 3. Verification (Stage 2)
* Jenkins enters **Stage 2: Running Tests**.
* It executes the defined testing shell scripts to ensure the new code has not broken any existing functionality (currently simulated, but architecturally ready for PyTest/Jest). 
* If tests fail, the pipeline aborts, preventing broken code from being packaged.

### 4. Artifact Creation (Stage 3)
* Jenkins moves to **Stage 3: Build Docker Image**.
* Using the permissions granted to the `jenkins` user (via the `docker` Linux group), the pipeline communicates directly with the host's Docker Daemon.
* It navigates to the `./backend` directory and runs `docker build`. The Dockerfile instructions are executed layer by layer, resulting in a compiled, containerized image tagged as `latest`.

### 5. Secure Distribution (Stage 4)
* Jenkins executes **Stage 4: Push to Docker Hub**.
* **Authentication:** The pipeline securely unlocks my Docker Hub credentials from the Jenkins Vault (`withCredentials`), masking the password in the console logs.
* **Versioning:** It dynamically tags the new image with the unique Jenkins execution ID (e.g., `voncleph/fintech-app:v12`). This ensures an immutable history for rollbacks.
* **Upload:** Jenkins pushes both the `latest` tag and the specific `v12` tag to the Docker Hub cloud registry.
* **Cleanup:** The pipeline executes `docker logout` to secure the host.

## Conclusion
The application is now containerized, versioned, and sitting safely in the cloud registry, ready for the Continuous Deployment (CD) phase. Human intervention is officially zero.
