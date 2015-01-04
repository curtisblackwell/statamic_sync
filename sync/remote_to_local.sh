#!/bin/bash

# Colors
important=$(tput setaf 1)
reset=$(tput sgr0)

# Make sure the dev is in the correct directory, then load variables.
if [ -f scripts/sync/_vars.sh ]
  then
    source scripts/sync/_vars.sh
  else
    echo $important"scripts/sync/_vars.sh does not exist relative to the current location."$reset
    exit
fi

SRC_CONTENT="$PATH_REMOTE_CONTENT/"
SRC_IMAGES="$PATH_REMOTE_IMAGES/"
SRC_USERS="$PATH_REMOTE_USERS/"
DEST_CONTENT="$PATH_LOCAL_CONTENT"
DEST_IMAGES="$PATH_LOCAL_IMAGES"
DEST_USERS="$PATH_LOCAL_USERS"

# Set flags.
# Use archive mode, which is -rlptgoD (no -H).
# ---
FLAGS="-a"

if [ "$DRY_RUN" = true ]
  then
    FLAGS+="n"
fi

if [ "$VERBOSE" = true ]
  then
    FLAGS+="vv"
fi

if [ "$SKIP_NEWER_FILES" = true ]
  then
    FLAGS+="u"
fi

if [ "$RECURSIVE" = false ]
  then
    FLAGS+=" --no-r"
fi


# Test to make sure user can ssh into server.


# Sync files.
rsync $FLAGS $USER@$HOSTNAME:$SRC_CONTENT $DEST_CONTENT
rsync $FLAGS $USER@$HOSTNAME:$SRC_IMAGES $DEST_IMAGES
rsync $FLAGS $USER@$HOSTNAME:$SRC_USERS $DEST_USERS
