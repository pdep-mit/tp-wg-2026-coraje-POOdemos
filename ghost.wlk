import UI.indicadorPlano.indicadorPlano
import personaje.*
import movimientos.*
import partida.*

class Ghost inherits Personaje{
    var wPresionado = false
    var sPresionado = false
    var aPresionado = false
    var dPresionado = false
    var shiftPresionado = false

		var property tienePlano = false
		var property vivo = true.

    method configurarTeclas() {
		
		// Configurar las teclas
		keyboard.w().onPressDo({ wPresionado = true; self.mirarHacia('Arriba') })
		keyboard.w().onReleaseDo({ wPresionado = false })
		
		keyboard.s().onPressDo({ sPresionado = true; self.mirarHacia('Abajo') })
		keyboard.s().onReleaseDo({ sPresionado = false })
		
		keyboard.a().onPressDo({ aPresionado = true; self.mirarHacia('Izquierda') })
		keyboard.a().onReleaseDo({ aPresionado = false })
		
		keyboard.d().onPressDo({ dPresionado = true; self.mirarHacia('Derecha')  })
		keyboard.d().onReleaseDo({ dPresionado = false })

		keyboard.shift().onPressDo({ shiftPresionado = true; self.velocidadMovimiento('Correr') })
		keyboard.shift().onReleaseDo({ shiftPresionado = false; self.velocidadMovimiento('Caminar') })
		
		const teclas = [wPresionado,aPresionado,sPresionado,dPresionado]

		// Movimiento continuo
		partida.cadaMs(
			300,"caminar",{ 

				if (self.teclaSeleccionada(wPresionado) and !shiftPresionado) movimiento.mover(self, haciaArriba)
				else if (self.teclaSeleccionada(sPresionado) and !shiftPresionado) movimiento.mover(self, haciaAbajo)
				else if (self.teclaSeleccionada(aPresionado) and !shiftPresionado) movimiento.mover(self, haciaLaIzquierda)
				else if (self.teclaSeleccionada(dPresionado) and !shiftPresionado) movimiento.mover(self, haciaLaDerecha)
			}
		)

		partida.cadaMs(
			150,"correr",{ 
				if (self.teclaSeleccionada(wPresionado) and shiftPresionado) movimiento.mover(self, haciaArriba)
				else if (self.teclaSeleccionada(sPresionado) and shiftPresionado) movimiento.mover(self, haciaAbajo)
				else if (self.teclaSeleccionada(aPresionado) and shiftPresionado) movimiento.mover(self, haciaLaIzquierda)
				else if (self.teclaSeleccionada(dPresionado) and shiftPresionado) movimiento.mover(self, haciaLaDerecha)
			}
		)


		partida.cadaMs(200, "animacion", {
            if (self.teclaSeleccionada(wPresionado) or self.teclaSeleccionada(sPresionado) or self.teclaSeleccionada(aPresionado) or self.teclaSeleccionada(dPresionado)) {
                self.cambiarFrame()
            }
			else{
				self.quedarseQuieto()
			}
        })
		partida.cadaMs(300, "mostrarPosicion", {
				self.mostrarPosicion()
		})
	}

	method teclaSeleccionada(tecla) {
    	if (!tecla) return false
    
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
	  	method morir() {
  		if (vivo) {
  			vivo = false
  			partida.terminarConDerrota(self)
  		}
  	}
}