import elementos.objeto.Objeto
import configuracionesJuego.*


class Llave inherits Objeto {
  
  override method nombreImagen() = "Llave"

  override method hacerSonido() {
    game.sound("sonidos/llave.wav").play()
  }

  method interactuarCon(personaje) {
    personaje.agarrarLlave()
    self.hacerSonido()
    game.removeVisual(self)
  }
}
