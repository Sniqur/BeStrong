# Deploying the necessary cloud infrastructure with Terraform

## Plan 
**1) Write Terraform code for configuration of the following bunch of resources**:
        
* 1 App Service Plan
      
* 1 App Service - integrate with VNet, enable System Managed Identity
        
* 1 Application Insights - linked to App Service

* 1 ACR - Azure Container Registry, grant App Service Identity access to it

* 1 Key Vault - grant permissions to App Service Identity, integrate with VNet
        
* 1 VNet
        
* 1 MS SQL Server DB - Private Endpoint needs to be configured
        
* 1 Storage account - configure Private Endpoint with VNET and mount Fileshare to App Service
        
* 1 Storage account for Terraform state



**2) Write your own Azure DevOps Pipeline build flow using YAML syntax and commit it into your GitHub.**

**3) Build and deploy from the the main branch.**

**4) CI/CD pipeline should include the following steps: terrafrom init, terraform validate, terraform plan and terraform apply (manual approval required). CI/CD on PR should include the following steps: terrafrom init, terraform validate and terraform plan.**

**5) Create a pipeline in Azure DevOps from YAML file and deploy infrastructure into Azure Cloud using Terraform in CI/CD. Use Github service connection to access the repo, Azure service principal connection to grant Azure agent the necessary permissions to perform actions on Azure.**


## Short Description

### All the tasks are accomplished using DevOps best practices: 

*Terraform infrastructure is divided into modules that are reusable.*

*All the sensetive data is transmitted via `Variable Group` inside Azure DevOps.*

*All the additional tasks that are mentioned in requirements (grant permissions for some resources and setting private endpoints) are fully accomplished.*
