# CICD_building
- Practice the deployment of a web application in a production-style.
- Using github action to build CICD
- Using AWS service
- Create FastAPI application

**I. Set up AWS service:**

__Create EC2 IAM Instance Profile__

1. Go to AWS Management Console

2. Search for IAM and click the IAM Service.

3. Click Roles under Access Management in the left sidebar.

4. Click the Create role button.

5. Select AWS Service under Trusted entity type. Then select EC2 under common use cases.

6. Search for AWSElasticBeanstalk and select the AWSElasticBeanstalkWebTier, AWSElasticBeanstalkWorkerTier and AWSElasticBeanstalkMulticontainerDocker policies. Click the Next button.

7. Give the role the name of aws-elasticbeanstalk-ec2-role

8. Click the Create role button.


__Create Elastic Beanstalk Environment__

1. Go to AWS Management Console

2. Search for Elastic Beanstalk and click the Elastic Beanstalk service.

3. If you've never used Elastic Beanstalk before you will see a splash page. Click the Create Application button. If you have created Elastic Beanstalk environments and applications before, you will be taken directly to the Elastic Beanstalk dashboard. In this case, click the Create environment button. There is now a flow of 6 steps that you will be taken through.

5. You will need to provide an Application name, which will auto-populate an Environment Name.

6. Scroll down to find the Platform section. You will need to select the Platform of Docker. This will auto-select several default options. Change the Platform branch to Docker running on 64bit Amazon Linux 2. The new 2023 branch currently has issues with single-container deployments.

7. Scroll down to the Presets section and make sure that free tier eligible has been selected:

8. Click the Next button to move to Step #2.

9. You will be taken to a Service Access configuration form.

Select Create and use new service role and name it aws-elasticbeanstalk-service-role. You will then need to set the EC2 instance profile to the aws-elasticbeanstalk-ec2-role created earlier (this will likely be auto-populated for you).

10. Click the Skip to Review button as Steps 3-6 are not applicable.

11. Click the Submit button and wait for your new Elastic Beanstalk application and environment to be created and launch.

12. Click the link below the checkmark under Domain. This should open the application in your browser and display a Congratulations message.


__Update Object Ownership of S3 Bucket__

1. Go to AWS Management Console

2. Search for S3 and click the S3 service.

3. Find and click the elasticbeanstalk bucket that was automatically created with your environment.

4. Click Permissions menu tab

5. Find Object Ownership and click Edit

6. Change from ACLs disabled to ACLs enabled. Change Bucket owner Preferred to Object Writer. Check the box acknowledging the warning.

7. Click Save changes.

__Create an IAM User__

1. Search for the "IAM Security, Identity & Compliance Service"

2. Click "Create Individual IAM Users" and click "Manage Users"

3. Click "Add User"

4. Enter any name you’d like in the "User Name" field.

eg: docker-react-travis-ci

5. Click "Next"

6. Click "Attach Policies Directly"

7. Search for "beanstalk"

8. Tick the box next to "AdministratorAccess-AWSElasticBeanstalk"

9. Click "Next"

10. Click "Create user"

11. Select the IAM user that was just created from the list of users

12. Click "Security Credentials"

13. Scroll down to find "Access Keys"

14. Click "Create access key"

15. Select "Command Line Interface (CLI)"

16. Scroll down and tick the "I understand..." check box and click "Next"

Copy and/or download the Access Key ID and Secret Access Key to use in the Travis Variable Setup.

**II. Create Repository secrets:**
1. Go to __Setting > Actions secrets and variables__

2. Create Repository secrets AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, DOCKER_HUB_TOKEN, DOCKER_HUB_USERNAME
   
- P/s: Get DOCKER_HUB_TOKEN and DOCKER_HUB_USERNAME from https://hub.docker.com/
   
