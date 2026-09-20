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


    method direccionAleatoria () {
        const nuevaDireccion = ["Izquierda","Derecha","Arriba","Abajo"].anyOne()

        self.mirarHacia(nuevaDireccion)
        return nuevaDireccion
    }
}

object azar {
	
}