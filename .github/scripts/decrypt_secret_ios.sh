#!/bin/sh

# Decrypt the file
mkdir $HOME/secrets
# --batch to prevent interactive command --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_GOOGLE_PLIST_ENCRYPTION_SECRET" \
--output $HOME/secrets/GoogleService-Info.plist ios/Runner/GoogleService-Info.plist.gpg