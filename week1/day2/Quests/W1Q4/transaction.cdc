import Artist from 0x02

transaction() {
  
  let pixels: String
  let saved: String?

  prepare(account: AuthAccount) {
    let printerRef = getAccount(0x02)
      .getCapability<&Artist.Printer>(/public/ArtistPicturePrinter)
      .borrow()
      ?? panic("Couldn't borrow printer reference.")
    
    // Replace with your own drawings.
    self.pixels = "*   * * *   *   * * *   *"
    let canvas = Artist.Canvas(
      width: printerRef.width,
      height: printerRef.height,
      pixels: self.pixels
    )
    
    let collectionRef = getAccount(0x02)
      .getCapability<&Artist.Collection>(/public/ArtistCollection)
      .borrow()
      ?? panic("Couldn't borrow Collection reference.")
        
    self.saved = collectionRef.deposit(pic: <- printerRef.print(canvas: canvas)!)
  }

  execute {
    log(self.saved)
  }
}