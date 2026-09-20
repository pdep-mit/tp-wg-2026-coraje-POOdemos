
import ghost.*
import wollok.game.*
import niveles.nivel1.*

object config {
	method alturaMaxima() = 19
	method anchoMaximo() = 20
	method alturaDelSuelo() = 0

	const ghost = new Ghost(sujeto='Ghost',mirandoHacia = 'Arriba')

	method configurarJuego() {
		
		game.title("Nombre del juego")
		game.height(self.alturaMaxima())
		game.width(self.anchoMaximo()+2)


		ghost.configurarTeclas()

		nivel1.crear(ghost)

		//game.boardGround("fondo.png")

	}
	
	


	
	
}