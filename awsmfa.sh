#!/bin/sh

AWS_ACCOUNT=$1
MFA_CODE=$2

# echo $AWS_ACCOUNT
# echo $MFA_CODE

MFA_DEVICE=`aws configure get mfa_device --profile $AWS_ACCOUNT`

# echo $MFA_DEVICE
RESPONSE=`aws sts get-session-token --serial-number $MFA_DEVICE --token-code $MFA_CODE --profile=$AWS_ACCOUNT`

# echo $RESPONSE 

ACCESS_KEY=`echo $RESPONSE | jq -r '.Credentials.AccessKeyId'`
SECRET_KEY=`echo $RESPONSE | jq -r '.Credentials.SecretAccessKey'`
SESSION_TOKEN=`echo $RESPONSE | jq -r '.Credentials.SessionToken'`

# echo $ACCESS_KEY
# echo $SECRET_KEY
# echo $SESSION_TOKEN

aws configure set aws_access_key_id $ACCESS_KEY
aws configure set aws_secret_access_key $SECRET_KEY
aws configure set aws_session_token $SESSION_TOKEN