import UI.indicadorPlano.*
import wollok.game.*
import configuracionesJuego.*
import UI.indicadorLlave.indicadorLlave

object partida {
	var property pausada = false

	method pausar() {
		pausada = true
	}

	method reanudar(){
		pausada = false
	}

	// Igual que game.onTick, pero no ejecuta la acción mientras la partida está pausada
	method cadaMs(milisegundos, nombre, accion) {
		game.onTick(milisegundos, nombre, { if (!pausada) accion.apply() })
	}


	method camaraMuerte(){

		game.addVisual(pantallaMuerte)
		game.schedule(1000, { => game.removeVisual(pantallaMuerte) })
		
	}

	method terminarConDerrota(personaje) {
		self.pausar()
		game.say(personaje, "¡Morí!")
		game.addVisual(pantallaDerrota)
	}

	method terminarConVictoria(personaje){
		self.pausar()
		game.say(personaje,"Mision cumplida")
		game.addVisual(pantallaEscape)
	}

	method reiniciar() {
		indicadorLlave.reiniciar()
		indicadorPlano.reiniciar()
		pausada = false
		config.reiniciarPartida()
	}
}

object pantallaDerrota {
	const property position = game.at(0,2)
	method image() = "UI/GameOver.png"
	method interactuarCon(personaje) {}
}

object pantallaMuerte {
	const property position = game.at(0,2)
	method image() = "UI/CamaraMuerte.png"
}

object pantallaEscape {
	const property position = game.at(0,2)
	method image() = "UI/CamaraEscape.png"
}