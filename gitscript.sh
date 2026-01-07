#!/bin/bash


API_URL="https://api.github.com"
REPO_OWNER=$1
REPO_NAME=$2

function fetchUserList()
{
local userName="rohithdubba"
local token="${TOKEN}"
local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"
url="${API_URL}/${endpoint}"


echo "the url value is ${url}"

collaborators=$(curl -s -u ${userName}:${token} "${url}" | jq -r '.[] | select (.permissions.pull ==true) | .login')


if [[ -z collaborators ]]; then
        echo " no users"

else
        echo " Users with read access are $collaborators"

fi


}

fetchUserList
