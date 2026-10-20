import elementos.objeto.*
import configuracionesJuego.*
import niveles.n4.n4

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

class MetaFalsa inherits Objeto {
  override method nombreImagen() = "Meta"   // misma imagen, así no se la distingue

  method interactuarCon(personaje) {
    config.irANivel(n4)
  }
}



