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

pub fun display(canvas: Canvas){
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
  display(canvas: canvasX)
}