# Infrastructure as Code with Azure Bicep

<a href="https://www.packtpub.com/product/infrastructure-as-code-with-azure-bicep/9781801813747?utm_source=github&utm_medium=repository&utm_campaign=9781801813747"><img src="https://static.packt-cdn.com/products/9781801813747/cover/smaller" alt="Infrastructure as Code with Azure Bicep" height="256px" align="right"></a>

This is the code repository for [Infrastructure as Code with Azure Bicep](https://www.packtpub.com/product/infrastructure-as-code-with-azure-bicep/9781801813747?utm_source=github&utm_medium=repository&utm_campaign=9781801813747), published by Packt.

**Streamline Azure resource deployment by bypassing ARM complexities**

## What is this book about?
It's no secret that developers don't like using JSON files to declare their resources in Azure because of issues such as parameter duplication and not being able to use comments in templates. Azure Bicep helps resolve these issues and this book will guide you as a developer or DevOps engineer to get the most out of the Bicep language. 

This book covers the following exciting features:
* Get started with Azure Bicep and install the necessary tools
* Understand the details of how to define resources with Bicep
* Use modules to create templates for different teams in your company
* Optimize templates using expressions, conditions, and loops
* Make customizable templates using parameters, variables, and functions
* Deploy templates locally or from Azure DevOps or GitHub
* Stay on top of your IaC with best practices and industry standards

If you feel this book is for you, get your [copy](https://www.amazon.com/dp/1801813744) today!

<a href="https://www.packtpub.com/?utm_source=github&utm_medium=banner&utm_campaign=GitHubBanner"><img src="https://raw.githubusercontent.com/PacktPublishing/GitHub/master/GitHub.png" 
alt="https://www.packtpub.com/" border="5" /></a>

## Instructions and Navigations
All of the code is organized into folders. For example, Chapter02.

The code will look like the following:
```
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

**Following is what you need for this book:**
This book is for cloud engineers, developers, and DevOps engineers who are responsible for writing templates to deploy resources in Microsoft Azure and contributing to CI/CD pipelines. Professionals who want to get started with DevOps and Infrastructure as Code when it comes to working with Microsoft Azure will also benefit from reading this book. Readers are expected to have a basic understanding of CI/CD concepts, must have worked with ARM templates to deploy resources to Azure, and must have used or be familiar with Azure DevOps or GitHub Actions for their CI/CD pipelines.

With the following software and hardware list you can run all code files present in the book (Chapter 1-12).
### Software and Hardware List
| Chapter | Software required | OS required |
| -------- | ------------------------------------ | ----------------------------------- |
| 1-12 | Azure CLI | Windows, Mac OS X, and Linux (Any) |
| 1-12 | Azure PowerShell | Windows, Mac OS X, and Linux (Any) |
| 1-12 | Visual Studio Code | Windows, Mac OS X, and Linux (Any) |
| 1-12 | Git | Windows, Mac OS X, and Linux (Any) |


We also provide a PDF file that has color images of the screenshots/diagrams used in this book. [Click here to download it](https://static.packt-cdn.com/downloads/9781801813747_ColorImages.pdf).

### Related products
* Azure for Architects - Third Edition [[Packt]](https://www.packtpub.com/product/azure-for-architects-third-edition/9781839215865?utm_source=github&utm_medium=repository&utm_campaign=9781839215865) [[Amazon]](https://www.amazon.com/dp/1839215860)

* Azure DevOps Explained [[Packt]](https://www.packtpub.com/product/azure-devops-explained/9781800563513?utm_source=github&utm_medium=repository&utm_campaign=9781800563513) [[Amazon]](https://www.amazon.com/dp/1800563515)

## Get to Know the Author
**Yaser Adel Mehraban**
is a self-taught and motivated software engineer and solution architect who lives in the most livable city in the world, Melbourne, Australia. He is currently working as an Azure technical trainer for Microsoft. Some might know him as the almond croissant addict cleverly disguised as a successful web developer.
He has over a decade of experience working in a variety of different teams and has helped them adapt DevOps and IaC to be able to increase team productivity when it comes to cloud resource deployment. Furthermore, he has a true passion for sharing knowledge, which has motivated him to give many international conference talks, write hundreds of technical blog posts, and publish courses on platforms such as Pluralsight.
When he is not working, he mostly spends his time with his family or on his woodworking projects, which vary depending on how much space is left in the house.



