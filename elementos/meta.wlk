import partida.*
import elementos.objeto.*
import configuracionesJuego.*
import niveles.n4.n4

class Meta inherits Objeto {
  override method nombreImagen() = "Meta"

  method interactuarCon(personaje) {
    config.avanzarNivel()
  }
}

class MetaCerrada inherits Meta {

  override method interactuarCon(personaje) {
    if (personaje.tieneLlave()) config.avanzarNivel()
    else game.say(personaje, "Necesito la llave")
  }
}

class MetaFalsa inherits Meta {

  override method interactuarCon(personaje) {
    config.irANivel(n4)
  }
}

class MetaFinal inherits Meta{
  override method interactuarCon(personaje) {
    if(personaje.tienePlano()){
      partida.terminarConVictoria(personaje)
    }
    else game.say(personaje,"No me puedo ir sin cumplir la mision")
  }
}

