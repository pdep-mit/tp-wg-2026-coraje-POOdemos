object indicadorPistola {
    var property position = game.at(7,0)
    var property image = "UI/Pistola.png"

    method interactuarCon(personaje) {}

    method planoRecogido() {
      image = "UI/PlanoUITrue.png"
    }
    
    method reiniciar() {
      image = "UI/PlanoUIFalse.png"
    }
}