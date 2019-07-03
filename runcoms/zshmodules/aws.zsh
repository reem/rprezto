aws-get-p2 () {
    export instanceId=`aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped,Name=instance-type,Values=p2.xlarge" --query "Reservations[0].Instances[0].InstanceId" --output text` && \
       echo $instanceId
}

aws-get-t2 () {
    export instanceId=`aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped,Name=instance-type,Values=t2.xlarge" --query "Reservations[0].Instances[0].InstanceId" --output text` && \
        echo $instanceId
}

aws-start () {
    aws ec2 start-instances --instance-ids $instanceId && \
        aws ec2 wait instance-running --instance-ids $instanceId && \
        export instanceIp=`aws ec2 describe-instances --filters "Name=instance-id,Values=$instanceId" --query "Reservations[0].Instances[0].PublicIpAddress" --output text` && \
        echo $instanceIp
}

aws-ip () {
    export instanceIp=`aws ec2 describe-instances --filters "Name=instance-id,Values=$instanceId" --query "Reservations[0].Instances[0].PublicIpAddress" --output text` && \
        echo $instanceIp
}

aws-ssh () {
    ssh -i ~/.ssh/aws-key-fast-ai.pem ubuntu@$instanceIp
}

aws-stop () {
    aws ec2 stop-instances --instance-ids $instanceId
}

aws-state () {
    aws ec2 describe-instances --instance-ids $instanceId --query "Reservations[0].Instances[0].State.Name" --output text
}

# This is Mac.  Use open to open the notebook
aws-nb () {
    open http://$instanceIp:8888
}
