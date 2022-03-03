#/bin/sh

rm -rf /tmp/msp
rm -rf /tmp/channel
rm -rf /tmp/chaincode

export ADDITIONAL_CA_CERTS_LOCATION=/home/cloud-user/cachain/
export TEST_NETWORK_ADDITIONAL_CA_TRUST=${ADDITIONAL_CA_CERTS_LOCATION}
cd ~/git/ChaordicLedger/

clear &&
./network purge &&
./network init &&
clear &&
./network msp 3 3 2 &&
./network channel 2 &&
./network peer &&
./network chaincode &&
./network invoke '{"Args":["CreateAsset","3","blue","35","tom","1000"]}'
./network query '{"Args":["ReadAsset","3"]}'
