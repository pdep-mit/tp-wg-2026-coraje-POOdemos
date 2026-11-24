
import configuracionesJuego.config

object cargador {
    var property position = game.at(5,0)
    var property image = "UI/Balas.png"
    var property balas = 1


    method cargarBala(){
        balas += 1
    }

    method restarBala(){
        balas -=1
    }

    method tieneBalas() = balas > 0

    method reiniciar(){ balas = 1}

}