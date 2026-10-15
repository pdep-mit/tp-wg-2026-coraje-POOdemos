import personaje.*
import movimientos.*

class Soldado inherits Personaje{
    const moviendo = false

    
    method patrullar(){
        
        
        game.onTick(5000,"cambiarDireccionSoldado",{
            if (vivo) direccionMirando = [haciaAbajo,haciaArriba,haciaLaDerecha,haciaLaIzquierda].anyOne()
        })

        game.onTick(200, "animacionSoldado", {
            if (moviendo) {
                self.cambiarFrame()
            }
            else {
                self.quedarseQuieto()
            }
        })

    }

    method vigilar(personaje) {
        game.onTick(200, "observarEnemigo", {
            if (vivo) self.detectoA(personaje)
        })
    }


    method detectoA(personaje) {

        if (self.position().distance(personaje.position()) < 5 and direccionMirando.puedeVer(self,self.position(), personaje.position()) and not self.hayObjetoEnMedio(personaje.position())) {
            self.modoAlerta(personaje)
        } 
    }

    method modoAlerta(personaje) {
        game.removeTickEvent("observar")
		self.quedarseQuieto()
        self.cambiarImagen('personajes/Soldado/Apuntar/'+direccionMirando.nombre()+'.png')
        game.sound('sonidos/arma_soldado.mp3').play()
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
        if (vivo) self.modoAlerta(personaje)
    }

    method morir(){
        vivo = false
        self.cambiarImagen('personajes/Soldado/Morir.png')
    }

}
    
