import partida.*
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
import elementos.caja.Caja
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

	var cantidadSoldados = 0

	var ghost = null

	method crearObjeto(tipo) {
		if (tipo == 1) return new Barril()
		if (tipo == 2) return self.crearSoldado([haciaLaDerecha,haciaLaIzquierda],8)
		if (tipo == 3) return ghost
		if (tipo == 4) return new Plano()
		if (tipo == 5) return new Trampa()
		if (tipo == 6) return new Meta()
		if (tipo == 7) return self.crearJuggernaut([haciaLaDerecha,haciaLaIzquierda],8)
		if (tipo == 8) return new Llave()
		if (tipo == 9) return new MetaCerrada()
		if (tipo == 10 and partida.dificultad().metasFalsas()) return new MetaFalsa()
		if (tipo == 11) return new Pared(imagen='Pared1')
		if (tipo == 12) return new Pared(imagen='Pared2')
		if (tipo == 13) return new Pared(imagen='Pared3')
		if (tipo == 14) return new Pared(imagen='Pared4')
		if (tipo == 15) return new Pared(imagen='Pared5')
		if (tipo == 16) return new Pared(imagen='Pared6')
		if (tipo == 17) return new Arbusto()
		if (tipo == 18 and partida.dificultad().arma()) return new Cuchillo()
		if (tipo == 19) return new Pared(imagen='Pared7')   // nuevo: medianera izquierda
    	if (tipo == 20) return new Pared(imagen='Pared8')   // nuevo: medianera derecha
		if (tipo == 21) return new MetaFinal()
		if (tipo == 22) return self.crearSoldado([haciaArriba,haciaAbajo],8)
		if (tipo == 23) return self.crearSoldado([haciaLaDerecha,haciaLaIzquierda],4)
		if (tipo == 24) return self.crearSoldado([haciaArriba,haciaAbajo],4)
		if (tipo == 25) return new Caja()
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
		if (partida.dificultad().arma()) game.addVisual(indicadorCuchillo)
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

	method crearSoldado(direcciones,pasos) {
		const enemigo = new Soldado(id=cantidadSoldados,direccionMirando = haciaLaIzquierda,patronMovimiento = new PatronMovimiento(direcciones = direcciones, pasos = pasos))
		enemigo.patrullar()
		enemigo.vigilar(ghost)
		cantidadSoldados +=1
		return enemigo
	}

	method crearJuggernaut(direcciones,pasos) {
		const juggernaut = new Juggernaut(id=cantidadSoldados,direccionMirando = haciaLaDerecha,patronMovimiento = new PatronMovimiento(direcciones = direcciones, pasos = pasos))
		juggernaut.patrullar()
		juggernaut.vigilar(ghost)
		cantidadSoldados +=1
		return juggernaut
	}


}