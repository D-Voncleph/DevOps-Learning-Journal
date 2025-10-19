## AWS Root User: A Major Security Risk

Based on my learning this week, I've come to understand that using the AWS root user for daily tasks is a major security risk and a practice that should be strictly avoided.

The root user is the account I created when I first signed up for AWS. It possesses unrestricted and complete control over every single resource in my entire account. This is similar to having a master key to a bank—it gives me the power to delete the entire account, alter billing, or make irreversible changes. In a professional or even personal context, having these keys exposed for routine work is a massive security vulnerability.

This is why the "principle of least privilege" is so important. Instead of using the root user's master key, the best practice is to create a specific IAM user for myself. This user has no permissions by default and is only granted the specific permissions needed to perform its job, and nothing more. I demonstrated this by creating an IAM user named voncleph-devops for my daily tasks.

By following this practice, I minimize the risk of a simple mistake or a security breach causing catastrophic damage to my account. Using an IAM user for daily tasks is not just a recommendation; it's a fundamental security discipline for any cloud professional.