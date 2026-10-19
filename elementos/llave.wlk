import elementos.objeto.Objeto
import configuracionesJuego.*


class Llave inherits Objeto {
  
  override method nombreImagen() = "Llave"

  method interactuarCon(personaje) {
    personaje.agarrarLlave()
    game.removeVisual(self)
  }
}
