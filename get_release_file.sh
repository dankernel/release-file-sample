#!/usr/bin/env bash
# 
# source : https://gist.github.com/maxim/6e15aa45ba010ab030c4
# 2nd update : jh.park@mindslab.ai 
#
# This script downloads an asset from latest or specific Github release of a
# private repo. Feel free to extract more of the variables into command line
# parameters.
#
# PREREQUISITES
#
# curl, wget, jq

# Verify args
if [ "$#" -ne 1 ] 
then
  echo "Usage: $0 GITHUB_TOKEN" >&2
  exit 1
fi

# Set args
TOKEN="$1"
REPO="dankernel/release-file-sample"
VERSION="v0.0.1"
GITHUB="https://api.github.com"
DES="./files/"
mkdir $DES
alias errcho='>&2 echo'

# Set files
FILES=("linux-5.15.11.tar.xz")

errcho() {
  echo "$@" >&2
}

# DO NOT EDIT
function gh_curl() {
  curl -H "Authorization: token $TOKEN" \
       -H "Accept: application/vnd.github.v3.raw" \
       $@
}

# Get files
for FILE in ${FILES[@]}; do
    echo "GET ${FILE}..."

    # Get asset_id
    parser=".assets | map(select(.name == \"$FILE\"))[0].id"
    asset_id=`gh_curl -s $GITHUB/repos/$REPO/releases/tags/$VERSION | jq "$parser"`

    if [ -z "$asset_id" ]; then
      errcho "ERROR: version not found $VERSION"
      exit 1
    fi;
    if [ "$asset_id" = "null" ]; then
      errcho "ERROR: file $FILE not found in version $VERSION"
      exit 2
    fi;

    wget --auth-no-challenge --header='Accept:application/octet-stream' \
        https://$TOKEN:@api.github.com/repos/$REPO/releases/assets/$asset_id \
        -O $DES/$FILE
done
