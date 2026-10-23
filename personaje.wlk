import debug.debug
import wollok.game.*

class Personaje {
	var property position = game.origin()

	method esArbusto() = false

	var property velocidad = caminar
	
	var property vivo = true

	var imagenEvento = null

	var property direccionMirando

	method sujeto() = 'Ghost'

	method image() {
    	if (imagenEvento != null) {
        	return imagenEvento
    	}
    	return "personajes/"+self.sujeto()+"/Quieto/"+direccionMirando.nombre()+".png"
	}
	
	method rutaImagenMovimiento() = "personajes/"+self.sujeto()+"/" + velocidad.nombre() + "/" + direccionMirando.nombre() + ".gif"

	method cambiarImagen(unaImagen) {
	    imagenEvento = unaImagen
	}
	
	method mirarHacia(direccion){
		direccionMirando = direccion
	}

	method quedarseQuieto(){
		imagenEvento = null
	}

	method caminar(){
		velocidad = caminar
	}

	method correr(){
		velocidad = correr
	}

	method mostrarPosicion() {
		debug.say(self, "Posición: " + self.position())
	}
}

class Direccion{
	method nombre()

	method puedeVer(soldado,miPos,otraPos)

	method posicionSiguiente(posicion)
}

object haciaArriba inherits Direccion{

	override method puedeVer(soldado,miPos, otroPos) {
        return miPos.y() < otroPos.y() and miPos.x() == otroPos.x()
    }

	override method nombre() = "Arriba"
	override method posicionSiguiente(posicion) = posicion.up(1)
}

object haciaAbajo inherits Direccion{
	override method puedeVer(soldado,miPos, otroPos) {
        return miPos.y() > otroPos.y() and miPos.x() == otroPos.x()
    }

	override method nombre() = "Abajo"
	override method posicionSiguiente(posicion) = posicion.down(1)
}

object haciaLaDerecha inherits Direccion{
	override method puedeVer(soldado,miPos, otroPos) {
        return miPos.x() < otroPos.x() and miPos.y() == otroPos.y()
    }

	override method nombre() = "Derecha"
	override method posicionSiguiente(posicion) = posicion.right(1)
}

object haciaLaIzquierda inherits Direccion{
	override method puedeVer(soldado,miPos, otroPos) {
        return miPos.x() > otroPos.x() and miPos.y() == otroPos.y()
    }

	override method nombre() = "Izquierda"
	override method posicionSiguiente(posicion) = posicion.left(1)
}


class Velocidad{
	method nombre()
	const property velocidad
}
object caminar inherits Velocidad(velocidad = 300){
	override method nombre() = 'Caminar'
}

object correr inherits Velocidad(velocidad = 150){
	override method nombre() = 'Correr'
}


