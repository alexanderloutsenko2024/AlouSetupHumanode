# AlouSetupHumanode

## This script in the runme.sh file will insert your mnemonic and set your mnemonic insertion status to TRUE in the workspaces.json file ##

---------------------------------------				
--- Manual setup of a mnemonic key ----				
---------------------------------------				
1) If you already have a mnemonic for an existing Polkadot wallet then just find your mnemonic to use it in step #9.1.
However if this is your first time you create a new node from scratch, then in Humanode Launcher -> Settings, generate a mnemonic in the Launcher and store the mnemonic in a safe place.

2) In Humanode Launcher -> Settings untick the "Run as validator" checkbox and click Apply button.

3) Start the node to make it start the blocks synchronization process.

4) Open any SSH tool (e.g. Termius app) or just a VPS console and connect to your VPS via port=22 (something like 'ssh root@45.131.182.100 -p port 22').

5) Connect to VPS and clone the GIT repository to your VPS by executing the following command:

git clone https://github.com/alexanderloutsenko2024/AlouSetupHumanode.git


6) Change the directory to the cloned one by executing the following command:

cd AlouSetupHumanode		
				

7) Run the following command to make the runme.sh file be executable:

chmod +x runme.sh


8) Execute the bash file by use of the following command:

./runme.sh


9) When the execution of the runme.sh file is started you are going to be asked to
  9.1) enter your mnemonic (12 or 24 words of your seed phrase from step #1 of this scenario);
  9.2) enter the node name you want your node to be called to get an ability to find this node by its unique name e.g. on Telemetry website.

10) Go back to Humanode Launcher -> Settings, put a checkmark in "Run as validator" chekcbox and click Apply button.

11) Restart the node - As a result "Node validator key. The validator key is set" item gets green status in Humanode Launcher -> Humanode window.

12) Wait until the node synchronizes all available blocks (it may take up to 8-9 hours as of now with the amount of HMND tokens like around 9mln).
				
13) Go the Polkadot{.js} add-on in your browser and create a new wallet by exporting your mnemonic which was generated in the step #1.

14) Transfer 1 HMND token to the linked wallet by the mnemonic Polkadot wallet.				
				
15) Navigate to https://gitbook.humanode.io/mainnet-guide/validator/becoming-a-validator path and follow the steps to pass the Bioauth.				
				
16) Go back to Humanode Launcher and make sure that all statuses are green except the Validator Status. You will become a validator only after 2 epochs are completed (around 8 hours).