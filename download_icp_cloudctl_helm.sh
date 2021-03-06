#!/bin/bash

#######################################################################################
#### THIS FILE IS AUTO_GENERTATED BY SCRIPT AND WILL BE OVERWRITTEN IN NEXT INSTALL
#### hsbawa@gmail.com hsbawa@us.ibm.com
#######################################################################################

icp_master_lxd_node="dev-master-0"
temp_dir="/tmp"
target_dir="/usr/local/bin"

if [[ ! -z $1 ]]; then
   icp_master_lxd_node=$1
fi

function copy_icp_helm(){
    echo "Pulling 'helm' from master node : $icp_master_lxd_node"
    lxc file pull $icp_master_lxd_node$target_dir/helm $temp_dir
    chmod +x $temp_dir/helm
    echo "Copying ICP helm to $target_dir as helm"
    sudo cp $temp_dir/helm $target_dir/helm
    echo "Install location: $(which helm)"
    loc=$(which helm)
    echo ""
}

function copy_icp_cloudctl(){
    echo "Pulling 'cloudctl' from master node : $icp_master_lxd_node"
    lxc file pull $icp_master_lxd_node$target_dir/cloudctl $temp_dir
    chmod +x $temp_dir/cloudctl
    echo "Copying ICP cloudctl to $target_dir"
    sudo cp $temp_dir/cloudctl $target_dir
    echo "Install location: $(which cloudctl)"
    echo ""

}

mkdir -p $temp_dir
copy_icp_helm
copy_icp_cloudctl
