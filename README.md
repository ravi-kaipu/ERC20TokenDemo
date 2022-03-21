# ERC20TokenDemo

## ERC20
ERC20 introduces a standard for Fungible Tokens. An ERC20 Token acts just like the ETH, so you can convert it into other crypto currencies. [ ERC20 Standards](https://eips.ethereum.org/EIPS/eip-20).



ERC20 provides following.

#### Methods
```
 function name() public view returns (string)
 
 function symbol() public view returns (string)
 
 function decimals() public view returns (uint8)
 
 function totalSupply() public view returns (uint256)
 
 function balanceOf(address _owner) public view returns (uint256 balance)
 
 function transfer(address _to, uint256 _value) public returns (bool success)
 
 function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
 
 function approve(address _spender, uint256 _value) public returns (bool success)
 
 function allowance(address _owner, address _spender) public view returns (uint256 remaining)
```

#### Events
```
event Transfer(address indexed _from, address indexed _to, uint256 _value)

event Approval(address indexed _owner, address indexed _spender, uint256 _value)

```
![This is an image](/images/Demo.jpg)



## Implementation

There are two ways to implement the ERC20 token standards.
1. One way is to implement the code on your own.
2. Implement the code using @openzeppelin framework


## Setting up the environment
```
npm install -g truffle --save

npm install ganache-cli --save

truffle init
```

After `truffle init`, following files and directories will be created.
```
- contracts
- migrations
- test
- truffle-config.js
```
`truffle-config.js` is a configuration file, where test networks can be configured.

#### For local network
Below settings are enabled for local development in `truffle-config.js`
```
development: {
      host: "127.0.0.1",     // Localhost (default: none)
      port: 8545,            // Standard Ethereum port (default: none)
      network_id: "*",       // Any network (default: none)
    }
```

#### For Ropsten network
Below settings are enabled for ropsten network.
```
ropsten: {
     provider: () => new HDWalletProvider(
	     MNEMONIC, 
	     ROPSTEN_RPC_URL
     ),
     network_id: 3,       // Ropsten's id
     gas: 8000000,        // Ropsten has a lower block limit than mainnet
     confirmations: 2,    // # of confs to wait between deployments. (default: 0)
     timeoutBlocks: 200,  // # of blocks before a deployment times out  (minimum/default: 50)
     from: '<address for contract deployment>',
     skipDryRun: true     // Skip dry run before migrations? (default: false for public nets )
     },
 ```
 
### Using OpenZippelin package
ERC20 token can be created using OpenZippelin package
```
	npm init -y
	npm install @openzeppelin/contracts --save
```

## Deploying the contract
1. Start local blockchain using ganache
```
  ganache-cli
```
2. Deploy the contract on to the specific network. 
  ###### on to local network
  ```
    truffle deploy --network development
  ```
  ###### on to ropsten network
  ```
    truffle deploy --network ropsten
  ```
  
  ## Testing the contract
  We can write our own test cases to verify the contract functionalities
  command to run the test suite.
  ```
    truffle test --network <development/ropsten>
   ```
