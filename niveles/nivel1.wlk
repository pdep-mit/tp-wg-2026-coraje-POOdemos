import soldado.*
import wollok.game.*
import personaje.*
object nivel1{
    var ghost = ''

    method crear(personajeJugable){
        ghost = personajeJugable
        game.addVisual(ghost)
        ghost.position(game.at(5,5))

        self.colocarEnemigos()
    }


    method colocarEnemigos(){
        const enemigo1 = new Soldado(mirandoHacia='Derecha',sujeto='Soldado')
        const enemigo2 = new Soldado(mirandoHacia='Izquierda',sujeto='Soldado')
        game.addVisual(enemigo1)
        game.addVisual(enemigo2)


        enemigo1.position(game.at(0,9))
        enemigo1.patrullar()
        enemigo1.vigilar(ghost)

        enemigo2.position(game.at(20,9))
        enemigo2.patrullar()
        enemigo2.vigilar(ghost)

    }



}

