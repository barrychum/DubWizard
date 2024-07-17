#!/bin/bash

project="$1"

if [ -d "${project}" ]; then
    echo "Project already exists"
    exit 1
fi

mkdir -p "${project}"
mkdir -p "${project}/tmp"
mkdir -p "${project}/input"
mkdir -p "${project}/output"

echo "${project} folder created"
echo "Please put input files in ${project}/input"
