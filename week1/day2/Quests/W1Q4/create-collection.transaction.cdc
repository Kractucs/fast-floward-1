import Artist from 0x02

// Thank you https://github.com/hhSpark

transaction {
    prepare(acct: AuthAccount) {

        log("account ".concat(acct.address.toString()))
        acct.save(
            <- Artist.createCollection(),
            to: /storage/ArtistCollection
        )

        log("deploy collection storage for this account")
        
        acct.link<&Artist.Collection>(
            /public/ArtistCollection,
            target: /storage/ArtistCollection
        )

        log("create a link reference for this account storage")
        
    }

}