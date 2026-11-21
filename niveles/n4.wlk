import wollok.game.*
import niveles.nivel.Nivel

object n4 inherits Nivel(mapa =  [
		[27,27,27,27,27,27,27,27,27,27,27,27,27,27,27],
		[27,27,27,27,27,27,27,27,27,27,27,27,27,27,27],
		[27,27,27,27,27,27,27,27,27,27,27,27,27,27,27],
		[27,27,27,27,27,25,25,25,25,25,27,27,27,27,27],
		[27,27,27,27,27,25,5,5,5,25,27,27,27,27,27],
		[27,27,27,27,27,25,5,5,5,25,27,27,27,27,27],
		[27,27,27,27,27,25,1,3,1,25,27,27,27,27,27],
		[27,27,27,27,27,27,25,0,25,27,27,27,27,27,27],
		[27,27,27,27,27,27,27,1,27,27,27,27,27,27,27],
		[27,27,27,27,27,27,27,27,27,27,27,27,27,27,27]
	],ancho = 15, alto = 10){
    
    method fondo() = 'UI/Fondos/Interior.png'
}    
    // Ref :
    // 1 = Barril
    // 2 = Enemigo patron horizontal con 8 bloques
    // 3 = Ghost
    // 4 = Plano
    // 5 = Trampa
    // 6 = Meta
    // 7 = Juggernaut patron horizontal con 8 bloques
    // 8 = Llave
    // 9 = Meta Cerrada
    // 10 = Nivel trampa
    // 11 = Pared 1
    // 12 = Pared 2
    // 13 = Pared 3
    // 14 = Pared 4
    // 15 = Pared 5
    // 16 = Pared 6
    // 17 = Arbusto
    // 18 = Cuchillo
    // 19 = pared izquierda
    // 20 = pared derecha
    // 21 = Meta final
    // 22 = Enemigo patron vertical 8 bloques
    // 23 = Enemigo patron horizontal 4 bloques
    // 24 = Enemigo patron vertical 4 bloques
    // 25 = Caja
    // 26 = Juggernaut patron vertical 4 bloques
    // 27 = Fondo negro