import elementos.objeto.*

class Trampa inherits Objeto {
  override method nombreImagen() = "Trampa"

  // Polimorfismo: igual que Plano, responde al mismo mensaje que usa config (onCollideDo)
  method interactuarCon(personaje) {
    personaje.morir()
  }
}
