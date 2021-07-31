import Artist from "./contract.cdc"

// Return an array of formatted Pictures that exist in the account with the a specific address.
// Return nil if that account doesn't have a Picture Collection.

pub fun display(canvas: Artist.Canvas): String{
  var i: Int = 0
  var headerFooter: [String] = []
  var framedPicture: [String] = []
  headerFooter.append("+")
  while i < Int(canvas.width) {
    headerFooter.append("-")
    i = i + 1
  }

  headerFooter.append("+")
  framedPicture.append((serializeStringArray(headerFooter)))

  i = 0
  while i < canvas.pixels.length {
    
    framedPicture.append(("|").concat(canvas.pixels.slice(from:i, upTo: i + Int(canvas.width) ).concat("|")))
    i = i + Int(canvas.width)
  }
    framedPicture.append(serializeStringArray(headerFooter))

  return serializeStringArray(framedPicture)
}

pub fun serializeStringArray(_ lines: [String]): String {
  var buffer = ""
  for line in lines {
    buffer = buffer.concat(line)
  }

  return buffer
}


pub fun showCollection(collection: &Artist.Collection): [String]? {
  if collection != nil {
    var framedPictures:[String] = []
    var i = 0
    while i < collection.pictures.length {
      framedPictures.append(display(canvas: collection.pictures[i].canvas))
      i = i+1
    }
  return framedPictures
  }
  else{
    return nil
  }

}

pub fun main(address: Address): [String]? {

    let myCollection = getAccount(address)
      .getCapability<&Artist.Collection>(/public/ArtistCollection)
      .borrow()
      ?? panic("Couldn't borrow collection reference. ")

    return(showCollection(collection: myCollection))
}