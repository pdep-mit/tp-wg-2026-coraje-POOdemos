import configuracionesJuego.*

object movimiento {

	method mover(personaje, direccion){
		const nuevaPosicion = direccion.posicionSiguiente(personaje,personaje.position())
		personaje.position(nuevaPosicion)
	}

}

object haciaArriba {
	method posicionSiguiente(personaje,posicion) {
		personaje.mirarHacia("Arriba")
		if (posicion.y() < game.height()-1){
			return posicion.up(1)
		} 
		else return posicion.up(0)
	}
}

object haciaAbajo {
	method posicionSiguiente(personaje,posicion) {
		personaje.mirarHacia("Abajo")
		if (posicion.y() > 0){
			return posicion.down(1) 
		}
		else return posicion.down(0)
	}
}

object haciaLaDerecha {
	method posicionSiguiente(personaje,posicion){
		personaje.mirarHacia("Derecha")
		if(posicion.x() < game.width()-1){
			return posicion.right(1) 
		}
		else return posicion.right(0)
	}
}

object haciaLaIzquierda {
	method posicionSiguiente(personaje,posicion) {
		personaje.mirarHacia("Izquierda")
		if(posicion.x() > 0){
			return posicion.left(1) 
		}
		else return posicion.left(0)
	}
}
