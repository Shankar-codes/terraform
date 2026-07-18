# terraform

A collection of small, self-contained Terraform configurations demonstrating core HCL language features and AWS provisioning patterns — each folder is an independent, runnable example rather than a single unified project. Every folder has its own `provider.tf`, so each one is its own root module and can be `init`/`plan`/`applied` on its own.

## Repository structure

| Folder | Concept demonstrated | What it provisions |
|---|---|---|
| [`ec2/`](./ec2) | Basic resource creation | A single EC2 instance + a security group allowing all inbound/outbound traffic. |
| [`variables/`](./variables) | Input variables | Same EC2 + security group setup as `ec2/`, but all hardcoded values are extracted into `variables.tf` (AMI, instance type, tags, SG rules). |
| [`conditions/`](./conditions) | Conditional expressions | An EC2 instance whose `instance_type` is chosen with a ternary (`var.instance_type == "prod" ? ... : "t3.micro"`) based on an `environment` variable. |
| [`count/`](./count) | The `count` meta-argument | Creates multiple EC2 instances (`mongodb`, `redis`, `mysql`) from a list using `count`, plus matching Route 53 `A` records for each. |
| [`for-loop/`](./for-loop) | The `for_each` meta-argument | Same multi-instance idea as `count/`, but implemented with `for_each` over a set of instance names, with matching Route 53 records keyed by `each.key`. |
| [`dynamic/`](./dynamic) | `dynamic` blocks | A security group whose `ingress` rules are generated dynamically from a list of ports (`80, 443, 22, 8080, 3306, 27017, 6379, 5672`) instead of being repeated manually. |
| [`data-source/`](./data-source) | Data sources | Looks up an existing custom AMI (`Redhat-9-DevOps-Practice`) via `data "aws_ami"`, and fetches the public IP of an existing, hardcoded instance via `data "aws_instance"`. |
| [`locals/`](./locals) | Local values | Combines a data-sourced AMI lookup with `local` values (computed tags, naming convention `${project}-${environment}`) to build the EC2 configuration. |
| [`provisioners/`](./provisioners) | `local-exec` / `remote-exec` provisioners | Runs a local command to write the instance's private IP to an `inventory` file, then SSHes into the instance to install and start/stop `nginx` on create/destroy. |
| [`remote-state/`](./remote-state) | Remote state backend | Configures an S3 backend (`bucket = "ellamma-roboshop"`) with state locking (`use_lockfile = true`) and encryption for storing Terraform state remotely. |

## Requirements

| Name | Version |
|---|---|
| Terraform | Not pinned via `required_version` in any folder |
| AWS Provider | `~> 6.0` in most folders; `dynamic/`, `locals/`, and `remote-state/` pin the exact version `6.16.0` |

Each folder configures its own `provider "aws"` block. Some pin a `region` (typically `us-east-1`); others (e.g. `conditions/`, `count/`) leave the region unset, relying on your AWS CLI/environment configuration.

## Usage

Each example is standalone. To try one out:

```bash
cd <folder-name>          # e.g. cd for-loop
terraform init
terraform plan
terraform apply
```

Don't forget to `terraform destroy` afterwards to avoid leaving AWS resources running.

## Things to know before running these

- **Hardcoded values specific to the author's environment**: several folders reference a specific Route 53 hosted zone (`Z00405822WO8HCQACP58A`) and domain (`ellamma.fun`) for DNS records, a specific custom AMI name (`Redhat-9-DevOps-Practice`) owned by a specific AWS account ID, and a specific pre-existing instance ID in `data-source/`. These will need to be swapped for your own values.
- **`provisioners/ec2.tf` contains a hardcoded SSH password** (`DevOps321`) in the `connection` block. If you reuse this example, replace it with a key pair or a securely-sourced credential rather than a literal password in source.
- **`remote-state/provider.tf`** points at a specific S3 bucket (`ellamma-roboshop`) that you won't have access to — create your own bucket (with versioning/locking enabled) and update the backend config before use.
- **No `README.md` existed in the source repo** prior to this file, and none of the folders include their own local README.
- **No license file** is included in the repository.

## Suggested learning path

If you're working through this repo top-to-bottom as a Terraform tutorial, a sensible order is:

1. `ec2/` — plain resources, no variables
2. `variables/` — same setup, parameterized
3. `conditions/` — conditional expressions
4. `count/` then `for-loop/` — two ways to create multiple similar resources
5. `dynamic/` — generating repeated nested blocks
6. `data-source/` then `locals/` — reading existing infrastructure and computing values
7. `provisioners/` — running commands on instance lifecycle events
8. `remote-state/` — storing state remotely instead of locally
