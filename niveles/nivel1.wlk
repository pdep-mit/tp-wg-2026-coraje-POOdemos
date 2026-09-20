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
        const enemigo2 = new Soldado(mirandoHacia='Abajo',sujeto='Soldado')
        game.addVisual(enemigo1)
        game.addVisual(enemigo2)

        enemigo2.position(game.at(10,15))

        enemigo2.patrullar()
    }



}

