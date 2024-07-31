# !/bin/bash

# PRECONDITIONS: 
# - 1 - clone the GIT repository to your VPS by executing the following command:
### git clone https://github.com/alexanderloutsenko2024/AlouSetupHumanode.git
# - 2 - change the directory to the cloned one by executing the following command:
### cd AlouSetupHumanode
# - 3 - run the following command to make the runme.sh file be executable:
### chmod +x runme.sh
# - 4 - execute the bash file by use of the following command:
### ./runme.sh

echo "--== This script will insert your mnemonic and set your mnemonic insertion status to TRUE ==--" 
echo ' '

echo '# 1) populate some variables to be used by the script'
echo '## 1.1) enter your mnemonic here:' 

read mnemonic
echo ' '



echo '## 1.2) enter your node name here:'

read nodename

json_node_name='{"nodename":"'$nodename'",'
json_next_key='"mnemonicInserted":true,'
echo ' '



echo '# 2) bash is expected to change the directory to .humanode/workspaces/default folder'

cd $HOME/.humanode/workspaces/default
echo ' '



echo '# 3) bash is expected to insert mnemonic by executing the following command'

./humanode-peer key insert  --key-type kbai --scheme sr25519 --suri "$mnemonic" --base-path substrate-data --chain chainspec.json
echo ' '



echo '# 4) bash is expected to verify whether a kbai key is inserted and encoded with suri'

echo "--== the kbai key just inserted looks like the following:"
ls_output=$(ls $HOME/.humanode/workspaces/default/substrate-data/chains/humanode_mainnet/keystore)
printf %s "$ls_output"
echo " " 



echo '# 5) bash is expected to delete existing workspace.json file'

rm workspace.json
echo ' '



echo '# 6) bash is expected to create a new JSON file instead'

echo ${json_node_name}${json_next_key}'"rpcUrlMode":{"type":"ngrok-auto-detect"},"isValidator":false,"tunnelType":"humanode","manualTunnelRuntime":false,"bioauthEnroll":false,"chainspecPath":"chainspec.json","executablePath":"humanode-peer","humanodeWebsocketTunnelClientPath":"humanode-websocket-tunnel","manifestUrl":"https://chainspec.mainnet.stages.humanode.io/latest/manifest.json","ngrokPath":"ngrok-wrapper","executableInfo":{"platform":"Linux","arch":"x86_64","displayName":"Humanode Mainnet"},"substrateAddress":""}' > workspace.json
echo ' '



echo '# POSTCONDITIONS:'
echo '# - 1 - bash is expected to install jq app and verify JSON file for its validity'

snap install jq
cat workspace.json | jq
echo ' '
echo "-- == End of Script == --"