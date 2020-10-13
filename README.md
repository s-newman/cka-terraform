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

Next, check out the `provider` block at the top of `main.tf` and make sure the settings are correct for your setup. You'll have to change the project at a minimum, and unless you're on the east coast of North America, you'll probably want to change the region and zone as well.

You should now be ready to deploy!

```shell
terraform apply
```

As is normal for Terraform projects, once you're all done you can destroy the resources.

```shell
terraform destroy
```