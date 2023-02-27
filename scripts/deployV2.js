
const hre = require("hardhat");

async function main() {

  const V2 = await hre.ethers.getContractFactory("ContractV2");
  const v2 = await V2.deploy();

  await v2.deployed();

  console.log(
    `Contract ContractV2 deployed at ${v2.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
