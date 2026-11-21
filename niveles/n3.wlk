import wollok.game.*
import niveles.nivel.Nivel

object n3 inherits Nivel(mapa =  [
		[13,21,7,0,0,0,0,0,26,0,14,0,4,25,27],
		[0,24,0,15,11,13,1,0,0,0,0,0,1,25,27],
		[0,0,12,11,0,0,0,0,0,2,0,0,0,25,27],
		[0,0,0,1,5,0,11,12,0,0,25,5,25,25,27],
		[0,0,0,0,0,0,0,0,0,0,0,2,17,25,27],
		[11,11,16,0,0,13,12,11,13,0,0,0,0,25,27],
		[27,27,14,0,1,5,5,0,0,0,0,0,0,25,27],
		[27,27,14,0,0,0,0,0,0,7,1,0,0,25,27],
		[27,27,14,3,0,5,15,11,12,13,13,11,12,11,27],
		[27,27,14,0,0,0,15,27,27,27,27,27,27,27,27]
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