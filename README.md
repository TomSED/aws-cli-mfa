# aws-cli-mfa
Shell script to set MFA session token in the AWS credentials file 

## Requirement

Command line JSON processor `jq`

> sudo apt-get install jq

## Usage

Set up `~/.aws/credentials` with `mfa_device=` as in template

> ./awsmfa.sh profile1 123456
