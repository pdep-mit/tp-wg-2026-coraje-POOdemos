import soldado.*
import elementos.objeto.Objeto
import configuracionesJuego.*
import partida.*

object movimiento {
	method mover(personaje) {

		const nuevaPosicion = personaje.direccionMirando().posicionSiguiente(personaje.position())
		
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

		const enemigo = config.nivelActual().enemigoEn(personaje.direccionMirando().posicionSiguiente(personaje.position()))

		if (enemigo != null && personaje.vivo()){
			partida.camaraMuerte()
			enemigo.morir()
		}
		else{
			game.say(personaje,'No hay enemigos cerca')
		}
	}
}





