import ghost.*
import wollok.game.*
import niveles.n1.n1

object config {
	const nivelActual = n1
	method mapa() = nivelActual.mapa()
	method alturaMaxima() = nivelActual.alto()
	method anchoMaximo() = nivelActual.ancho()
	method alturaDelSuelo() = 0

	var ghost = new Ghost(sujeto='Ghost', mirandoHacia='Arriba')

	method configurarJuego() {
		game.title("Nombre del juego")
		game.cellSize(64)

		// Tener muy en cuenta que las coordenadas van de 0 a [tamaño definido - 1]
		// Si elejis ancho 20 entonces irá de 0 a 19
		game.height(self.alturaMaxima())
		game.width(self.anchoMaximo())
		ghost.configurarTeclas()
		self.iniciarPartida()
	}

	// Se llama al empezar y cada vez que se reinicia
	method iniciarPartida() {
		ghost = new Ghost(sujeto='Ghost', mirandoHacia='Arriba')
		ghost.configurarTeclas()

		game.onCollideDo(ghost, {
			elementoQueChoque => elementoQueChoque.interactuarCon(ghost)
		})

		nivelActual.crear(ghost)
		//game.boardGround("fondo.png")
	}
}