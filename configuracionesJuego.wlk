
import personaje.*
import movimientos.*
import wollok.game.*

object config {
	method alturaMaxima() = 20
	method anchoMaximo() = 20
	method alturaDelSuelo() = 0

	var frameActual = 0
    const maxFrames = 4

	var wPresionado = false
    var sPresionado = false
    var aPresionado = false
    var dPresionado = false
    var shiftPresionado = false

	const personaje = new Personaje(sujeto='Ghost',mirandoHacia = 'Arriba')

	method configurarJuego() {
		
		self.configurarVentana()
		self.agregarComponentesVisuales()
		self.configurarAcciones()
	}
	
	method configurarVentana() {
		game.title("Nombre del juego")
		game.height(self.alturaMaxima())
		game.width(self.anchoMaximo())
		//game.boardGround("fondo.png")
	}
	
	method agregarComponentesVisuales() {
		game.addVisual(personaje)
	}
	
	method configurarAcciones() {
		
		
		// Configurar las teclas
		keyboard.w().onPressDo({ wPresionado = true; personaje.mirarHacia('Arriba') })
		keyboard.w().onReleaseDo({ wPresionado = false })
		
		keyboard.s().onPressDo({ sPresionado = true; personaje.mirarHacia('Abajo') })
		keyboard.s().onReleaseDo({ sPresionado = false })
		
		keyboard.a().onPressDo({ aPresionado = true; personaje.mirarHacia('Izquierda') })
		keyboard.a().onReleaseDo({ aPresionado = false })
		
		keyboard.d().onPressDo({ dPresionado = true; personaje.mirarHacia('Derecha')  })
		keyboard.d().onReleaseDo({ dPresionado = false })

		keyboard.shift().onPressDo({ shiftPresionado = true; personaje.velocidadMovimiento('Correr') })
		keyboard.shift().onReleaseDo({ shiftPresionado = false; personaje.velocidadMovimiento('Caminar') })
		
		const teclas = [wPresionado,aPresionado,sPresionado,dPresionado]

		// Movimiento continuo
		game.onTick(
			300,"caminar",{ 

				if (self.teclaSeleccionada(wPresionado) and !shiftPresionado) movimiento.mover(personaje, haciaArriba)
				else if (self.teclaSeleccionada(sPresionado) and !shiftPresionado) movimiento.mover(personaje, haciaAbajo)
				else if (self.teclaSeleccionada(aPresionado) and !shiftPresionado) movimiento.mover(personaje, haciaLaIzquierda)
				else if (self.teclaSeleccionada(dPresionado) and !shiftPresionado) movimiento.mover(personaje, haciaLaDerecha)
			}
		)

		game.onTick(
			150,"correr",{ 
				if (self.teclaSeleccionada(wPresionado) and shiftPresionado) movimiento.mover(personaje, haciaArriba)
				else if (self.teclaSeleccionada(sPresionado) and shiftPresionado) movimiento.mover(personaje, haciaAbajo)
				else if (self.teclaSeleccionada(aPresionado) and shiftPresionado) movimiento.mover(personaje, haciaLaIzquierda)
				else if (self.teclaSeleccionada(dPresionado) and shiftPresionado) movimiento.mover(personaje, haciaLaDerecha)
			}
		)

		game.onTick(300, "quieto",{
			if(!wPresionado and !aPresionado and !sPresionado and !dPresionado){
				personaje.quedarseQuieto()
			}
		})

		game.onTick(200, "animacion", {
            if (self.teclaSeleccionada(wPresionado) or self.teclaSeleccionada(sPresionado) or self.teclaSeleccionada(aPresionado) or self.teclaSeleccionada(dPresionado)) {
                self.cambiarFrame()
            }
        })

	}

	method teclaSeleccionada(tecla) {
    	if (!tecla) return false
    
    		const teclasPresionadas = [wPresionado, aPresionado, sPresionado, dPresionado]
        	.filter({ t => t })
        	.size()
    
		if(teclasPresionadas > 1) personaje.quedarseQuieto()

    	return teclasPresionadas == 1  // Solo se mueve si hay exactamente 1 tecla presionada
	}


	method cambiarFrame() {
        frameActual = (frameActual + 1) % maxFrames
        personaje.cambiarMovimiento()
    }
	
}