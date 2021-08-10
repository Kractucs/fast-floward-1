import KittyItems from Project.KittyItems
import NonFungibleToken from Flow.NonFungibleToken

transaction(itemID: UInt64) {
    let signerCollectionRef: &KittyItems.Collection

    prepare(signer: AuthAccount) {
        self.signerCollectionRef = signer.borrow<&KittyItems.Collection>(from: KittyItems.CollectionStoragePath)
        ?? panic ("Could not borrow capability")
    }

    execute {
        let burnItem <- self.signerCollectionRef.withdraw(withdrawID: itemID)
        destroy burnItem
    }
}