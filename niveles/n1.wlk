import wollok.game.*
import niveles.nivel.Nivel

object n1 inherits Nivel(mapa =  [
		[0,0,1,10,0,0,0,0,0,0,0,0,0,22,1],
		[0,28,0,7,0,0,0,0,0,0,0,0,0,0,1],
		[17,0,0,15,1,1,13,11,12,1,0,1,14,0,1],
		[11,13,11,11,0,1,0,0,0,0,0,23,14,0,1],
		[0,0,0,0,0,0,0,15,11,12,12,13,16,0,1],
		[0,0,11,12,11,11,13,11,0,0,0,0,14,0,1],
		[0,17,0,0,0,0,0,0,23,1,0,0,14,0,1],
		[0,0,1,0,11,13,11,11,0,14,0,0,1,0,6],
		[0,3,1,0,0,0,0,0,0,14,23,0,0,0,1],
		[0,0,1,0,0,0,0,0,0,14,17,0,0,0,1]
	],ancho = 15, alto = 10){

    method fondo() = 'UI/Fondos/Exterior.png'
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