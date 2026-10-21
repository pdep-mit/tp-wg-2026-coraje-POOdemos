object indicadorCuchillo {
    var property position = game.at(2,0)
    var property image = "UI/CuchilloUIFalse.png"

    method interactuarCon(personaje) {}

    method cuchilloRecogido() {
      image = "UI/CuchilloUITrue.png"
    }
    
    method reiniciar() {
      image = "UI/CuchilloUIFalse.png"
    }
}