import personaje.*
import movimientos.*

class Soldado inherits Personaje{
    var moviendo = false

    method patrullar(){
        
        var nuevaDireccion = self.direccionAleatoria()

        game.onTick(5000,"esperar",{ 
            nuevaDireccion = self.direccionAleatoria()
            if (moviendo) 
                    {moviendo = false}
                else moviendo = true
            
			}
		)

        game.onTick(300,"caminar",{
            if (moviendo){
                if(nuevaDireccion == "Izquierda"){
                    movimiento.mover(self, haciaLaIzquierda)
                }
                else if (nuevaDireccion == "Derecha"){
                    movimiento.mover(self, haciaLaDerecha)
                }
                else if (nuevaDireccion == "Abajo"){
                    movimiento.mover(self, haciaAbajo)
                }
                else if (nuevaDireccion == "Arriba"){
                    movimiento.mover(self, haciaArriba)
                }
            }

        })

        game.onTick(200, "animacion", {
            if (moviendo) {
                self.cambiarFrame()
            }
            else {
                self.quedarseQuieto()
            }
        })

    }

    method vigilar(personaje) {

        game.onTick(200, "observar", {
        self.detectoA(personaje)
        })
    }

    method direccionAleatoria() {
        const nuevaDireccion = ["Izquierda","Derecha","Arriba","Abajo"].anyOne()

        self.mirarHacia(nuevaDireccion)
        return nuevaDireccion
    }

    method campoDeVision() {
        const posSol = self.position()
        const oriSol = self.mirandoHacia()
        var mod = 1
        var cdv = []
        if(oriSol == "Derecha" or oriSol == "Izquierda"){
            if(oriSol == "Izquierda") mod = -1
            cdv = [posSol,
            posSol.right(mod*1), 
            posSol.right(mod*2),
            posSol.right(mod*3),
            posSol.right(mod*4),
            posSol.right(mod*5),
            posSol.right(mod*2).up(1),
            posSol.right(mod*3).up(1),
            posSol.right(mod*4).up(1),
            posSol.right(mod*5).up(1),
            posSol.right(mod*2).down(1),
            posSol.right(mod*3).down(1),
            posSol.right(mod*4).down(1),
            posSol.right(mod*5).down(1),
            posSol.right(mod*4).up(2),
            posSol.right(mod*5).up(2),
            posSol.right(mod*4).down(2),
            posSol.right(mod*5).down(2)]
    }
        else{
            if(oriSol == "Abajo") mod = -1
            cdv = [posSol,
            posSol.up(mod*2),
            posSol.up(mod*1), 
            posSol.up(mod*3),
            posSol.up(mod*4),
            posSol.up(mod*5),
            posSol.up(mod*2).right(1),
            posSol.up(mod*3).right(1),
            posSol.up(mod*4).right(1),
            posSol.up(mod*5).right(1),
            posSol.up(mod*2).left(1),
            posSol.up(mod*3).left(1),
            posSol.up(mod*4).left(1),
            posSol.up(mod*5).left(1),
            posSol.up(mod*4).right(2),
            posSol.up(mod*5).right(2),
            posSol.up(mod*4).left(2),
            posSol.up(mod*5).left(2)]
    }
    return cdv
}
    method detectoA(personaje) {
        const cdv = self.campoDeVision()
        if (cdv.contains(personaje.position())) self.modoAlerta() 
    }
}

object azar {
	
}