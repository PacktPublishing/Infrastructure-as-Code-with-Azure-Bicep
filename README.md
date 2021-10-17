# Infrastructure as Code with Azure Bicep

This is the code repository for Infrastructure as Code with Azure Bicep published by Packt.

## Background

The idea to write this book hit me when Azure Bicep was released and after working with ARM templates for quite a while to deploy resources on Microsoft Azure. I truly believe resource deployment should not be complex and infrastructure as code is a must have for every organization.
In this book you will start with some basics and a review on Azure ARM templates and why there was a need for a revision to remove some barriers and make it easier for cloud engineers and DevOps teams to deploy their resources using code. From installation to writing your first template in your local development environment, testing, and deploying it locally, you will learn it all. You will find out about Bicep’s syntax and how to write maintainable and reusable templates which can be used in your continuous deployment pipelines with ease. And at the end there will be some of the best practices and industry standards which you need to be aware of.
The book is structured in a way which goes from basics to advanced topics, so that you would not have any problems following along even if you have not had prior experience with Azure ARM templates or resource deployments via templates before.

## Who this book is for

This book has targeted cloud engineers, DevOps teams and developers who are responsible for creating their infrastructure as code (IoC) to deploy their resources in their Azure environment.

## What this book covers

- **Chapter 1**: Introduction to Azure Bicep, this chapter will describe what is Azure Bicep, why it was created, and some of the goals it’s trying to achieve.
- **Chapter 2**: Installing Azure Bicep, in this chapter you will learn how to install Azure Bicep on different operating systems along with Azure CLI and Azure PowerShell.
- **Chapter 3**: Authoring Experience, this chapter is all about the developer experience when writing Bicep templates in their local development, especially using Visual Studio Code and its Bicep extension.
- **Chapter 4**: Compiling and Decompiling to Bicep files, this chapter will cover how to compile Bicep templates to ARM templates before deployment, or if there is an existing ARM template, how to decompile it to a Bicep file.
- **Chapter 5**: Defining Resources, from this chapter you will learn how to define resources in a Bicep template, their properties, and dependencies, and some of the language specification which helps you to understand why Bicep is designed the way it is.
- **Chapter 6**: Using Parameters, Variables and Template Functions, this chapter takes you one step further to make your template customizable, remove duplicate expressions using variables, and use the template functions to create better, more reusable templates.
- **Chapter 7**: Understanding Expressions, Conditions and Loops, this chapter will expand on the previous chapter to help you write template expressions, use logical flows and conditions, and use loops to create a resource multiple times without repeating the syntax.
- **Chapter 8**: Defining Modules and Utilizing Outputs, this chapter will introduce modules to you and helps you create modular, reusable templates which not only can be consumed by own templates, but also other teams within your organization. It also reviews template outputs and how to send information about the deployment outside of your templates.
- **Chapter 9**: Deploying a Local Template, from this chapter you will start the process of validating and deploying your templates. Before you start using your templates in your CI/CD pipelines, you need to know how to test and deploy them locally, and that is what you will learn here.
- **Chapter 10**: Using Bicep in Azure Pipelines, this chapter will help you setup an Azure Pipeline to deploy your Azure resources from Azure Repos. It covers not only creation of the pipeline, but also how to add the necessary steps to validate and deploy a Bicep template.
- **Chapter 11**: Using Bicep in GitHub Actions, this chapter will help you validate and deploy your Bicep templates from GitHub using GitHub Actions workflow.
- **Chapter 12**: Exploring Best Practices for Future Maintenance, this chapter will complement your learnings by introducing you to some best practices which take your Bicep template creation to the next level.

## To get the most out of this book

To take full advantage of this book, you will need to have the following list of software installed on your system. You also need to have an Azure DevOps and a GitHub account. Finally, you need to have an active Azure Subscription which you can get for free, all of which has been described in the book.
| Software/Hardware covered in the book | OS Requirements |
|--------------|-------------|
| Azure CLI | Windows, Mac OS X, and Linux (Any) |
| Azure PowerShell | Windows, Mac OS X, and Linux (Any) |
| Visual Studio Code | Windows, Mac OS X, and Linux (Any) |
| Git | Windows, Mac OS X, and Linux (Any) |

I highly recommend the readers to follow along with the book to get the best out of it, also feel free to use other type of resources for your own benefit and when in doubt, always refer to [Microsoft’s documentation on Bicep](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview).

## Conventions used

There are several text conventions used throughout this book.

`Code in text`: Indicates code words in text, database table names, folder names, filenames, file extensions, pathnames, dummy URLs, user input, and Twitter handles.

Here is an example: "If you wanted to upgrade your Bicep you can use the `upgrade` command."

A block of code is set as follows:

```JAVASCRIPT
resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'name'
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
output storageKey string = stg.listKeys().key[0].value
```

Any command-line input or output is written as follows:

```bash
brew update && brew install azure-cli
```

**Bold**: Indicates a new term, an important word, or words that you see onscreen. For example, words in menus or dialog boxes appear in the text like this.

Here is an example: "You can find the complete schema for all Azure resources in the **Schema** section on Azure documentation."

## Reviews

Please leave a review. Once you have read and used this book, why not leave a review on the site that you purchased it from?

Potential readers can then see and use your unbiased opinion to make purchase decisions, we at Packt can understand what you think about our products, and our authors can see your feedback on their book. Thank you!

For more information about Packt, please visit [packt.com](https://packt.com).
