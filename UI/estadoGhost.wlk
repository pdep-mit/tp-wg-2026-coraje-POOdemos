import configuracionesJuego.config

object estadoGhost {
    var property position = game.at(config.anchoMaximo()-2,0)
    var property image = "objetos/EstadoBien.png"

    method cambiarAMuerto(){
        image = "objetos/EstadoMal.png"
    }

    method reiniciar(){
        image = "objetos/EstadoBien.png"
    }
}