import juggernaut.*
import UI.vida.*
import UI.fondo.*
import UI.estadoGhost.estadoGhost
import UI.indicadorPlano.indicadorPlano
import UI.indicadorLlave.indicadorLlave
import UI.indicadorCuchillo.indicadorCuchillo
import elementos.plano.Plano
import elementos.barril.Barril
import elementos.trampa.Trampa
import elementos.pared.Pared
import elementos.llave.Llave
import elementos.cuchillo.Cuchillo
import soldado.*
import wollok.game.*
import personaje.*
import configuracionesJuego.config
import elementos.meta.*
import elementos.arbusto.Arbusto


class Nivel {
	const property ancho
	const property alto
	const property mapa

	var ghost = null

	method crearObjeto(tipo) {
		if (tipo == 1) return new Barril()
		if (tipo == 2) return self.crearSoldado()
		if (tipo == 3) return ghost
		if (tipo == 4) return new Plano()
		if (tipo == 5) return new Trampa()
		if (tipo == 6) return new Meta()
		if (tipo == 7) return self.crearJuggernaut()
		if (tipo == 8) return new Llave()
		if (tipo == 9) return new MetaCerrada()
		if (tipo == 10) return new MetaFalsa()
		if (tipo == 11) return new Pared(imagen='Pared1')
		if (tipo == 12) return new Pared(imagen='Pared2')
		if (tipo == 13) return new Pared(imagen='Pared3')
		if (tipo == 14) return new Pared(imagen='Pared4')
		if (tipo == 15) return new Pared(imagen='Pared5')
		if (tipo == 16) return new Pared(imagen='Pared6')
		if (tipo == 17) return new Arbusto()
		if (tipo == 18) return new MetaFinal()
		if (tipo == 19) return new Cuchillo()
		return null
	}

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

        estadoGhost.reiniciar()
        vida.reiniciar()

        game.addVisual(indicadorPlano)
        game.addVisual(indicadorLlave)
		game.addVisual(indicadorCuchillo)
        game.addVisual(estadoGhost)
        game.addVisual(vida)
    }

	method colocarObjeto(tipo, x, y) {
		const objeto = self.crearObjeto(tipo)
		if (objeto != null) {
			objeto.position(game.at(x, y))
			game.addVisual(objeto)
		}
	}

	method crearSoldado() {
		const enemigo = new Soldado(direccionMirando = haciaLaIzquierda)
		enemigo.patrullar()
		enemigo.vigilar(ghost)
		return enemigo
	}

	method crearJuggernaut() {
		const juggernaut = new Juggernaut(direccionMirando = haciaLaDerecha)
		juggernaut.patrullar()
		juggernaut.vigilar(ghost)
		return juggernaut
	}


}