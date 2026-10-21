import ghost.*
import personaje.*
import wollok.game.*
import niveles.n1.n1
import niveles.n2.n2
import niveles.n3.n3

object config {
	var property nivelActual = n1
	const property listaNiveles = [n1,n2,n3]
	var indiceActual = 0
	method mapa() = nivelActual.mapa()
	method alturaMaxima() = nivelActual.alto()
	method anchoMaximo() = nivelActual.ancho()
	method alturaDelSuelo() = 0

	var property ghost = new Ghost(direccionMirando = haciaAbajo)

	method configurarJuego() {
		game.title("Nombre del juego")
		game.cellSize(64)

		// Tener muy en cuenta que las coordenadas van de 0 a [tamaño definido - 1]
		// Si elejis ancho 20 entonces irá de 0 a 19
		game.height(self.alturaMaxima()+2)
		game.width(self.anchoMaximo())

		self.iniciarPartida()


	}

	// Se llama al empezar y cada vez que se reinicia
	method iniciarPartida() {
		ghost = new Ghost(direccionMirando = haciaAbajo)
		ghost.configurarTeclas()


		nivelActual.crear(ghost)

		game.onCollideDo(ghost, {
			elementoQueChoque => elementoQueChoque.interactuarCon(ghost)
		})
		//game.boardGround("fondo.png")
	}

	method avanzarNivel(){
		indiceActual = indiceActual + 1
        nivelActual = listaNiveles.get(indiceActual)
		game.clear()
		self.iniciarPartida()
	}

	method reiniciarPartida(){
		indiceActual = 0
		nivelActual = n1
		game.clear()
		self.iniciarPartida()
	}
	method irANivel(nivel) {
		nivelActual = nivel
		game.clear()
		self.iniciarPartida()
	}
}