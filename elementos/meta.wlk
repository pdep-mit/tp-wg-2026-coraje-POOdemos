import elementos.objeto.*
import configuracionesJuego.*

class Meta inherits Objeto {
  override method nombreImagen() = "Meta"

  method interactuarCon(personaje) {
    config.avanzarNivel()
  }
}

class MetaCerrada inherits Objeto {
  override method nombreImagen() = "Meta"

  method interactuarCon(personaje) {
    if (personaje.tieneLlave()) config.avanzarNivel()
    else game.say(personaje, "Necesito la llave")
  }
}


