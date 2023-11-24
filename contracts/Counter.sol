// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import { UltraVerifier } from "../contract/noir_template/plonk_vk.sol";

contract Counter is UltraVerifier {
    uint256 public number;

    function increment(bytes calldata proof) public {
        // Public inputs can also be injected by the smart contract.
        // This ensures that the proof is relevant to its current state.
        bytes32[] memory publicInputs = new bytes32[](1);
        publicInputs[0] = bytes32(number);

        bool validProof = this.verify(proof, publicInputs);
        // UltraVerifier reverts on invalid proofs but we place a check here anyway.
        if (!validProof) {
          revert PROOF_FAILURE();
        }

        number += 1;
    }
}
