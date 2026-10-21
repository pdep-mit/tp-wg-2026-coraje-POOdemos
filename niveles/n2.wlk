import wollok.game.*
import niveles.nivel.Nivel

object n2 inherits Nivel(mapa =  [
		[11,11,11,11,11,11,11,11,11,11,9,11,11,11,11],
		[19,8,0,0,0,1,1,1,14,0,0,2,0,0,20],
		[19,1,1,1,0,17,1,1,14,1,1,1,1,0,20],
		[19,2,0,0,0,1,10,1,14,0,0,0,0,0,20],
		[19,0,1,1,1,1,0,1,14,0,1,1,1,1,20],
		[19,0,0,0,0,0,0,1,0,0,17,17,17,17,20],
		[19,0,1,1,1,0,0,17,17,0,18,0,0,0,20],
		[19,11,12,11,11,0,11,11,11,1,1,1,1,0,20],
		[19,3,0,0,0,0,0,0,14,1,0,0,2,0,20],
		[19,0,0,0,0,0,0,0,14,1,10,1,1,1,20]
	],ancho = 15, alto = 10){
}    // Ref :
    // 1 = Barril
    // 2 = Enemigo
    // 3 = Ghost
    // 4 = Plano
    // 5 = Trampa
    // 6 = Meta
    // 7 = Juggernaut
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