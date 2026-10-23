import UI.indicadorPlano.indicadorPlano
import UI.indicadorLlave.indicadorLlave
import UI.indicadorCuchillo.indicadorCuchillo
import UI.vida.vida
import UI.estadoGhost.estadoGhost
import personaje.*
import movimientos.*
import partida.*

class Ghost inherits Personaje{
    var wPresionado = false
    var sPresionado = false
    var aPresionado = false
    var dPresionado = false
    var shiftPresionado = false
	var invisible = false

	var property tienePlano = false
	var property tieneLlave = false
	var property tieneCuchillo = false


	method traspasable() = false

	

	method actualizarImagen() {
		self.actualizarVisibilidad()
		if (vivo) {
			if (self.teclaMovimientoSeleccionada()) {
				self.cambiarImagen(self.rutaImagenMovimiento())
			} else {
				self.quedarseQuieto()
			}
		}
	}

    method configurarTeclas() {
		
		// Configurar las teclas
		keyboard.w().onPressDo({ wPresionado = true; self.mirarHacia(haciaArriba) })
		keyboard.w().onReleaseDo({ wPresionado = false })
		
		keyboard.s().onPressDo({ sPresionado = true; self.mirarHacia(haciaAbajo) })
		keyboard.s().onReleaseDo({ sPresionado = false })
		
		keyboard.a().onPressDo({ aPresionado = true; self.mirarHacia(haciaLaIzquierda) })
		keyboard.a().onReleaseDo({ aPresionado = false })
		
		keyboard.d().onPressDo({ dPresionado = true; self.mirarHacia(haciaLaDerecha)  })
		keyboard.d().onReleaseDo({ dPresionado = false })

		keyboard.shift().onPressDo({ shiftPresionado = true; self.correr() })
		keyboard.shift().onReleaseDo({ shiftPresionado = false; self.caminar() })
		

		keyboard.z().onPressDo({self.matar()})

		keyboard.r().onPressDo({
    		if (!self.vivo()) {
        		partida.reiniciar()
    		}
		})

		self.iniciarMovimiento()
		

		partida.cadaMs(100, "imagenGhost", {
			self.actualizarImagen()
		})

		partida.cadaMs(300, "mostrarPosicion", {
			self.mostrarPosicion()
		})

		
	}

	method iniciarMovimiento() {
    	partida.cadaMs(
        	(self.velocidad().velocidad()*partida.dificultad().velocidadMovimientoJugador()),"moverGhost",{ 
            	if (self.teclaMovimientoSeleccionada()) movimiento.mover(self)
				else self.quedarseQuieto()
        	}
    	)
	}

	override method correr(){
    	velocidad = correr
    	game.removeTickEvent("moverGhost")
    	self.iniciarMovimiento()
	}

	override method caminar(){
    	velocidad = caminar
    	game.removeTickEvent("moverGhost")
    	self.iniciarMovimiento()
	}

	method teclaMovimientoSeleccionada() {

    	const teclasPresionadas = [wPresionado, aPresionado, sPresionado, dPresionado]
        	.filter({ t => t })
        	.size()
    
		if(teclasPresionadas > 1) self.quedarseQuieto()

    	return teclasPresionadas == 1  // Solo se mueve si hay exactamente 1 tecla presionada
	}
	
	method agarrarPlano() {
		tienePlano = true
		indicadorPlano.planoRecogido()
	}

	method agarrarLlave() {
		tieneLlave = true
		indicadorLlave.llaveRecogida()
	}

	method agarrarCuchillo() {
		tieneCuchillo = true
		indicadorCuchillo.cuchilloRecogido()
	}

	method morir() {
  		if (vivo) {
  			vivo = false
  			partida.terminarConDerrota(self)
  		}
		self.cambiarImagen('personajes/Ghost/Morir.png')

		game.sound('sonidos/ghost_quejido.mp3').play()
		estadoGhost.cambiarAMuerto()
		vida.cambiarAMuerto()
  	}

	method matar(){
		const posicionObjetivo = self.direccionMirando().posicionSiguiente(self.position())

		const enemigo = game.getObjectsIn(posicionObjetivo).findOrDefault({ obj => obj.esEnemigo() }, null)

		if (self.tieneCuchillo()){
			if (enemigo != null && self.vivo()){
				if (enemigo.puedeMorir()){
					partida.camaraMuerte()
					enemigo.morir()}
				
			}
			else{
				game.say(self,'No hay enemigos cerca')
			}
		}
		else{
			game.say(self,"Necesito un arma")
		}

	}

	method esInvisible() = invisible

	method actualizarVisibilidad() {
		invisible = game.getObjectsIn(self.position()).any({ obj => obj.esArbusto() })
		if(invisible){
			estadoGhost.cambiarAInvisible()
		}
		else{
			estadoGhost.reiniciar()
		}
	}

}