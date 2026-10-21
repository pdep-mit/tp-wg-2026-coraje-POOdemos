import elementos.objeto.*

class Pared inherits Objeto{
  const imagen
  override method nombreImagen() = imagen
  override method traspasable() = false
  override method hacerSonido() {
    game.sound("sonidos/ladrillo.mp3").play()
  }
}
