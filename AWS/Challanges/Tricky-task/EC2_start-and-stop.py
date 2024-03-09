import boto3

def lambda_handler(event, context):
    # Initialize EC2 client
    ec2_client = boto3.client('ec2')
    
    # Define filters to identify instances to start
    filters = [
        {
            'Name': 'tag:AutoStart',
            'Values': ['true']
        },
        {
            'Name': 'instance-state-name', 
            'Values': ['stopped']
        }
    ]
    
    # Get instances matching the filters
    instances = ec2_client.describe_instances(Filters=filters)
    
    # Start instances
    for reservation in instances['Reservations']:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            ec2_client.start_instances(InstanceIds=[instance_id])
            print(f"Started instance: {instance_id}")

def lambda_handler(event, context):
    # Initialize EC2 client
    ec2_client = boto3.client('ec2')
    
    # Define filters to identify instances to stop
    filters = [
        {
            'Name': 'tag:AutoStop',
            'Values': ['true']
        },
        {
            'Name': 'instance-state-name', 
            'Values': ['running']
        }
    ]
    
    # Get instances matching the filters
    instances = ec2_client.describe_instances(Filters=filters)
    
    # Stop instances
    for reservation in instances['Reservations']:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            ec2_client.stop_instances(InstanceIds=[instance_id])
            print(f"Stopped instance: {instance_id}")
