The guidelines are listed below:
1) We like to keep the main contract with 7 pool accounts and we like to maintain 7 distribution contract with reference to each pool account in the main contract. 
2) We transfer the tokens from the main contract to the distribution contract manually in a bulk nature. 
3) I am okay for the distribution contract to be run by a bot and tranfer the tokens to the users
4) The owner of the contract will be distributing the tokens from the main contract pools to the respective distribution contracts manually. 
The process-flow of the smart contract is listed below:
1) Start by deploying the token (Token.sol). The tokens will be minted to the 7 accounts/wallet endpoints which you will have to define in the contract.
2) Deploy the 7 smart contracts. Each of the 7 smart contracts takes a constructor argument which is the contract address of the deployed token (Token.sol). You will have to insert the referenced account/wallet endpoint associated with the distribution contract in each one of them.
3) Send tokens from the account/wallet endpoints which you have defined in the main contract, to the associated distribution bucket contract.
4) Check the balance of the contract address, if everything was done correctly you should now be able to use a bot with access to the account pool to distribute tokens.
