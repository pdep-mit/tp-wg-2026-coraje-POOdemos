import wollok.game.*
import configuracionesJuego.*

object partida {
	var pausada = false

	method estaPausada() = pausada

	method pausar() {
		pausada = true
	}

	// Igual que game.onTick, pero no ejecuta la acción mientras la partida está pausada
	method cadaMs(milisegundos, nombre, accion) {
		game.onTick(milisegundos, nombre, { if (!pausada) accion.apply() })
	}

	method terminarConDerrota(personaje) {
		self.pausar()
		game.say(personaje, "¡Morí!")
		game.addVisual(pantallaDerrota)
		game.addVisual(textoReinicio)
		keyboard.r().onPressDo({ self.reiniciar() })
	}

	method reiniciar() {
		game.clear()
		pausada = false
		config.iniciarPartida()
	}
}

object pantallaDerrota {
	const property position = game.origin()
	method image() = "objetos/GameOver.png"
	method interactuarCon(personaje) {}
}

object textoReinicio {
	const property position = game.at(5, 3)
	method text() = "Presioná R para reiniciar"
	method textColor() = "FFFFFF"
	method interactuarCon(personaje) {}
}