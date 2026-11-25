import ghost.*
import personaje.*
import wollok.game.*
import niveles.n1.n1
import niveles.n2.n2
import niveles.n3.n3
import niveles.n4.n4
import niveles.n5.n5
import UI.indicadorLlave.*
import UI.indicadorPlano.*
import UI.menuPrincipal.menu

object config {
	var property nivelActual = n1
	const property listaNiveles = [n1,n2,n3,n4,n5]
	var indiceActual = 0
	method mapa() = nivelActual.mapa()
	method alturaMaxima() = nivelActual.alto()
	method anchoMaximo() = nivelActual.ancho()
	method alturaDelSuelo() = 0


	var property ghost = new Ghost(direccionMirando = haciaAbajo)
	var musica = null

	// estado de los objetos permanentes, al pasar de nivel no se pierden
	var property estadoCuchillo = false

	method configurarJuego() {
		game.title("Wollok Gear Solid")
		game.cellSize(64)

		// Tener muy en cuenta que las coordenadas van de 0 a [tamaño definido - 1]
		// Si elejis ancho 20 entonces irá de 0 a 19
		game.height(self.alturaMaxima()+2)
		game.width(self.anchoMaximo())

		self.iniciarMusica()
		menu.mostrarMenu()

 		
	}

	// Se llama al empezar y cada vez que se reinicia
	method iniciarPartida() {


		ghost = new Ghost(direccionMirando = haciaAbajo, tieneCuchillo = estadoCuchillo)
		ghost.configurarTeclas()


		nivelActual.crear(ghost)
		game.boardGround(nivelActual.fondo())

		game.onCollideDo(ghost, {
			elementoQueChoque => elementoQueChoque.interactuarCon(ghost)
		})
	}

	method avanzarNivel(personaje){
		indiceActual = indiceActual + 1
        nivelActual = listaNiveles.get(indiceActual)
		estadoCuchillo = personaje.tieneCuchillo()
		indicadorLlave.reiniciar()
    	indicadorPlano.reiniciar()
		game.clear()
		self.iniciarPartida()
	}

	method reiniciarPartida(){
    	musica.stop()
 		self.iniciarMusica()
		indiceActual = 0
		nivelActual = n1
		estadoCuchillo = false
		game.clear()
		self.iniciarPartida()
	}
	method irANivel(nivel) {
		nivelActual = nivel
		game.clear()
		self.iniciarPartida()
	}

	method iniciarMusica(){
    	musica = game.sound("sonidos/musica.ogg")
		musica.shouldLoop(true)
		musica.play()
	}

}
