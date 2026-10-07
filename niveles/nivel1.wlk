import UI.indicadorPlano.indicadorPlano
import elementos.plano.Plano
import elementos.barril.Barril
import elementos.pared.Pared
import soldado.*
import wollok.game.*
import personaje.*
import configuracionesJuego.config
object nivel1{
    const property ancho = 15
    const property alto = 10

    var ghost = ''

    // FIXME este metodo tarda mucho en cargar, buscar otra forma de hacerlo

    // Ref :
    // 1 = Barril
    // 2 = Enemigo
    // 3 = Ghost


    const property mapa = [
        [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
        [1,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,0,0,0,0,0,0,0,0,0,0,0,0,2,1],
        [1,0,2,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,0,4,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,3,0,0,0,0,0,0,0,0,0,0,0,0,1],
        [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    ]

    method crear(personajeJugable) {
        ghost = personajeJugable
        
        var y = alto-1

        mapa.forEach({ fila =>
            var x = 0
            fila.forEach({ tipo =>
                self.colocarObjeto(tipo, x, y)
                x += 1
            })
            y-=1
        })

        game.addVisual(indicadorPlano)
    }


    method colocarObjeto(tipo,x,y) {

        if (tipo == 1) {
            const barril = new Barril()
            game.addVisual(barril)
            barril.position(game.at(x, y))
        }
        else if (tipo == 2){
            const enemigo = new Soldado(mirandoHacia = 'Abajo',sujeto='Soldado')
            game.addVisual(enemigo)
            enemigo.position(game.at(x,y))
            enemigo.patrullar()
            enemigo.vigilar(ghost)
        }
        else if (tipo == 3){
            game.addVisual(ghost)
            ghost.position(game.at(x,y))
        }
        else if(tipo == 4){
            const plano = new Plano()
            game.addVisual(plano)
            plano.position(game.at(x,y))

        }

    }

}

