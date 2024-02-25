 The given -var option "losags-kodai-bake-901" is not correctly specified. Must be a variable name and value separated by an equals sign, like
 -var="key=value".

### Correct expression
terraform.exe plan -var="bucketname=losags-kodai-bake-901"

terraform.exe apply -auto-approve -var="bucketname=losags-kodai-bake-901"

terraform.exe destroy -auto-approve -var="bucketname=losags-kodai-bake-901"