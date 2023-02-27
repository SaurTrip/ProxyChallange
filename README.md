# Sample Hardhat Project

This project demonstrates how to upgrade an existing contract.

ContractV1.sol -> Old contract version V1
ContractV2.sol -> Upgraded contract

Proxy.sol -> Through the storage of Proxy we are accessing the state of V1 in V2

Operation Sequence -> 

1 - Open Three terminals, on second terminal launch the local blockchain by using - npx hardhat node,on third terminal deploy all three contracts by using -:
a - npx hardhat run scripts/deployProxy.js --network localhost
b - npx hardhat run scripts/deployV1.js --network localhost  
c - npx hardhat run scripts/deployV2.js --network localhost   

2 - On first terminal, launch the console by using  - npx hardhat console --network localhost

a - Access the proxy Contract using -: 
    >proxy = await(await hre.ethers.getContractFactory("Proxy")).attach("<Proxy_contract_deployment_address>"
    >await proxy.getImplementation()
    It should give the implementation addrss inialized as 0x0
    > await proxy.upgradeTo("<ContractV1_deployment_address>")
    >await proxy.getImplementation()
    It should give the implementation addrss assigned as <ContractV1_deployment_address> 
    >v1 = await(await hre.ethers.getContractFactory("ContractV1")).attach("<Proxy_contract_deployment_address>")
    >await v1.increment()
    It should increment the counter state variable the to number of times increment() method is invoked.
    >await v1.getCounter()
    It should return the value of counter.

b - Access the state variable counter in ContractV2
    > await proxy.upgradeTo("<ContractV2_deployment_address>")
    >await proxy.getImplementation()
    It should give the implementation addrss assigned as <ContractV2_deployment_address> 
    >v2 = await(await hre.ethers.getContractFactory("ContractV2")).attach("<Proxy_contract_deployment_address>")
    >await v2.decrement()
    It should decrement the counter state variable the to number of times decrement() method is invoked.
    >await v2.getCounter()
    It should return the value of counter.







Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```
