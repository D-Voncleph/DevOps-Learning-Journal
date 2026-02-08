# Week 34 Review: The Power of Pipeline as Code

## The Shift: UI vs. Code
This week, I moved from configuring Jenkins jobs manually in the browser ("Freestyle Projects") to defining them programmatically in a `Jenkinsfile` ("Pipeline Projects").

## Why Jenkinsfile (Git) is Superior to UI Configuration

### 1. Version Control & History
* **UI:** If I change a build setting and it breaks the pipeline, there is no "Undo" button. I cannot easily see what changed or who changed it.
* **Jenkinsfile:** Every change is a Git commit. I can use `git diff` to see exactly what line of code caused the error, and `git revert` to fix it instantly.

### 2. Disaster Recovery
* **UI:** If my EC2 instance crashes and the disk is lost, all my job configurations are gone forever. I would have to remember which boxes to check to rebuild it.
* **Jenkinsfile:** My build logic is stored safely in GitHub. To restore my pipeline on a new server, I simply connect the repository. The logic is immortal.

### 3. Collaboration (Code Review)
* **UI:** Only admins can change settings, and they do it in isolation.
* **Jenkinsfile:** The pipeline is just code. My team can submit Pull Requests to update the build process (e.g., "Add a new test stage"). We can review, discuss, and approve changes to the *infrastructure* just like we do for the *application*.

### 4. Single Source of Truth
* **UI:** The "truth" is hidden inside Jenkins' internal XML database.
* **Jenkinsfile:** The "truth" is visible right next to the source code. Anyone looking at the repo understands exactly how the software is built and tested.

## Conclusion
"Pipeline as Code" transforms the build process from a manual, fragile task into a robust, engineered system.
