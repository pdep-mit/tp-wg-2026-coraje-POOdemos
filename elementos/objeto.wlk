class Objeto {
  var property position = game.origin()

  method esArbusto() = false

  method nombreImagen() = "Objeto"

  method image() = "objetos/" + self.nombreImagen() + ".png"

  method traspasable() = true

  method hacerSonido() {}
  
  method esEnemigo() = false

}