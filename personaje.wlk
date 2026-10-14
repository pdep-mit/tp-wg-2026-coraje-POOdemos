import debug.debug
import wollok.game.*

class Personaje {
	var property position = game.origin()
	var frameActual = 0
    const maxFrames = 4

	var etapaCiclo = 0
	const maxetapaCiclo = 11

	var velocidad = 'Caminar'
	const sujeto
	var property vivo = true

	var imagenEvento = null

	var property direccionMirando

	method image() {
    	if (imagenEvento != null) {
        	return imagenEvento
    	}
    	return "personajes/"+sujeto+"/"+velocidad+"/"+direccionMirando.nombre()+"/"+etapaCiclo+".png"
	}
	
	method cambiarImagen(unaImagen) {
	    imagenEvento = unaImagen
	}
	
	method resetearImagen() {
	    imagenEvento = null
	}


	method mirarHacia(direccion){
		direccionMirando = direccion
	}

	method quedarseQuieto(){
		etapaCiclo = 0
	}

	method velocidadMovimiento(valor){
		velocidad = valor
	}

	method cambiarFrame() {
        frameActual = (frameActual + 1) % maxFrames
        
		if (etapaCiclo != maxetapaCiclo)
			etapaCiclo += 1
		else etapaCiclo = 1
    }


	method mostrarPosicion() {
		debug.say(self, "Posición: " + self.position())
	}
}

object haciaArriba {

	method puedeVer(soldado,miPos, otroPos) {
        //soldado.mirarHacia('Arriba')
        return miPos.y() < otroPos.y() and miPos.x() == otroPos.x()
    }

	method nombre() = "Arriba"
	method posicionSiguiente(posicion) = posicion.up(1)
}

object haciaAbajo {
	method puedeVer(soldado,miPos, otroPos) {
        //soldado.mirarHacia('Abajo')
        return miPos.y() > otroPos.y() and miPos.x() == otroPos.x()
    }

	method nombre() = "Abajo"
	method posicionSiguiente(posicion) = posicion.down(1)
}

object haciaLaDerecha {
	method puedeVer(soldado,miPos, otroPos) {
        //soldado.mirarHacia('Derecha')
        return miPos.x() < otroPos.x() and miPos.y() == otroPos.y()
    }

	method nombre() = "Derecha"
	method posicionSiguiente(posicion) = posicion.right(1)
}

object haciaLaIzquierda {
	method puedeVer(soldado,miPos, otroPos) {
        //soldado.mirarHacia('Izquierda')
        return miPos.x() > otroPos.x() and miPos.y() == otroPos.y()
    }

	method nombre() = "Izquierda"
	method posicionSiguiente(posicion) = posicion.left(1)
}



