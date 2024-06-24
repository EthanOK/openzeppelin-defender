import { ethers, defender } from "hardhat";

async function main() {
  const BoxV2 = await ethers.getContractFactory("BoxV2");

  const proposal = await defender.proposeUpgradeWithApproval(
    "0x87Ac52c745bA324add76aEAF7044380B28d2760F",
    BoxV2
  );

  console.log(`Upgrade proposed with URL: ${proposal.url}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

// npx hardhat run --network sepolia scripts/upgrade.ts
