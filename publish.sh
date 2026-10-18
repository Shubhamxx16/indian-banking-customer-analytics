#!/usr/bin/env bash
# 1. On github.com create a NEW EMPTY public repo named: indian-banking-customer-analytics
#    (do not tick "Add a README")
# 2. From inside this folder run:  bash publish.sh <your-github-username>
set -e
USER_NAME="${1:?Usage: bash publish.sh <github-username>}"
git init -b main
git add .
git commit -m "Add Indian banking customer analytics project"
git remote add origin "https://github.com/$USER_NAME/indian-banking-customer-analytics.git"
git push -u origin main
