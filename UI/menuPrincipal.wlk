import partida.*
import configuracionesJuego.*
import wollok.game.*

object menu {

    const dificultades = [  new Dificultad(nombre = 'Facil',esperaEnemigos=2,velocidadMovimientoEnemigos = 500, visionEnemigos = 3,arma = true,metasFalsas = false,velocidadMovimientoJugador = 1),
                            new Dificultad(nombre = 'Normal',esperaEnemigos=1,velocidadMovimientoEnemigos = 300, visionEnemigos = 5,arma = true,metasFalsas = true,velocidadMovimientoJugador = 1),
                            new Dificultad(nombre = 'Fantasma',esperaEnemigos=0.5,velocidadMovimientoEnemigos = 150, visionEnemigos = 7,arma = false,metasFalsas = true,velocidadMovimientoJugador = 2)]

    var indiceDificultad = 0

    var dificultadSeleccionada = dificultades.get(indiceDificultad)

    method dificultad() = dificultadSeleccionada.nombre()

    method cambiarDificultad() {
        if(indiceDificultad < dificultades.size()-1  ){
            indiceDificultad+=1
           
        }
        else indiceDificultad = 0

        dificultadSeleccionada = dificultades.get(indiceDificultad)
    }

    method mostrarMenu() {
        game.clear()
        game.boardGround('UI/Menu.gif')

        game.addVisual(textoTitulo)
        game.addVisual(textoJugar)
        game.addVisual(textoDificultad)


        keyboard.e().onPressDo({
            game.clear() 
            partida.seleccionarDificultad(dificultadSeleccionada)
            config.iniciarPartida()
            partida.reiniciar()
        })

        keyboard.c().onPressDo({
            self.cambiarDificultad()
        })
    }

    

    
}
class Dificultad{
    const property nombre
    const property metasFalsas
    const property visionEnemigos
    const property velocidadMovimientoEnemigos
    const property velocidadMovimientoJugador
    const property esperaEnemigos
    const property arma
}

object textoTitulo {
    const property position = game.at(2,8)
    method image() = "UI/TextosMenu/Titulo.png"
}

object textoJugar {
    const property position = game.at(1,1)
    method image() = "UI/TextosMenu/Jugar.png"
}


object textoDificultad {
    const property position = game.at(6,0)
    method image() = "UI/TextosMenu/"+menu.dificultad()+".png"
}