#!/bin/sh
# don't run this script separately. this is part of makechromiumstable.bat. in intended for git bash
#script settings
gituser=$1
gitemail=$2
chromepath=$3
echo $gituser
echo $gitemail
echo $chromepath
curlresponse=$(curl -s http://omahaproxy.appspot.com/all?csv=1 | grep win,stable)
version=$(echo $curlresponse | awk -F"," '{print $3}') #33.0.1750.149
branch=$(echo $curlresponse | awk -F"," '{print $10}') #1750  #_149
echo  Most recent stable release is $version
echo  Current stable branch is $branch
cd $chromepath/src
pwd
git config --global user.name "$gituser"
git config --global user.email "$gitemail"
git config --global core.autocrlf false
git config --global core.filemode false
git fetch  
git config --replace-all svn-remote.svn_$branch.url http://src.chromium.org/chrome
git config --replace-all svn-remote.svn_$branch.rewriteRoot "svn://svn.chromium.org/chrome"
git config --replace-all svn-remote.svn_$branch.rewriteUUID "0039d316-1c4b-4281-b951-d872f2087c98"
git config --replace-all svn-remote.svn_$branch.fetch branches/$branch/src:refs/remotes/origin/$branch
echo "ref: refs/remotes/branch-heads/$branch" > .git/refs/remotes/origin/$branch
git svn fetch svn_$branch
# remove files in som thirdparity subfolders with rmb3.bat
git checkout -b branch_$branch origin/$branch
git config branch.branch_$branch.merge refs/heads/$branch
git config branch.branch_$branch.remote branch-heads
sha=$(git log --oneline | grep $version | awk '{print $1}')
git checkout $sha
