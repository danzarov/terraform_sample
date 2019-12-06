### Documentation to run and test the automation

1. Clone the repository

2. Export the environment variables below (these variables below will be needed for the kitchen test inspec, not the terraform)

```
export AWS_ACCESS_KEY_ID="<your-access-id>"           
export AWS_SECRET_ACCESS_KEY="<your-secret-key>"
export AWS_REGION='us-west-2'
```

3. Export the variables needed for the terraform code using TF_VAR_<variable_name> 

```
export AWS_ACCESS_KEY_ID="<your_aws_access_key>"
export AWS_SECRET_ACCESS_KEY="<your_aws_secret_key>"
export AWS_DEFAULT_REGION="us-west-2"

```

4. bundle install 

5. bundle exec kitchen test

6. bundle exec kitchen verify

####################################
###### SECOND PART - PACKER ########
####################################

1. cd packer

2. /usr/local/bin/packer validate example.json

3. /usr/local/bin/packer build example.json

note: the image name was found by using the aws cli describe command:
`ws ec2 describe-images --owners self amazon --region us-west-2`

####################################
#### THIRD PART - EC2 INSTANCE #####
####################################

1. cd ../ec2_instance_terraform

2. terraform init

3. Export the variables needed for the ec2 creation 

```
export TF_VAR_aws_instance_type="t2.micro"
export TF_VAR_aws_key_name="<your_key_name>"
```
3. terraform plan && terraform apply

4. ssh into the recently created ec2 instance and the files test1.txt and test2.txt from the s3 bucket will be located at /
