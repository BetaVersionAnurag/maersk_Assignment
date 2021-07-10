# maersk_tf_templates for azure
terraform templated for maersk
__________________________________________________________________________________________________________
1) What are different artifacts you need to create - name of the artifacts and its purpose

These are below artifacs we meed to create- 

Main.tf -> 
To Configure the Microsoft Azure Provider
To create the new resource group

network.tf ->
Create virtual network
create subnets

nsg.tf -> 
create network security group to open port 80 and 443

sa.tf
to create Storage account

vm1.tf
To create 1 VM

vm2.tf
to create 2nd VM
__________________________________________________________________________________________________________

2. List the tools you will to create and store the Terraform templates.

Tf templates will be created using any code editor
Can be stored in code repo i.e. git hub

Explain the process and steps to create automated deployment pipeline.

_________________________________________________________________________________________________________________

3. Deploy resources using Terraform in Azure DevOps
Follow the below steps with Azure DevOps and its pipelines.

Login into Azure DevOps and navigate to an existing project in Azure DevOps or create a new one. 
Select Repos and click create a folder and upload the terraform file for deploying resources. (Upload all the files which we have created above)

Navigate to Pipelines –> Releases. Click New and select New release pipeline and click empty job.
Provide a name for stage “prod” and click the close button. 
Select Add an artifact and choose Azure repository. 
Choose a project created in Azure DevOps in step 1 and select the repository where network.tf is stored.
Select the master branch and latest from the default branch in default version and click ADD.
Select prod stage and click View stage tasks to view the pipeline tasks.
Click + in Agent job, search for terraform and click add on terraform tool installer once and terraform with thrice (need to add three tasks).
Select the first Terraform task and change the display name as Terraform init. Ensure provider as Azurerm and command as “init”. Select the configuration directory where our tf files are stored .
Select Azure subscription and authorize it. Choose your resource group, storage account, and blob container for storing terraform state files (terraform.tfstate). 
Select the second Terraform task and change the display name as Terraform plan. Provider as Azurerm and choose command as “Plan”. Select the configuration directory where our tf files are stored. Choose your Azure subscription for deployment. 
Select the last Terraform task and change display name as Terraform apply. Ensure provider as Azurerm and command as “validate and apply”. Select the configuration directory as network.tf is stored. 
Once you are done, Save the changes and Create a release.
Once the release is a success, navigate to your Azure portal. Search for the name of the resource group which defined in the variable file and check virtual network is deployed.


______________________________________________________________________________________________________________________________________________________________________

4.) sample Terraform templates have been created and and available in this reposiroty.

___________________________________________________________________________________________________________________________________

5) Explain how will you access the password stored in Key Vault and use it as Admin Password in the VM
Terraform template.

This concept is implemented in the VM1.tf



