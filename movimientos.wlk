import soldado.*
import elementos.objeto.Objeto
import configuracionesJuego.*
import partida.*

object movimiento {
	method mover(personaje) {

		const nuevaPosicion = personaje.direccionMirando().posicionSiguiente(personaje.position())
		
		if (self.esPosicionValida(nuevaPosicion)){
			personaje.position(nuevaPosicion)
		} else if(personaje == config.ghost()) {
			
			self.reproducirSonidoObstaculo(nuevaPosicion)
		}
	}

	method reproducirSonidoObstaculo(posicion) {
		const obstaculos = game.getObjectsIn(posicion).filter({ obj => !obj.traspasable() })
		if (!obstaculos.isEmpty()) obstaculos.first().hacerSonido()
	}

	method esPosicionValida(posicion) {
		return 
		posicion.x().between(0, config.anchoMaximo() -1) &&
		posicion.y().between(2, config.alturaMaxima()+1) && 
		self.puedeMoverseA(posicion)
	}

	method puedeMoverseA(posicionNueva) {
		return game.getObjectsIn(posicionNueva).all({ obj => obj.traspasable() }) // falta
	}


}





