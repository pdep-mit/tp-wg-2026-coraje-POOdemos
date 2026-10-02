
import ghost.*
import wollok.game.*
import niveles.nivel1.*

object config {
	const nivelActual = nivel1
	method mapa() = nivelActual.mapa()
	method alturaMaxima() = nivelActual.ancho()
	method anchoMaximo() = nivelActual.alto()
	method alturaDelSuelo() = 0

	const ghost = new Ghost(sujeto='Ghost',mirandoHacia = 'Arriba')

	method configurarJuego() {
		
		game.title("Nombre del juego")
    game.cellSize(64) 

		// Se le suma 1 para que el personaje no "atraviese" la pared
		// Tener muy en cuenta que las coordenadas van de 0 a [tamaño definido - 1]
		// Si elejis ancho 20 entonces irá de 0 a 19
		game.height(self.alturaMaxima()+1)
		game.width(self.anchoMaximo()+1)


		ghost.configurarTeclas()

		nivelActual.crear(ghost)

		//game.boardGround("fondo.png")

	}
	
	


	
	
}