object indicadorPlano {
    var property position = game.at(0,0)
    var property image = "UI/PlanoUIFalse.png"

    method interactuarCon(personaje) {}

    method planoRecogido() {
      image = "UI/PlanoUITrue.png"
    }
    
    method reiniciar() {
      image = "UI/PlanoUIFalse.png"
    }
}