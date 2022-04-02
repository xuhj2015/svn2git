#!/bin/bash

git_flag="[git]"
svn_flag="[svn]"
current_status=$git_flag
current_git_path=''

workdir=$(cd $(dirname $0); pwd)


function get_project_name(){
	local svn_path=$1
	local project_name=''
	local array=(${svn_path//\// })  
	for var in ${array[@]}
	do
	   project_name=$var
	done
	echo $project_name
}

function get_git_path(){
	local git_dir=$1
	local project_name=$2
	local git_path=''
	if [[ "$git_dir" == */ ]]; then
		git_path=$git_dir$project_name".git"
	else
		git_path=$git_dir"/"$project_name".git"
	fi
	echo $git_path
}

function git_svn_clone(){
	local git_path=$1
	local svn_path=$2

	
	local project_name=`get_project_name $svn_path`

	local git_path=`get_git_path $git_path $project_name`

	echo "$project_name start..."

	if [ -d "$workdir/workspace/$project_name" ]; then
		echo "$project_name exists..."
		return
	fi

	cd "$workdir/workspace/"
	git svn clone $svn_path --authors-file=$workdir"/userinfo.txt"
	echo "$project_name ..."
	cd "$workdir/workspace/$project_name"
	git remote add origin $git_path
	echo "$project_name ..."
	git push origin master --tags
	cd "$workdir/"

	echo "$project_name success..."
}


if [ ! -d "$workdir/workspace" ]; then
	mkdir "$workdir/workspace"
fi

for line in $(cat projects.txt)
do
	if [ "$line" == "$git_flag" -o "$line" == "$svn_flag" ]; then
		current_status=$line
	elif [ "$current_status" == "$git_flag" ]; then
		current_git_path=$line
	elif [ "$current_status" == "$svn_flag" ]; then
		git_svn_clone $current_git_path $line
	fi
done

