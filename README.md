### 1. Init
- Fork github repo
- Github connection
- ECR store Image
### 2. CI 
- CodePipeline
- IAM Role for CodePipeline
- IAM Role for Codebuild
ECR Policy:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:CompleteLayerUpload",
                "ecr:GetDownloadUrlForLayer",
                "ecr:InitiateLayerUpload",
                "ecr:PutImage",
                "ecr:UploadLayerPart"
            ],
            "Resource": "arn:aws:ecr:ap-southeast-1:367988507966:repository/web",
            "Effect": "Allow",
            "Sid": "EcrAccess"
        },
        {
            "Action": "ecr:GetAuthorizationToken",
            "Resource": "*",
            "Effect": "Allow",
            "Sid": "EcrGetAuthorizationToken"
        }
    ]
}
```
- codebuild
### 3. CD
#### 3.1: ASG (EC2)
- IAM Role
- Launch template
- ASG

#### 3.2: Codedeploy
- IAM Role for CodeDeploy
- CodeDeploy Application
- CodeDeploy Deployment Group 
- Add CodeDeploy to Stage of CodePipeline
 
