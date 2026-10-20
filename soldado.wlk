import personaje.*
import movimientos.*
import partida.*

class Soldado inherits Personaje{
    override method sujeto() = 'Soldado'

    method esEnemigo() = true

    method puedeMorir() = true
    
    method traspasable() = true

    method rangoVision() = 5 // Rango de vision: A cuantos bloques de distancia te puede ver

    method patrullar(){
        
        partida.cadaMs(5000,"cambiarDireccionSoldado",{
            if (vivo) {
                direccionMirando = [haciaAbajo,haciaArriba,haciaLaDerecha,haciaLaIzquierda].anyOne()

                game.schedule(3000, { => self.avanzar() })

            }
        })

    }

    method avanzar() {
        if (vivo) {
            self.cambiarImagen(self.rutaImagenMovimiento())

            var pasosDados = 0

            partida.cadaMs(300, "pasosSoldado", {
                if (vivo and pasosDados < 4) {
                    movimiento.mover(self)
                    pasosDados += 1
                } else {
                    game.removeTickEvent("pasosSoldado")
                    if (vivo) self.quedarseQuieto()
                }
            })
        }
    }

    method vigilar(personaje) {
        partida.cadaMs(200, "observarEnemigo", {
            if (vivo) self.detectoA(personaje)
        })
    }

    method detectoA(personaje) {
        if (self.position().distance(personaje.position()) < self.rangoVision()
        and direccionMirando.puedeVer(self, self.position(), personaje.position())
        and not self.hayObjetoEnMedio(personaje.position())) {
        self.modoAlerta(personaje)
        }
    }

    method modoAlerta(personaje) {
		self.quedarseQuieto()
        self.cambiarImagen('personajes/'+self.sujeto()+'/Apuntar/'+direccionMirando.nombre()+'.png')
        game.sound('sonidos/arma_soldado.mp3').play()
        personaje.morir()
	}

    method hayObjetoEnMedio(posicionPersonaje) {
        return self.verificarBloqueoPaso(self.position().x(), self.position().y(), posicionPersonaje)
    }

    method verificarBloqueoPaso(miradaX, miradaY, destino) {
        if (miradaX == destino.x() and miradaY == destino.y()) {
            return false
        }

        const difX = destino.x() - miradaX
        const difY = destino.y() - miradaY
        
        var proxX = miradaX
        var proxY = miradaY

        if (difX.abs() > difY.abs()) {
            proxX += if (difX > 0) 1 else -1
        } else if (difY.abs() > difX.abs()) {
            proxY += if (difY > 0) 1 else -1
        } else {
            proxX += if (difX > 0) 1 else -1
            proxY += if (difY > 0) 1 else -1
        }
        
        const posRevisada = game.at(proxX, proxY)
        
        if (posRevisada != destino and not movimiento.puedeMoverseA(posRevisada)) {
            return true
        }

        return self.verificarBloqueoPaso(proxX, proxY, destino)
    }
    
    method interactuarCon(personaje) {
        if (vivo) self.modoAlerta(personaje)
    }

    method morir(){
        if (vivo){
            vivo = false
            self.cambiarImagen('personajes/Soldado/Morir.png')
        }
        
    }

}
