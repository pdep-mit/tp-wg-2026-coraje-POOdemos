import elementos.objeto.*
import UI.cargador.cargador
class Municion inherits Objeto {
  override method nombreImagen() = "Municion"

  method interactuarCon(personaje) {
    game.sound('sonidos/municion.mp3').play()
    game.removeVisual(self)
    cargador.cargarBala()
  }
}
