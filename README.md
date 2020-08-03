# terraform-aws-iam

- ``` terraform-aws-iam ``` is a Terraform module to create AWS Iam ROle
- it's an opensource module under GPL license

## Usage

```
module "iam-wsc" {
  principals = {
    Service = "eks.amazonaws.com"
  }

  name_iam_policy = "test_policy"
  name_iam_role   = "test_role"

  defined_policies = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  ]


}


```

## Input Variables:

| name                      | description                                                                                       | type         | required |
|---------------------------|---------------------------------------------------------------------------------------------------|--------------|----------|
| name_iam_role             | Name of Iam role                                                                                  | string       | yes      |
| name_iam_policy           | Name of Iam policy                                                                                | string       | no       |
| name_prefix               | Prefix Name for IaM Role                                                                          | string       | no       |
| force_detach_policies     | Specifies to force detaching any policies the role has before destroying it. Defaults to false.   | bool         | no       |
| max_session_duration      | the maximum session duration that you want to set for the specified role,by default is one hour   | number       | no       |
| policy_description        | policy description                                                                                | string       | no       |
| principals                | Map of service name as key and a list of ARNs to allow assuming the role as value                 | map          | yes      |
| policies                  | Json Policies to generate doc                                                                     | list(string) | no       |
| defined_policies          | predifined arn policies to attatch                                                                | list(string) | no       |
| tags                      | tags for IAM role                                                                                 | map          | no       |


## Output Variables:

| name                       | description                        |
|----------------------------|------------------------------------|
| iam_id                     | IAM ROLE id                        |
| iam_arn                    | IAM ROLE arn                       |
| iam_defined_attachements   | Data about defined attachements    |
| iam_customize_attachements | Data about customize attachements  |


## License:
```
                    GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

                            Preamble

  The GNU General Public License is a free, copyleft license for
software and other kinds of works.

  The licenses for most software and other practical works are designed
to take away your freedom to share and change the works.  By contrast,
the GNU General Public License is intended to guarantee your freedom to
share and change all versions of a program--to make sure it remains free
software for all its users.  We, the Free Software Foundation, use the
GNU General Public License for most of our software; it applies also to
any other work released this way by its authors.  You can apply it to
your programs, too.
```
