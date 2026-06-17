# Week 53: Version Control and Git Operations

Today I focused on advanced version control, specifically preparing to answer complex Git scenario questions for DevOps interviews.

## Merge vs. Rebase
The most critical concept to articulate is the difference between merging and rebasing when integrating branches.
* **Merging** is non-destructive. It ties two branch histories together using a new "merge commit." It is safe for public branches but can create a cluttered, non-linear commit history.
* **Rebasing** rewrites history. It lifts the commits from the feature branch and replays them on the tip of the target branch. This creates a perfectly linear, clean history. However, rebasing a shared/public branch is a massive anti-pattern that will corrupt the repository state for other developers.

## Incident Recovery
I also reviewed incident recovery commands. Understanding the distinction between `git revert` (safely rolling forward by creating an inverse commit) and `git reset` (destructively rolling backward) is essential when managing production codebases and recovering from bad deployments.
