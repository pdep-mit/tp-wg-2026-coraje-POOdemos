import elementos.objeto.Objeto
import configuracionesJuego.*


class Cuchillo inherits Objeto {
  
  override method nombreImagen() = "Cuchillo"

  override method hacerSonido() {
    game.sound("sonidos/cuchillo.mp3").play()
  }

  method interactuarCon(personaje) {
    personaje.agarrarCuchillo()
    self.hacerSonido()
    game.removeVisual(self)
  }
}
