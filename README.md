# terraform-vSphere

This repository is used to create VM's in vSphere from template

create ```terraform.tvars``` using [terraform.tvars_example](https://github.com/vavuthu/terraform/vsphere/terraform.tvars_example) 

Initialize terraform
```bash
  terraform init <path>/terraform/vsphere
  ```

Create VM from template using terraform apply
```bash
    terraform apply '-var-file=terraform.tvars' -auto-approve <path>/terraform/vsphere
```

Delete the VM using terraform destroy
```bash
    terraform destroy '-var-file=terraform.tvars' -auto-approve <path>/terraform/vsphere
```
