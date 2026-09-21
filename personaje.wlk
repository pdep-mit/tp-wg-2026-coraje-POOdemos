import wollok.game.*

class Personaje {
	var property position = game.origin()
	var frameActual = 0
    const maxFrames = 4

	var etapaCiclo = 0
	const maxetapaCiclo = 11

	var velocidad = 'Caminar'
	var property mirandoHacia
	const sujeto


	method image() = "personajes/"+sujeto+"/"+velocidad+"/"+mirandoHacia+"/"+etapaCiclo+".png"


	method mirarHacia(direccion){
		mirandoHacia = direccion
	}

	method quedarseQuieto(){
		etapaCiclo = 0
	}

	method velocidadMovimiento(valor){
		velocidad = valor
	}

	method cambiarFrame() {
        frameActual = (frameActual + 1) % maxFrames
        
		if (etapaCiclo != maxetapaCiclo)
			etapaCiclo += 1
		else etapaCiclo = 1
    }

	method modoAlerta() {
		game.say(self, "¡Te vi!")
	}

}


