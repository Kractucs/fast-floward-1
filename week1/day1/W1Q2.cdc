pub struct Canvas {

  pub let width: UInt8
  pub let height: UInt8
  pub let pixels: String

  init(width: UInt8, height: UInt8, pixels: String) {
    self.width = width
    self.height = height
    self.pixels = pixels
  }
}

pub fun serializeStringArray(_ lines: [String]): String {
  var buffer = ""
  for line in lines {
    buffer = buffer.concat(line)
  }

  return buffer
}

pub resource Picture {
  pub let canvas: Canvas
  
  init(canvas: Canvas) {
    self.canvas = canvas
  }
}

pub fun main() {
  let pixelsX = [
    "*   *",
    " * * ",
    "  *  ",
    " * * ",
    "*   *"
  ]
  let canvasX = Canvas(
    width: 5,
    height: 5,
    pixels: serializeStringArray(pixelsX)
  )
    let pixelsU = [
    "*   *",
    "*   *",
    "*   *",
    "*   *",
    "*****"
  ]
  let canvasU = Canvas(
    width: 5,
    height: 5,
    pixels: serializeStringArray(pixelsU)
  )

  let printer <- create Printer()
  let X1 <- printer.print(canvas: canvasX)
  let X2 <- printer.print(canvas: canvasX)
  let U1 <- printer.print(canvas: canvasU)
  let U2 <- printer.print(canvas: canvasU)

  destroy X1; destroy X2; destroy  U1; destroy U2
  destroy printer
}

pub resource Printer {
  pub let printedPictures: [String]

  init() {
    self.printedPictures = []
  }

  pub fun print(canvas: Canvas): @Picture?{

  // Should do a hash and not just check the pixels 
    if(!self.printedPictures.contains(canvas.pixels)) {
      log("You can print")
      self.printedPictures.append(canvas.pixels)
      return <- create Picture(canvas: canvas)
    }
    else {
      log("Already printed !")
      return nil
    }
  }
}