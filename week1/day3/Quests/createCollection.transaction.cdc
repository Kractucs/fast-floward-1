import Artist from "./contract.cdc"

// Create a Picture Collection for the transaction authorizer.
transaction {
    prepare(acct: AuthAccount) {

        acct.save(
            <- Artist.createCollection(),
            to: /storage/ArtistCollection
        )        
        acct.link<&Artist.Collection>(
            /public/ArtistCollection,
            target: /storage/ArtistCollection
        )       
    }
}