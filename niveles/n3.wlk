import wollok.game.*
import niveles.nivel.Nivel

object n3 inherits Nivel(mapa =  [
		[21,0,0,0,0,0,0,0,0,0,11,0,0,0,0],
		[0,0,0,15,11,13,1,0,0,0,0,0,1,4,0],
		[0,0,12,11,0,0,0,0,0,2,0,0,0,0,0],
		[17,0,7,0,5,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,5,0,0,0,2,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,1,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,5,0,7,1,0,0,1,0],
		[0,3,0,0,0,5,0,11,12,13,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,17,0,0,0]
	],ancho = 15, alto = 10){
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
