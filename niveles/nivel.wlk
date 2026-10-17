import juggernaut.*
import UI.vida.*
import UI.fondo.*
import UI.estadoGhost.estadoGhost
import UI.indicadorPlano.indicadorPlano
import elementos.plano.Plano
import elementos.barril.Barril
import elementos.trampa.Trampa
import elementos.pared.Pared
import elementos.meta.Meta
import soldado.*
import wollok.game.*
import personaje.*
import configuracionesJuego.config


class Nivel {
	const property ancho
	const property alto
	const property mapa
    

	var ghost = null

	// Ref :
	// 1 = Barril
	// 2 = Enemigo
	// 3 = Ghost
	// 4 = Plano
	// 5 = Trampa
	// 6 = Meta
	// 7 = Juggernaut

	

	method crear(personajeJugable) {
		ghost = personajeJugable
		game.addVisual(fondo)

		var y = alto+1
		mapa.forEach({ fila =>
			var x = 0
			fila.forEach({ tipo =>
				self.colocarObjeto(tipo, x, y)
				x += 1
			})
			y -= 1
		})
        indicadorPlano.reiniciar()
		estadoGhost.reiniciar()
		vida.reiniciar()

		game.addVisual(indicadorPlano)
		game.addVisual(estadoGhost)
		game.addVisual(vida)
	}

	method colocarObjeto(tipo, x, y) {
		if (tipo == 1) {
			const barril = new Barril()
			barril.position(game.at(x, y))
			game.addVisual(barril)
		}
		else if (tipo == 2) {
			const enemigo = new Soldado(direccionMirando = haciaLaIzquierda)
			enemigo.position(game.at(x, y))
			game.addVisual(enemigo)
			enemigo.patrullar()
			enemigo.vigilar(ghost)
		}
		else if (tipo == 3) {
			ghost.position(game.at(x, y))
			game.addVisual(ghost)
		}
		else if (tipo == 4) {
			const plano = new Plano()
			game.addVisual(plano)
			plano.position(game.at(x, y))
		}
		else if (tipo == 5) {
			const trampa = new Trampa()
			game.addVisual(trampa)
			trampa.position(game.at(x, y))
		}
		else if (tipo == 6) {
			const meta = new Meta()
			game.addVisual(meta)
			meta.position(game.at(x, y))
		}
		else if(tipo == 7){
			const juggernaut = new Juggernaut(direccionMirando = haciaLaDerecha)
			game.addVisual(juggernaut)
			juggernaut.position(game.at(x,y))
			juggernaut.patrullar()
			juggernaut.vigilar(ghost)
		}
	}


}