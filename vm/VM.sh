#!/bin/bash

if [ -z "$(which az)" ]; then
    echo "azure-cli is not installed"
fi


createVM()
{
    adminUsername=VmAdminName
    VMname=$1
    groupName=$2
    typeOfImage=$3
    size=$4

    VMcheck=$(az vm list --query [].name | grep -E $VMname)

    if [ -n "$VMcheck" ]; then 
        echo "this vm name already exist please choose another"
    fi

    az vm create 
    -n $VMname \
    -g $groupName \
    --image $typeOfImage \
    --size $size \
    --generate-ssh-keys \
    -u $adminUsername
}


DeleteVM()
{
    VMname=$1
    groupName=$2

    VMcheck=$(az vm list --query [].name | grep -E $VMname)

    if [ -z "$VMcheck" ]; then 
        echo "this vm does not exist please choose one that does if you want to delete it"
    fi

    az vm delete \
    -g $groupName \
    -n $VMname \
    --yes
}

resizeVM()
{

}








command=$1
$command $2 $3 $4 $5

