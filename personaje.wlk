import debug.debug
import wollok.game.*

class Personaje {
	var property position = game.origin()

	

	var property velocidad = caminar
	
	var property vivo = true

	var imagenEvento = null

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
}

object haciaArriba {

	method puedeVer(soldado,miPos, otroPos) {
        return miPos.y() < otroPos.y() and miPos.x() == otroPos.x()
    }

	method nombre() = "Arriba"
	method posicionSiguiente(posicion) = posicion.up(1)
}

object haciaAbajo {
	method puedeVer(soldado,miPos, otroPos) {
        return miPos.y() > otroPos.y() and miPos.x() == otroPos.x()
    }

	method nombre() = "Abajo"
	method posicionSiguiente(posicion) = posicion.down(1)
}

object haciaLaDerecha {
	method puedeVer(soldado,miPos, otroPos) {
        return miPos.x() < otroPos.x() and miPos.y() == otroPos.y()
    }

	method nombre() = "Derecha"
	method posicionSiguiente(posicion) = posicion.right(1)
}

object haciaLaIzquierda {
	method puedeVer(soldado,miPos, otroPos) {
        return miPos.x() > otroPos.x() and miPos.y() == otroPos.y()
    }

	method nombre() = "Izquierda"
	method posicionSiguiente(posicion) = posicion.left(1)
}

object caminar{
	method nombre() = 'Caminar'
	const property velocidad = 300
}

object correr{
	method nombre() = 'Correr'
	const property velocidad = 150
}


