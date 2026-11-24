import personaje.*
import movimientos.*
import partida.*

class Soldado inherits Personaje{
    const id

    override method sujeto() = 'Soldado'

    method esEnemigo() = true

    method puedeMorir() = true
    
    method traspasable() = true

    method rangoVision() = partida.dificultad().visionEnemigos() // Rango de vision: A cuantos bloques de distancia te puede ver

    const patronMovimiento

    var indicePatronMovimiento = 0

    method siguienteDireccion(){
        if(indicePatronMovimiento < patronMovimiento.direcciones().size()-1  ){
            indicePatronMovimiento+=1
           
        }
        else indicePatronMovimiento = 0

        return patronMovimiento.direcciones().get(indicePatronMovimiento)
    }

    method patrullar(){
        
        partida.cadaMs(partida.dificultad().velocidadMovimientoEnemigos()*patronMovimiento.pasos() + 5000,"cambiarDireccionSoldado"+id,{
            if (vivo) {
                direccionMirando = self.siguienteDireccion()

                game.schedule(3000, { => self.avanzar() })

            }
        })

    }

    method avanzar() {
        if (vivo) {
            self.cambiarImagen(self.rutaImagenMovimiento())

            var pasosDados = 0

            partida.cadaMs(partida.dificultad().velocidadMovimientoEnemigos(), "pasosSoldado"+id, {
                if (vivo and pasosDados < patronMovimiento.pasos()) {
                    movimiento.mover(self)
                    pasosDados += 1
                } else {
                    game.removeTickEvent("pasosSoldado"+id)
                    if (vivo) self.quedarseQuieto()
                }
            })
        }
    }

    method vigilar(personaje) {
        partida.cadaMs(200, "observarEnemigo"+id, {
            if (vivo) self.detectoA(personaje)
        })
    }

    method detectoA(personaje) {
        if (self.position().distance(personaje.position()) < self.rangoVision()
        and direccionMirando.puedeVer(self, self.position(), personaje.position())
        and not self.hayObjetoEnMedio(personaje.position()) 
        and not personaje.esInvisible()){
        self.modoAlerta(personaje)
        }
    }

    method modoAlerta(personaje) {
		self.quedarseQuieto()
        self.cambiarImagen('personajes/'+self.sujeto()+'/Apuntar/'+direccionMirando.nombre()+'.png')
        game.sound('sonidos/arma_soldado.mp3').play()
        personaje.morir()
	}


    
    method interactuarCon(personaje) {
        if (vivo) self.modoAlerta(personaje)
    }

    method morir(){
        if (vivo){
            vivo = false
            self.cambiarImagen('personajes/Soldado/Morir.png')
            game.sound('sonidos/muerte.wav').play()
        }
        
    }

}

class PatronMovimiento {
    const property direcciones
    const property pasos
}

