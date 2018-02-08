#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build
hugo

# Add updated files
cd public
git add .

# Commit changes
msg="rebuilding site `date`"
if [ $# -eq 1 ]
then
    msg="$1"
fi
git commit -m "$msg"

# Push
git push origin master

# Return
cd ..