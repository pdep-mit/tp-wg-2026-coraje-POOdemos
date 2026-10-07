import elementos.objeto.Objeto
import configuracionesJuego.*

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
	const valores = [0,2,3,4,5]
    const fila = config.mapa().get(posicionNueva.y())
    return valores.contains(fila.get(posicionNueva.x()))
	}
}

// object movimiento {

// 	method mover(personaje, direccion){
// 		const nuevaPosicion = direccion.posicionSiguiente(personaje,personaje.position())
// 		personaje.position(nuevaPosicion)
// 	}

// }


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



// object haciaArriba {
// 	method posicionSiguiente(personaje,posicion) {
// 		personaje.mirarHacia("Arriba")
// 		if (posicion.y() < config.alturaMaxima()-1){
// 			return posicion.up(1)
// 		} 
// 		else return posicion.up(0)
// 	}
// }

// object haciaAbajo {
// 	method posicionSiguiente(personaje,posicion) {
// 		personaje.mirarHacia("Abajo")
// 		if (posicion.y() > 0){
// 			return posicion.down(1) 
// 		}
// 		else return posicion.down(0)
// 	}
// }

// object haciaLaDerecha {
// 	method posicionSiguiente(personaje,posicion){
// 		personaje.mirarHacia("Derecha")
// 		if(posicion.x() < config.anchoMaximo()-1){
// 			return posicion.right(1) 
// 		}
// 		else return posicion.right(0)
// 	}
// }

// object haciaLaIzquierda {
// 	method posicionSiguiente(personaje,posicion) {
// 		personaje.mirarHacia("Izquierda")
// 		if(posicion.x() > 0){
// 			return posicion.left(1) 
// 		}
// 		else return posicion.left(0)
// 	}
// }
