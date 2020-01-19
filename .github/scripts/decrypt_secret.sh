#!/bin/sh

# Decrypt the file
mkdir $HOME/secrets
# --batch to prevent interactive command --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$ANDROID_DEPLOY_KEY_SECRET_PASSPHRASE" \
--output $HOME/secrets/key.jks android/app/key.jks.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$KEY_PROPERTIES_SECRET_PASSPHRASE" \
--output $HOME/secrets/key.properties android/key.properties.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$GOOGLE_PLAY_SERVICE_ACCOUNT_SECRET_PASSPHRASE" \
--output $HOME/secrets/google-play-service.json android/google-play-service.json.gpg