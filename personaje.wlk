import debug.debug
import wollok.game.*
import movimientos.movimiento
class Personaje {
	var property position = game.origin()

	method esArbusto() = false

	var property velocidad = caminar
	
	var property vivo = true

	var imagenEvento = null
	var apuntando = false
	

	var property direccionMirando

	method sujeto() = 'Ghost'

	method image() {
    	if (imagenEvento != null) {
        	return imagenEvento
    	}
    	return "personajes/"+self.sujeto()+"/Quieto/"+direccionMirando.nombre()+".png"
	}
	
	method rutaImagenMovimiento() = "personajes/"+self.sujeto()+"/" + velocidad.nombre() + "/" + direccionMirando.nombre() + ".gif"

	method cambiarImagen(unaImagen) {
	    imagenEvento = unaImagen
	}
	
	method mirarHacia(direccion){
		direccionMirando = direccion
	}

	method quedarseQuieto(){
		if(!apuntando)
		imagenEvento = null
	}

	method caminar(){
		velocidad = caminar
	}

	method correr(){
		velocidad = correr
	}

	method mostrarPosicion() {
		debug.say(self, "Posición: " + self.position())
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
}

object haciaArriba {

	method puedeVer(personaje,miPos, otroPos) {
        return miPos.y() < otroPos.y() and miPos.x() == otroPos.x()
    }

	method nombre() = "Arriba"
	method posicionSiguiente(posicion) = posicion.up(1)
}

object haciaAbajo {
	method puedeVer(personaje,miPos, otroPos) {
        return miPos.y() > otroPos.y() and miPos.x() == otroPos.x()
    }

	method nombre() = "Abajo"
	method posicionSiguiente(posicion) = posicion.down(1)
}

object haciaLaDerecha {
	method puedeVer(personaje,miPos, otroPos) {
        return miPos.x() < otroPos.x() and miPos.y() == otroPos.y()
    }

	method nombre() = "Derecha"
	method posicionSiguiente(posicion) = posicion.right(1)
}

object haciaLaIzquierda {
	method puedeVer(personaje,miPos, otroPos) {
        return miPos.x() > otroPos.x() and miPos.y() == otroPos.y()
    }

	method nombre() = "Izquierda"
	method posicionSiguiente(posicion) = posicion.left(1)
}


object caminar{
	const property velocidad = 300
	method nombre() = 'Caminar'
}

object correr{
	const property velocidad = 150
	method nombre() = 'Correr'
}


