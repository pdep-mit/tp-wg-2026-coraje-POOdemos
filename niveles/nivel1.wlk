import elementos.barril.Barril
import soldado.*
import wollok.game.*
import personaje.*
object nivel1{
    const property ancho = 20
    const property alto = 20

    var ghost = ''

    // FIXME este metodo tarda mucho en cargar, buscar otra forma de hacerlo
const property mapa = [
    [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
    [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1],
    [1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,1,1,0,1],
    [1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,1,0,1],
    [1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,0,1],
    [1,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1,0,1],
    [1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1],
    [1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1],
    [1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1,0,1,1,1],
    [1,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,1],
    [1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1],
    [1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1],
    [1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1],
    [1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1],
    [1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,0,1],
    [1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1],
    [1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1],
    [1,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,1],
    [1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1],
    [1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1],
    [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
]
    method crear(personajeJugable){
        ghost = personajeJugable
        game.addVisual(ghost)
        ghost.position(game.at(5,5))

        self.colocarEnemigos()
        self.colocarObjetos()
    }


    method colocarEnemigos(){
        const enemigo1 = new Soldado(mirandoHacia='Derecha',sujeto='Soldado')
        const enemigo2 = new Soldado(mirandoHacia='Izquierda',sujeto='Soldado')
        game.addVisual(enemigo1)
        game.addVisual(enemigo2)


        enemigo1.position(game.at(1,9))
        enemigo1.patrullar()
        enemigo1.vigilar(ghost)

        enemigo2.position(game.at(1,1))
        enemigo2.patrullar()
        enemigo2.vigilar(ghost)

    }

    method colocarObjetos() {
    var y = 0

    mapa.forEach({ fila =>
        var x = 0

        fila.forEach({ tipo =>
            if (tipo == 1) {
                const barril = new Barril()
                game.addVisual(barril)
                barril.position(game.at(x, y))

            }

            x += 1
        })

        y += 1
    })
}

}

