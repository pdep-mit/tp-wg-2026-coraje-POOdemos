import configuracionesJuego.config

object estadoGhost {
    var property position = game.at(config.anchoMaximo()-2,0)
    var property image = "UI/EstadoBien.gif"

    method cambiarAMuerto(){
        image = "UI/EstadoMal.png"
    }

    method reiniciar(){
        image = "UI/EstadoBien.gif"
    }
}