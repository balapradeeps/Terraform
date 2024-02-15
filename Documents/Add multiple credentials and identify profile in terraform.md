# Add Multiple Credentials in Terraform

To add multiple credentials in ~/.aws/credentials on a Windows and Linux machine, you can follow these steps:

- Open a command prompt or terminal 

- Navigate to the .aws directory: Type the following command to navigate to the .aws directory:

## Windows
```
"cd C:\Users\PPC 1\.aws"
```
## Linux
```
"cd ~/.aws/" 
```

- Add the credentials: In the credentials file, you can add multiple credentials in the following format:

```
[profile1]
aws_access_key_id = your_access_key_id
aws_secret_access_key = your_secret_access_key

[profile2]
aws_access_key_id = your_access_key_id
aws_secret_access_key = your_secret_access_key
``` 
- Replace `profile1` and `profile2` with a name of your choice for each set of credentials. 

- Replace `your_access_key_id` and `your_secret_access_key` with the appropriate values for each set of credentials.

Save the file: After adding the credentials, save the credentials file and close Notepad.

To identify the individual credentials for each account to use in VSCode Terraform,
You can specify the profile name in the AWS provider configuration in your Terraform code. For example:

```
provider "aws" {
  region     = "us-west-2"
  profile    = "profile1"
}
```

- Replace "profile1" with the name of the profile for the set of credentials you want to use. 
This will ensure that Terraform uses the correct set of credentials for each AWS account.