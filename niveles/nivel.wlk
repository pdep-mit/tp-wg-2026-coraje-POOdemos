import UI.indicadorPlano.indicadorPlano
import elementos.plano.Plano
import elementos.barril.Barril
import elementos.trampa.Trampa
import elementos.pared.Pared
import soldado.*
import wollok.game.*
import personaje.*
import configuracionesJuego.config

class Nivel {
	const property ancho
	const property alto
	const property mapa
    

	var ghost = null
	const enemigos = []

	// Ref :
	// 1 = Barril
	// 2 = Enemigo
	// 3 = Ghost
	// 4 = Plano
	// 5 = Trampa

	

	method crear(personajeJugable) {
		ghost = personajeJugable
		indicadorPlano.reiniciar()       

		var y = alto - 1
		mapa.forEach({ fila =>
			var x = 0
			fila.forEach({ tipo =>
				self.colocarObjeto(tipo, x, y)
				x += 1
			})
			y -= 1
		})
        indicadorPlano.reiniciar()
		game.addVisual(indicadorPlano)
	}

	method colocarObjeto(tipo, x, y) {
		if (tipo == 1) {
			const barril = new Barril()
			game.addVisual(barril)
			barril.position(game.at(x, y))
		}
		else if (tipo == 2) {
			const enemigo = new Soldado(mirandoHacia = 'Abajo', sujeto = 'Soldado')
			game.addVisual(enemigo)
			enemigo.position(game.at(x, y))
			enemigo.patrullar()
			enemigo.vigilar(ghost)
			enemigos.add(enemigo)
		}
		else if (tipo == 3) {
			game.addVisual(ghost)
			ghost.position(game.at(x, y))
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
	}

	method enemigoEn(posicion){ // Devuelve el soldado que esta en la posicion
		return enemigos.findOrDefault ({soldado => soldado.position().x() == posicion.x() && soldado.position().y() == posicion.y()},null)
	}

}