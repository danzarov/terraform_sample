### Documentation to run and test the automation

1. Clone the repository

2. Export the environment variables below

```
export AWS_ACCESS_KEY_ID="<your-access-id>"           
export AWS_SECRET_ACCESS_KEY="<your-secret-key>"
```
3. Change the values of a few variables in the terraform.tfvars file

4. bundle install 

5. bundle exec kitchen test

6. bundle exec kitchen verify
