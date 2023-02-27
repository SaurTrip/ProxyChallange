
const hre = require("hardhat");

async function main() {

  const V1 = await hre.ethers.getContractFactory("ContractV1");
  const v1 = await V1.deploy();

  await v1.deployed();

  console.log(
    `Contract ContractV1 deployed at ${v1.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
