# Workspaces

•  Terraform workspaces are a feature that allows you to manage multiple instances of the same configuration with isolated state files. This can be useful for testing, staging, or deploying different versions of your infrastructure.

•  To create a new workspace, use the command terraform workspace new <workspace-name>. This command initializes a new workspace and sets it as the active one.

•  To list all the available workspaces, use the command terraform workspace list. This command shows the names of the workspaces and marks the current one with an asterisk (*).

•  To switch to an existing workspace, use the command terraform workspace select <workspace-name>. This command changes the active workspace and updates the state file accordingly.

### Example 
Create a new workspace for development :
```
terraform workspace new dev
```
 Create a new workspace for stageing:

```
terraform workspace new stage
```

•  To delete a workspace, use the command terraform workspace delete <workspace-name>. This command removes the workspace and its state file. You cannot delete the default workspace or the current workspace.

### Example 
Delete a workspace for stageing :

```
terraform workspace delete stage
```

•  To show the name of the current workspace, use the command terraform workspace show. This command prints the name of the active workspace to the standard output.

### Show current workspace
```
terraform workspace show dev
```

### Switch to the workspace
```
terraform workspace select dev
                or 
 terraform workspace select stage
                or 
 terraform workspace select prod
```
### Apply the configuration to create an EC2 instance in the development workspace or 
terraform apply