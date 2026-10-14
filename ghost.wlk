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

		keyboard.shift().onPressDo({ shiftPresionado = true; self.velocidadMovimiento('Correr') })
		keyboard.shift().onReleaseDo({ shiftPresionado = false; self.velocidadMovimiento('Caminar') })
		

		keyboard.z().onPressDo({movimiento.matar(self)})
		const teclas = [wPresionado,aPresionado,sPresionado,dPresionado]

		// Movimiento continuo
		partida.cadaMs(
			300,"caminar",{ 

				if (self.teclaMovimientoSeleccionada() and !shiftPresionado) movimiento.mover(self)
			}
		)

		partida.cadaMs(
			150,"correr",{ 
				if (self.teclaMovimientoSeleccionada() and shiftPresionado) movimiento.mover(self)
			}
		)


		partida.cadaMs(200, "animacionGhost", {
            if (self.teclaMovimientoSeleccionada()) {
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

	method morir() {
  		if (vivo) {
  			vivo = false
  			partida.terminarConDerrota(self)
  		}
		self.cambiarImagen('personajes/Ghost/Morir.png')
  	}
}