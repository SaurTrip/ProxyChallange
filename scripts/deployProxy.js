
const hre = require("hardhat");

async function main() {

  const Proxy = await hre.ethers.getContractFactory("Proxy");
  const proxy = await Proxy.deploy();

  await proxy.deployed();

  console.log(
    `Contract Proxy deployed at ${proxy.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
