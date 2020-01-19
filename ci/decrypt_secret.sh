#!/bin/sh

# Decrypt the file
mkdir $HOME/secrets
# --batch to prevent interactive command --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$ANDROID_DEPLOY_KEY_SECRET_PASSPHRASE" \
--output $HOME/secrets/key.jks android/app/key.jks.gpg