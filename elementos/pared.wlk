import elementos.objeto.*
class Pared1 inherits Objeto {
  override method nombreImagen() = "Pared1"
  override method traspasable() = false
  override method hacerSonido() {
    game.sound("sonidos/ladrillo.mp3").play()
  }
}

class Pared2 inherits Objeto {
  override method nombreImagen() = "Pared2"
  override method traspasable() = false
  override method hacerSonido() {
    game.sound("sonidos/ladrillo.mp3").play()
  }
}


class Pared3 inherits Objeto {
  override method nombreImagen() = "Pared3"
  override method traspasable() = false
  override method hacerSonido() {
    game.sound("sonidos/ladrillo.mp3").play()
  }
}
