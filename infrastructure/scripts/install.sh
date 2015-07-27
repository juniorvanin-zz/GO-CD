#!/bin/sh

echo "=====> Stopping registrolivre service"
ssh -i ~/.vagrant.d/insecure_private_key vagrant@192.168.33.10 "service registrolivre stop"

echo "=====> Removing registrolivre jar"
ssh -i ~/.vagrant.d/insecure_private_key vagrant@192.168.33.10 "rm -rf app/registrolivre.jar"

echo "=====> Generate jar"
./gradlew stage

echo "=====> Copy jar to app folder"
scp -i ~/.vagrant.d/insecure_private_key registrolivre.jar vagrant@192.168.33.10:app/

echo "=====> Starting registrolivre service"
ssh -i ~/.vagrant.d/insecure_private_key vagrant@192.168.33.10 "service registrolivre start"
