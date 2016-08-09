#!/bin/bash

# Require one command line argument.
if [ -z $1 ] ; then
    echo "Must specify dir!"
    exit 1
fi

# It should be a directory, absolute or relative.
if ! [ -d $1 ] ; then
    echo "That's not a dir!"
    exit 2
fi

# Create the Jekyll header to the directory listing.
cat > $1/index.md <<EOF
---
layout: default
title: Projects in progress in $1
---

EOF

# Loop through all markdown files and create a link.  Everything else is
# ignored.
for i in `ls $1/*.md` ; do
    title=$(grep "title: " $i|sed -e 's/title: \(.*\)/[\1]/')
    link=$(echo $i | sed -e 's/\(.*\)\.md/(\/\1.html)/')
    echo "* $title$link" >> $1/index.md
done
