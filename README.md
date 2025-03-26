# ArtifactDigitization Smart Contract - README

## Overview

The **ArtifactDigitization** module is a Move smart contract designed for the digitization of historical artifacts through NFTs on the Aptos blockchain. It allows users to create and transfer digital representations of artifacts, facilitating their ownership and exchange. 

This smart contract contains two main functions:

1. **create_artifact**: Allows users to create a new digital artifact (NFT).
2. **transfer_artifact**: Allows the owner of an artifact (NFT) to transfer ownership to another address.

## Contract Functions

### 1. `create_artifact`
This function allows a user to create a new artifact (NFT). It stores the artifact's metadata, including its name, description, and the owner’s address.

#### Parameters:
- **`owner`**: The signer (address) creating the artifact.
- **`name`**: The name of the artifact (as a byte vector).
- **`description`**: A brief description of the artifact (as a byte vector).

#### Usage:
To create a new artifact, a user must call this function with the `owner` address, a `name`, and a `description` for the artifact. The artifact will be stored in the blockchain and owned by the signer (user creating the artifact).

#### Example:
```move
MyModule::ArtifactDigitization::create_artifact(
    &signer,
    b"Ancient Vase",
    b"A rare historical vase from the 12th century."
);
```

### 2. `transfer_artifact`
This function allows the current owner of a digital artifact (NFT) to transfer ownership to another address.

#### Parameters:
- **`owner`**: The current owner of the artifact.
- **`new_owner`**: The address of the new owner to whom the artifact will be transferred.

#### Usage:
Only the current owner of an artifact can transfer it. This function checks that the caller is the actual owner and then updates the artifact's ownership to the `new_owner` address.

#### Example:
```move
MyModule::ArtifactDigitization::transfer_artifact(
    &signer,
    0x1234567890abcdef1234567890abcdef12345678  // New owner's address
);
```

## Structure of the `Artifact` NFT

The **Artifact** struct represents a digital artifact as an NFT and has the following fields:
- **`name`**: A byte vector representing the name of the artifact.
- **`description`**: A byte vector representing the description of the artifact.
- **`owner`**: The address of the current owner of the artifact.

### Example of an Artifact:
- **Name**: "Ancient Vase"
- **Description**: "A rare historical vase from the 12th century."
- **Owner**: The address of the signer (e.g., 0xabc123...).

## Usage Flow

1. **Creating an Artifact**: 
   - A user invokes the `create_artifact` function with the name, description, and their address.
   - The contract creates a new artifact and assigns ownership to the user.

2. **Transferring an Artifact**: 
   - The owner of an artifact invokes the `transfer_artifact` function to transfer ownership to a new address.
   - The contract ensures only the current owner can transfer the artifact.

## Contract Address

This contract is deployed at the address `0x1cab4b4dba0a0660f3d0a1a302c110fc3920a711936551591cd4c35180996f13`.

## Conclusion

This **ArtifactDigitization** module provides a simple and efficient way to digitize historical artifacts and track ownership using NFTs. It supports the creation and transfer of these digital assets, enabling a new approach to preserving and exchanging historical items on the Aptos blockchain.

## Contract Address
0x024499488d8b9873a3932a4a703d169752e91adf24e758f54f3e924fd3213e85
![image](https://github.com/user-attachments/assets/6a4fd41e-88c2-409a-a052-77e8c1c17c58)
