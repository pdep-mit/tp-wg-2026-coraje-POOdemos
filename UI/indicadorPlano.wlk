object indicadorPlano {
    var property position = game.at(0,0)
    var property image = "objetos/PlanoUIFalse.png"

    method interactuarCon(personaje) {}

    method planoRecogido() {
      image = "objetos/PlanoUITrue.png"
    }
        method reiniciar() {
      image = "objetos/PlanoUIFalse.png"
    }
}