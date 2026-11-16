import elementos.objeto.*
class Caja inherits Objeto {
  override method nombreImagen() = "Caja"
  override method traspasable() = false
  
  override method hacerSonido() {
    game.sound("sonidos/madera.mp3").play()
  }
  
}
