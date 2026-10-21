import elementos.objeto.*
class Barril inherits Objeto {
  override method nombreImagen() = "Barril"
  override method traspasable() = false

  override method hacerSonido() {
    game.sound("sonidos/madera.mp3").play()
  }
}
