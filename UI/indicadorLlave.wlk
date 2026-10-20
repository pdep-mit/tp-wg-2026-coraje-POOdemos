object indicadorLlave {
    var property position = game.at(1,0)
    var property image = "UI/LlaveUIFalse.png"

    method interactuarCon(personaje) {}

    method llaveRecogida() {
      image = "UI/LlaveUITrue.png"
    }
    
    method reiniciar() {
      image = "UI/LlaveUIFalse.png"
    }
}