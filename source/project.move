module 0x1cab4b4dba0a0660f3d0a1a302c110fc3920a711936551591cd4c35180996f13::ArtifactDigitization {
    use aptos_framework::signer;

    // Struct representing a digital artifact (NFT).
    struct Artifact has store, key {
        name: vector<u8>,       // Name of the artifact
        description: vector<u8>,// Description of the artifact
        owner: address,        // Owner of the artifact (NFT holder)
    }

    // Function to create a new artifact (NFT).
    public fun create_artifact(owner: &signer, name: vector<u8>, description: vector<u8>) {
        let artifact = Artifact {
            name,
            description,
            owner: signer::address_of(owner),
        };
        move_to(owner, artifact);
    }

    // Function to transfer an artifact (NFT) to another address.
    public fun transfer_artifact(owner: &signer, new_owner: address) acquires Artifact {
        let artifact = borrow_global_mut<Artifact>(signer::address_of(owner));
        
        // Ensure only the current owner can transfer the artifact
        assert!(artifact.owner == signer::address_of(owner), 1);
        
        // Change ownership of the artifact
        artifact.owner = new_owner;
    }
}
