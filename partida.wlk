import wollok.game.*
import configuracionesJuego.*

object partida {
	var pausada = false

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
		keyboard.r().onPressDo({ self.reiniciar() })
	}

	method reiniciar() {
		game.removeTickEvent('animacionSoldado')
    	game.removeTickEvent('observarEnemigo')
    	game.removeTickEvent('moverGhost')
    	game.removeTickEvent('animacionGhost')
    	game.removeTickEvent('mostrarPosicion')
    	game.removeTickEvent('cambiar camara')
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
	method image() = "UI/Camara muerte.png"
}
