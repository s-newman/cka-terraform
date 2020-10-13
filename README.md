cka-terraform
=============

Terraform that creates the required resources for a Kubernetes cluster on GCP.

This Terraform project will perform a very limited amount of setup on the nodes that are created. This is on purpose. I created this project to make it easy to create and destroy resources on GCP when working on preparation for my CKA. I've left the actual creation of the Kubernetes cluster as an exercise for the reader, because these skills will be needed for the exam.

That said, here's how you can use this.

First, make sure to have the `gcloud` command line installed and have already created a project in GCP with billing enabled.

Then, just make sure you're logged in to the right GCP account.

```shell
gcloud auth application-default login
```

Next, check out the variable defaults in the `variables.tf` file to make sure they're appropriate for your environment. If you're not on the east coast of North America, you'll probably want to change the region and zone. You can provide values for the variables in a few ways - see [the Terraform documentation](https://www.terraform.io/docs/configuration/variables.html#assigning-values-to-root-module-variables) for more information.

Note that if you don't provide a value for the `project` variable, you'll be prompted for you project ID whenever you run a `terraform` command.

Initialize your Terraform project

```shell script
terraform init
```

You should now be ready to deploy!

```shell script
terraform apply
```

Give it a few minutes before you log in to the instances. On first boot, they will perform a full system upgrade and reboot, which can take a little while sometimes.

As is normal for Terraform projects, once you're all done you can destroy the resources.

```shell script
terraform destroy
```