import soldado.*
import elementos.objeto.Objeto
import configuracionesJuego.*
import partida.*

object movimiento {
	method mover(personaje, direccion) {
		personaje.mirarHacia(direccion.nombre())
		const nuevaPosicion = direccion.posicionSiguiente(personaje.position())
		
		if (self.esPosicionValida(nuevaPosicion)){
			personaje.position(nuevaPosicion)
		}
	}

	method esPosicionValida(posicion) {
		return posicion.x().between(0, config.anchoMaximo() - 1) &&
		posicion.y().between(0, config.alturaMaxima() - 1) && self.puedeMoverseA(posicion)
	}

	method puedeMoverseA(posicionNueva) {
		const valores = [1]
    	const fila = config.mapa().get(posicionNueva.y())
    	return not valores.contains(fila.get(posicionNueva.x()))  // falta
	}

	method matar(personaje){
		var direccion = haciaAbajo

		const enemigo = config.nivelActual().enemigoEn(direccion.posicionSiguiente(personaje.position()))

		if (enemigo != null){
			partida.camaraMuerte()
			enemigo.morir()
		}
		else{
			game.say(personaje,'No hay enemigos cerca')
		}
	}
}



object haciaArriba {
	method nombre() = "Arriba"
	method posicionSiguiente(posicion) = posicion.up(1)
}

object haciaAbajo {
	method nombre() = "Abajo"
	method posicionSiguiente(posicion) = posicion.down(1)
}

object haciaLaDerecha {
	method nombre() = "Derecha"
	method posicionSiguiente(posicion) = posicion.right(1)
}

object haciaLaIzquierda {
	method nombre() = "Izquierda"
	method posicionSiguiente(posicion) = posicion.left(1)
}



