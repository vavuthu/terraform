# terraform-vSphere

This repository is used to create VM's in vSphere from template

create ```terraform.tfvars``` using [terraform.tfvars_example](https://github.com/vavuthu/terraform/blob/main/vsphere/terraform.tfvars_example) 

Initialize terraform
```bash
  terraform init <path>/terraform/vsphere
  ```

Create VM from template using terraform apply
```bash
    terraform apply '-var-file=terraform.tfvars' -auto-approve <path>/terraform/vsphere
```

Delete the VM using terraform destroy
```bash
    terraform destroy '-var-file=terraform.tfvars' -auto-approve <path>/terraform/vsphere
```
