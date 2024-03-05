1. Which of the following commands initializes a Terraform working directory?
   - a) terraform init
   - b) terraform plan
   - c) terraform apply
   - d) terraform validate

2. What is the purpose of the Terraform command `terraform plan`?
   - a) Applies changes to infrastructure
   - b) Validates and prints an execution plan
   - c) Initializes a new Terraform configuration
   - d) Destroys Terraform-managed infrastructure

3. Which file contains the main configuration for Terraform?
   - a) main.tf
   - b) terraform.tf
   - c) configuration.tf
   - d) terraform.config

4. Which Terraform block is used to define AWS EC2 instances?
   - a) resource
   - b) provider
   - c) module
   - d) variable

5. What is the purpose of Terraform modules?
   - a) They define input variables for configurations
   - b) They provide reusable configurations
   - c) They execute Terraform commands
   - d) They store state files for deployments

6. Which command is used to apply changes to infrastructure defined in Terraform configuration?
   - a) terraform plan
   - b) terraform apply
   - c) terraform validate
   - d) terraform destroy

7. Which Terraform command is used to destroy the Terraform-managed infrastructure?
   - a) terraform destroy
   - b) terraform remove
   - c) terraform clean
   - d) terraform stop

8. What is the purpose of Terraform `variable` blocks?
   - a) To define resources in the configuration
   - b) To specify input parameters for the configuration
   - c) To manage state files
   - d) To define providers for the configuration

9. Which Terraform command is used to validate the syntax and configuration files?
   - a) terraform check
   - b) terraform test
   - c) terraform verify
   - d) terraform validate

10. What is the purpose of Terraform `output` blocks?
    - a) To define resources in the configuration
    - b) To specify input parameters for the configuration
    - c) To manage state files
    - d) To provide information about what was created after applying the configuration

11. What is the purpose of Terraform's state file?
    - a) It tracks the history of Terraform commands
    - b) It maintains the current state of infrastructure
    - c) It stores input variables
    - d) It manages Terraform modules

12. What is the recommended way to manage sensitive information, such as passwords or API keys, in Terraform?
    - a) Hardcode them directly into the configuration files
    - b) Store them in plain text files within the project directory
    - c) Use Terraform's built-in secure storage mechanism
    - d) Utilize environment variables or external secret management tools

13. Which command is used to create an execution plan without applying changes in Terraform?
    - a) terraform plan
    - b) terraform apply
    - c) terraform validate
    - d) terraform refresh

14. In Terraform, what does the "tfstate" extension refer to?
    - a) Terraform state file
    - b) Terraform configuration file
    - c) Terraform log file
    - d) Terraform output file

15. What does Terraform's "provider" block define?
    - a) Input variables for the configuration
    - b) Resources to be provisioned
    - c) External services or platforms to interact with
    - d) Output values after applying the configuration

16. How does Terraform determine the order in which resources are created?
    - a) Alphabetically based on resource names
    - b) Based on the order of resource definitions in the configuration file
    - c) Randomly
    - d) It does not guarantee a specific order

17. Which Terraform command is used to refresh the state of the managed infrastructure?
    - a) terraform refresh
    - b) terraform apply
    - c) terraform plan
    - d) terraform destroy

18. What does Terraform's "backend" block define?
    - a) Resources to be provisioned
    - b) Input variables for the configuration
    - c) External services for state storage and operations
    - d) Output values after applying the configuration

19. What is the purpose of Terraform's "locals" block?
    - a) To define input variables for the configuration
    - b) To specify output values after applying the configuration
    - c) To manage local state files
    - d) To declare local values or expressions

20. Which Terraform command is used to import existing infrastructure into Terraform state?
    - a) terraform import
    - b) terraform apply
    - c) terraform init
    - d) terraform refresh

21. What is the purpose of Terraform's `for_each` meta-argument?
    - a) Iterates over a list or map of resources
    - b) Defines dependencies between resources
    - c) Specifies the number of resource instances to create
    - d) Manages Terraform state files

22. What is the role of Terraform's `remote-exec` provisioner?
    - a) Executes commands on the Terraform host
    - b) Executes commands on the provisioned infrastructure
    - c) Manages remote Terraform state
    - d) Validates configuration syntax

23. How can you organize Terraform configurations into reusable components?
    - a) Using Terraform modules
    - b) Using Terraform plugins
    - c) Using Terraform providers
    - d) Using Terraform workspaces

24. Which command is used to format Terraform configuration files according to a canonical format?
    - a) terraform fmt
    - b) terraform check
    - c) terraform test
    - d) terraform validate

25. What does Terraform's `count` meta-argument do?
    - a) Specifies the number of times a resource should be provisioned
    - b) Counts the total number of resources in a configuration
    - c) Defines the number of iterations in a loop
    - d) Calculates the total cost of resources

26. What is the purpose of Terraform's `depends_on` meta-argument?
    - a) Specifies the order of resource creation
    - b) Defines dependencies between resources
    - c) Manages Terraform provider configurations
    - d) Handles input variables

27. How does Terraform handle changes to resource configurations?
    - a) By destroying and recreating resources
    - b) By automatically updating resources
    - c) By prompting the user for manual intervention
    - d) By ignoring changes to resource configurations

28. What is the purpose of Terraform's `local-exec` provisioner?
    - a) Executes commands on the Terraform host
    - b) Executes commands on the provisioned

 infrastructure
    - c) Manages local Terraform state
    - d) Validates configuration syntax

29. Which Terraform command is used to delete resources from the state file without removing the infrastructure?
    - a) terraform clear
    - b) terraform remove
    - c) terraform state rm
    - d) terraform destroy

30. What is the primary advantage of using Infrastructure as Code (IaC) tools like Terraform?
    - a) Simplified management of infrastructure
    - b) Increased security of infrastructure
    - c) Enhanced performance of infrastructure
    - d) Greater scalability of infrastructure
