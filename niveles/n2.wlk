import wollok.game.*
import niveles.nivel.Nivel

object n2 inherits Nivel(mapa =  [

		[11,11,11,11,11,11,11,11,11,11,9,11,11,11,11],
		[19,8,0,24,25,14,27,27,14,0,0,2,0,0,20],
		[19,1,1,0,17,14,27,27,14,1,13,11,1,0,20],
		[19,24,0,0,0,15,13,10,14,0,0,0,0,0,20],
		[19,0,11,12,13,16,0,0,14,0,1,1,1,1,20],
		[19,0,0,0,0,0,0,1,25,0,17,25,25,17,20],
		[19,0,1,1,1,0,0,17,17,0,18,0,0,0,20],
		[19,11,12,11,11,0,11,11,11,12,13,12,1,0,20],
		[19,3,0,0,0,0,1,25,14,25,0,0,2,0,20],
		[19,0,0,0,0,0,25,25,14,25,10,1,1,1,20]

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
