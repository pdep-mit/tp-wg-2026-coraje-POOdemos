import elementos.objeto.Objeto
class Plano inherits Objeto {
  
  override method nombreImagen() = "Plano"

  override method hacerSonido() {
    game.sound("sonidos/plano.wav").play()
  }

  method interactuarCon(personaje) {
    personaje.agarrarPlano()
    self.hacerSonido()
    game.removeVisual(self)
  }
}
