import wollok.game.*

class Personaje {
	var property position = game.origin()
	
	var etapaCiclo = 0
	const maxetapaCiclo = 11

	var velocidad = 'Caminar'
	var mirandoHacia
	const sujeto


	method image() = "personajes/"+sujeto+"/"+velocidad+"/"+mirandoHacia+"/"+etapaCiclo+".png"

	
	method cambiarMovimiento(){
		if (etapaCiclo != maxetapaCiclo)
			etapaCiclo += 1
		else etapaCiclo = 1
	}

	method mirarHacia(direccion){
		mirandoHacia = direccion
	}

	method quedarseQuieto(){
		etapaCiclo = 0
	}

	method velocidadMovimiento(valor){
		velocidad = valor
	}
}


