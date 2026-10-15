import elementos.objeto.*
import configuracionesJuego.*

class Meta inherits Objeto {
  override method nombreImagen() = "Meta"

  method interactuarCon(personaje) {
    config.avanzarNivel()
  }
}
