# release-file-sample

This repository is a tutorial for downloading files using releases on github.

The releases feature of github allows you to efficiently use large and variable files such as media files and deep learning weights files.

# Dependency

```
sudo apt install curl wget jq
```
You need to install the dependency utility used by the shell script.

# Upload binary files to releases

GitHub Repo -> Draft a new release 

set tag(v0.0.1), upload binaries file -> publish release

# Parameter setting

```
REPO="dankernel/release-file-sample"
VERSION="v0.0.1"
DES="./files/"
```

- `REPO` : GitHub Repo url (user/repo)
- `VERSION` : release version
- `DES` : destination path

# Setting up github secrets

GitHub Repo -> settings -> secrets -> New repository secret 

Name : `TOKEN`
Value : `ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

# How to use

```
./get_release_file.sh ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

# Test

```
./test.sh
```
And, See here how to use the workflow. `.github/workflows/test.yml`

