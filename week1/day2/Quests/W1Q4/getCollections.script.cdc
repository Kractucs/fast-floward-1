import Artist from 0x02

pub fun display(canvas: Artist.Canvas){
  var i: Int = 0
  var headerFooter: [String] = []
  headerFooter.append("+")
  while i < Int(canvas.width) {
    headerFooter.append("-")
    i = i + 1
  }

  headerFooter.append("+")
  log(serializeStringArray(headerFooter))

  i = 0
  while i < canvas.pixels.length {
    
    log(("|").concat(canvas.pixels.slice(from:i, upTo: i + Int(canvas.width) ).concat("|")))
    i = i + Int(canvas.width)
  }
    log(serializeStringArray(headerFooter))
}

pub fun serializeStringArray(_ lines: [String]): String {
  var buffer = ""
  for line in lines {
    buffer = buffer.concat(line)
  }

  return buffer
}

pub fun showCollection(collection: &Artist.Collection) {
  if collection.pictures.length == 0 {
    log("the collection is empty")
  }
  else if collection != nil {
    var i = 0
    while i < collection.pictures.length {
      display(canvas: collection.pictures[i].canvas)
      i = i+1
    }
  }
  else{
    log("this account has no colleciton")
  }

}


pub fun main(){

  let account1 = getAccount(0x01)
  let account2 = getAccount(0x02)
  let account3 = getAccount(0x03)
  let account4 = getAccount(0x04)
  let account5 = getAccount(0x05)

    let collection1 = account1
      .getCapability<&Artist.Collection>(/public/ArtistCollection)
      .borrow()
      ?? panic("Couldn't borrow collection reference. ")

    let collection2 = account2
      .getCapability<&Artist.Collection>(/public/ArtistCollection)
      .borrow()
      ?? panic("Couldn't borrow collection reference. ")

    let collection3 = account3
      .getCapability<&Artist.Collection>(/public/ArtistCollection)
      .borrow()
      ?? panic("Couldn't borrow collection reference. ")

    let collection4 = account4
      .getCapability<&Artist.Collection>(/public/ArtistCollection)
      .borrow()
      ?? panic("Couldn't borrow collection reference. ")

    let collection5 = account5
      .getCapability<&Artist.Collection>(/public/ArtistCollection)
      .borrow()
      ?? panic("Couldn't borrow collection reference. ")



    log("account 1")
    showCollection(collection: collection1)
    log("account 2")
    showCollection(collection: collection2)
    log("account 3")
    showCollection(collection: collection3)
    log("account 4")
    showCollection(collection: collection4)
    log("account 5")
    showCollection(collection: collection5)

}