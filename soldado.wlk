import personaje.*
import movimientos.*

class Soldado inherits Personaje{
    const moviendo = false
    var direccionVigilancia = direccionAbajo


    method patrullar(){
        
        
        game.onTick(5000,"Cambiar direccion",{
            direccionVigilancia = [direccionArriba,direccionAbajo,direccionIzquierda,direccionDerecha].anyOne()
        })

        game.onTick(200, "animacion", {
            if (moviendo) {
                self.cambiarFrame()
            }
            else {
                self.quedarseQuieto()
            }
        })

    }

    method vigilar(personaje) {
        game.onTick(200, "observar", {
            self.detectoA(personaje)
        })
    }


    method detectoA(personaje) {

        if (self.position().distance(personaje.position()) < 5 and direccionVigilancia.puedeVer(self,self.position(), personaje.position()) and not self.hayObjetoEnMedio(personaje.position())) {
            self.modoAlerta(personaje)
        } 
    }

    method modoAlerta(personaje) {
		self.quedarseQuieto()
        self.cambiarImagen('personajes/Soldado/Apuntar/'+mirandoHacia+'.png')
        personaje.morir()
	}

    method hayObjetoEnMedio(posicionPersonaje) {
        // mirada soldado personaje
        return self.verificarBloqueoPaso(self.position().x(), self.position().y(), posicionPersonaje)
    }

    method verificarBloqueoPaso(miradaX, miradaY, destino) {
        // la mirada llegó a la posición del personaje sin chocar con nada
        if (miradaX == destino.x() and miradaY == destino.y()) {
            return false
        }

        const difX = destino.x() - miradaX
        const difY = destino.y() - miradaY
        
        var proxX = miradaX
        var proxY = miradaY

        // Calculamos hacia dónde avanza la mirada en este paso
        if (difX.abs() > difY.abs()) {
            proxX += if (difX > 0) 1 else -1
        } else if (difY.abs() > difX.abs()) {
            proxY += if (difY > 0) 1 else -1
        } else {
            proxX += if (difX > 0) 1 else -1
            proxY += if (difY > 0) 1 else -1
        }
        
        const posRevisada = game.at(proxX, proxY)
        
        //Si la casilla que estamos mirando no es el destino final y es un objeto la visión se bloquea
        if (posRevisada != destino and not movimiento.puedeMoverseA(posRevisada)) {
            return true
        }

        // Si la casilla está libre, el método se llama a sí mismo para dar el siguiente paso
        return self.verificarBloqueoPaso(proxX, proxY, destino)
    }
    
    method interactuarCon(personaje) {
        self.modoAlerta(personaje)
    }

    

}
    
object direccionArriba {
    method puedeVer(soldado,miPos, otroPos) {
        soldado.mirarHacia('Arriba')
        return miPos.y() < otroPos.y() and miPos.x() == otroPos.x()
    }
}

object direccionAbajo {
    method puedeVer(soldado,miPos, otroPos) {
        soldado.mirarHacia('Abajo')
        return miPos.y() > otroPos.y() and miPos.x() == otroPos.x()
    }
}

object direccionIzquierda {
    method puedeVer(soldado,miPos, otroPos) {
        soldado.mirarHacia('Izquierda')
        return miPos.x() > otroPos.x() and miPos.y() == otroPos.y()
    }
}

object direccionDerecha {
    method puedeVer(soldado,miPos, otroPos) {
        soldado.mirarHacia('Derecha')
        return miPos.x() < otroPos.x() and miPos.y() == otroPos.y()
    }
}