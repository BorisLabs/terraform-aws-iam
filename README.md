## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| assume\_role\_policy | Trust Relationship for the role Drives the creation of the role and attach entities | `string` | `""` | no |
| attach\_policy\_to\_different\_role | Flag to allow attaching created policies to a different role | `bool` | `false` | no |
| attach\_policy\_to\_group | Flag to allow attaching policies to an already existing IAM Group | `bool` | `false` | no |
| boundary\_name | Name of the boundary Policy | `string` | `"Default-Boundary-Policy"` | no |
| boundary\_path | The path where the boundary is stored | `string` | `"/boundary/"` | no |
| boundary\_policy | The iam\_policy\_document works with create\_boundary | `string` | `""` | no |
| create\_boundary | Creates a Policy boundary from a data structure | `bool` | `false` | no |
| create\_group | Ability to create a group if you require | `bool` | `false` | no |
| create\_role | Flag to allow disabling role disabled | `bool` | `true` | no |
| global\_policies | IAM Policies that are not specific to a particular Role | `list(string)` | `[]` | no |
| global\_policy\_description | Description for policy | `list(string)` | `[]` | no |
| global\_policy\_names | Names of each Global Policy to create | `list(string)` | `[]` | no |
| group\_name | Name of Group to Attach a policy to | `string` | `""` | no |
| iam\_instance\_profile | IAM Instance profile or not | `bool` | `false` | no |
| iam\_path | IAM Policy Path | `string` | `""` | no |
| inline\_policies\_to\_create | Creates an inline policy to a the role | `map(string)` | `{}` | no |
| max\_session\_duration | The maximum session duration in seconds that you want for the role. | `number` | `3600` | no |
| permission\_boundary | Policy Arn to attach as a permission boundary | `string` | `""` | no |
| policies\_to\_attach | Additional Policy Arns that you can attach to your role policy | `list(string)` | `[]` | no |
| policies\_to\_create | IAM Policy to create and attach to the role supports multiple | `map(string)` | `{}` | no |
| policy\_count | Number of policies to create. ### Deprecated ### No longer required. Module reworked | `number` | `0` | no |
| role\_description | Description to associate with role | `string` | `""` | no |
| role\_name | Name of IAM Role to Create or IAM Policy name | `string` | `""` | no |
| role\_to\_attach\_policies\_to | A role name that you want to attach the policies you create to | `string` | `""` | no |
| tags | Tags that need to be assigned to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| group\_id | n/a |
| group\_name | n/a |
| iam\_instance\_profile | n/a |
| iam\_instance\_profile\_arn | n/a |
| iam\_policies\_arn | n/a |
| iam\_policies\_names | n/a |
| iam\_policy\_attachment | n/a |
| iam\_role\_arn | n/a |
| iam\_role\_name | n/a |

