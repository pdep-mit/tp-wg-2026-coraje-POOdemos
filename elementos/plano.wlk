import elementos.objeto.Objeto
class Plano inherits Objeto {
  
  override method nombreImagen() = "Plano"

  method interactuarCon(personaje) {
    personaje.agarrarPlano()
    game.removeVisual(self)
  }
}
