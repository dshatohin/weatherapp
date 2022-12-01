# Terraform Cloud Infra

Provided manifests help to create infrastructure:

- weatherapp-frontend vm
- weatherapp-backend vm
- `shatohin.space` domain zone

```plain
$ terraform init
$ terraform apply
```

Sensitive variable could be stored in `secrets.auto.tfvars` file

Follow this link to get current weather <http://shatohin.space>
