import configuracionesJuego.config

object vida {
    var property position = game.at(config.anchoMaximo()-6,0)
    var property image = "UI/Vida.gif"

    method cambiarAMuerto(){
        image = "UI/VidaMuerte.png"
    }

    method reiniciar(){
        image = "UI/Vida.gif"
    }
}