# Terraform Windows Server Deployment Guide

## Table of Contents
1. [Repository Structure](#repository-structure)
2. [Initial Setup](#initial-setup)
3. [PR-Driven Workflow](#pr-driven-workflow)
4. [Available Commands](#available-commands)
5. [Best Practices](#best-practices)
6. [Troubleshooting](#troubleshooting)

## Repository Structure
```
your-repo/
├── .github/
│   └── workflows/
│       └── main.yml
└── aws/
    └── terraform/
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        └── providers.tf
```

## Initial Setup

1. Configure AWS Credentials:
   ```bash
   # Add these secrets to your GitHub repository
   AWS_ACCESS_KEY_ID
   AWS_SECRET_ACCESS_KEY
   ```

2. Branch Protection Rules:
   - Go to Settings → Branches
   - Add rule for `main`
   - Require pull request reviews
   - Require status checks to pass

## PR-Driven Workflow

### Creating a New Deployment

1. Create a new branch:
   ```bash
   git checkout -b feature/new-windows-server
   ```

2. Make your changes to Terraform files

3. Create Pull Request:
   ```bash
   git push origin feature/new-windows-server
   # Create PR through GitHub interface
   ```

4. Automatic Actions:
   - Workflow will run automatically
   - Plan will be posted as comment
   - State changes will be highlighted

### Using Comment Commands

The workflow supports Atlantis-like commands in PR comments:

1. View Current Plan:
   ```
   /terraform plan
   ```
   - Posts complete plan output
   - Shows resource changes
   - Lists additions, modifications, deletions

2. Apply Changes:
   ```
   /terraform apply
   ```
   - Applies current plan
   - Posts apply output
   - Shows any errors
   - Provides connection details for successful deployments

3. Show Current State:
   ```
   /terraform show
   ```
   - Shows current Terraform state
   - Lists all resources
   - Shows output values

4. Lock/Unlock PR:
   ```
   /terraform lock
   /terraform unlock
   ```
   - Controls concurrent modifications
   - Prevents race conditions

### Command Flow Example

```
1. Create PR with changes
   → Automatic plan runs

2. Review plan in PR comment
   → "/terraform show" to verify current state

3. Request changes if needed
   → "/terraform plan" to see new plan

4. Ready to apply
   → "/terraform lock" to prevent concurrent changes
   → "/terraform apply" to implement changes
   → "/terraform unlock" when complete
```

## Best Practices

1. Always Review Plans:
   - Check resource changes
   - Verify costs
   - Validate security groups

2. Use Locking:
   - Lock PR before applying
   - Unlock after completion
   - One change at a time

3. State Management:
   - Use "/terraform show" to verify state
   - Check outputs after apply
   - Monitor resource creation

4. Security:
   - Review security group changes
   - Validate IP restrictions
   - Check instance types

## Troubleshooting

### Common Issues

1. Plan Failures:
   ```
   /terraform plan
   # Review error message in comment
   ```

2. Apply Failures:
   - Check AWS credentials
   - Verify resource limits
   - Review error messages

3. State Issues:
   ```
   /terraform show
   # Identify state discrepancies
   ```

### Getting Help

1. If workflow fails:
   - Review Actions tab
   - Check PR comments
   - Verify AWS permissions

2. For state issues:
   ```
   /terraform show
   # Share output in issue
   ```

3. Debug command:
   ```
   /terraform plan -debug
   # Provides verbose output
   ```

## Windows Server Access

After successful deployment:
1. Find connection details in workflow artifacts
2. Download RDP credentials
3. Use Windows Remote Desktop to connect

## Maintenance

1. Regular Updates:
   ```
   /terraform plan
   # Review regular maintenance changes
   ```

2. Security Patches:
   - Create PR with updates
   - Use workflow commands to apply
   - Verify connectivity after changes

Remember:
- Always review plans before applying
- Use locking for concurrent changes
- Monitor workflow execution
- Keep credentials secure
