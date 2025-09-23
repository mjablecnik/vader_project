#!/bin/bash

KEY_PROPS_FILE="android/key.properties"

STORE_FILE=$(grep "storeFile" $KEY_PROPS_FILE | cut -d'=' -f2 | xargs)
STORE_PASSWORD=$(grep "storePassword" $KEY_PROPS_FILE | cut -d'=' -f2 | xargs)
KEY_ALIAS=$(grep "keyAlias" $KEY_PROPS_FILE | cut -d'=' -f2 | xargs)
KEY_PASSWORD=$(grep "keyPassword" $KEY_PROPS_FILE | cut -d'=' -f2 | xargs)

keytool -list -v \
  -keystore "$STORE_FILE" \
  -alias "$KEY_ALIAS" \
  -storepass "$STORE_PASSWORD" \
  -keypass "$KEY_PASSWORD" | grep "SHA256"

