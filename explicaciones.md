# Explicaciones teóricas

## Estructura del Juego
El juego tiene tres jerarquías: la de los personajes, que se mueven, la de los objetos del escenario, que están quietos, y la de los niveles. <br>
El juego tiene dos tipos de personajes con comportamientos muy distintos (el jugador, controlado por teclado, y los enemigos, que patrullan y vigilan), pero que comparten todo lo que implica ser "algo animado en la grilla": una posición, una dirección hacia la que mira, una velocidad, un estado vivo/muerto y un sprite que depende de todo eso. Esta logica se repite tambien en los niveles y objetos por eso aplicamos el concepto de herencia, para diferenciar los comportamientos generales de los especificos.   


## Herencia
### En personajes
Como ya se explicó, el polimorfismo es fundamental para modelar a los personajes y se usa en:
- ```Ghost inherits Personaje``` (ghost.wlk)
- ```Soldado inherits Personaje``` (soldado.wlk)
- ```Juggernaut inherits Soldado``` (juggernaut.wlk)

La relación es genuinamente "es-un": un Ghost es un Personaje, un Soldado es un Personaje y un Juggernaut es un Soldado. Lo que comparten no es poco, y está concentrado en Personaje. Cada subclase agrega solo lo que la hace distinta:
- Ghost: teclado (configurarTeclas), inventario (tienePlano, tieneLlave, tieneCuchillo), matar(), invisibilidad en arbustos.
- Soldado: patrullaje (patrullar, avanzar), visión (vigilar, detectoA, hayObjetoEnMedio), modoAlerta.
- Juggernaut: únicamente dos redefiniciones.
``` class Juggernaut inherits Soldado(){
    override method puedeMorir() = false
    override method sujeto() = 'Juggernaut'
} 
``` 
Las ventajas son muchas, principalmente se consigue que se reduzca el codigo y que lo que hay sea reutilizable, un mejor mantenimiento y menor costo a la hora de implementar nuevos enemigos.

### En objetos
Todo lo que está quieto en el tablero hereda de Objeto. La superclase define el comportamiento por defecto de un elemento inofensivo y atravesable, y cada subclase redefine solo lo que la distingue:
```
class Objeto {
  var property position = game.origin()
  method esArbusto() = false
  method nombreImagen() = "Objeto"
  method image() = "objetos/" + self.nombreImagen() + ".png"
  method traspasable() = true
  method hacerSonido() {}
  method esEnemigo() = false
}
```

Todos son elementos del tablero que se dibujan igual (```image()``` arma la ruta a partir de ```nombreImagen()```) y que el resto del código consulta con los mismos mensajes. Sin la superclase, cada clase tendría que repetir ```position```, ```image()```, ```esArbusto()```, ```esEnemigo()``` y ```hacerSonido()``` solo para que el movimiento y el Ghost puedan preguntarlos sin romperse. <br>
Las metas son una clase particular ya que cuenta con sus subclases que tambien usan herencia. ```MetaCerrada```, ```MetaFalsa``` y ```MetaFinal``` mantienen la imagen identica a la original pero le agregar algun comportamiento particular (algun requisito para atravesarla o ir a una habitacion nueva).

### En niveles
```n1``` a ```n5``` y ```nTrampa``` son objetos que heredan de la clase ```Nivel```. Cada nivel aporta dos cosas: su mapa (una matriz de números que Nivel.crearObjeto traduce a objetos) y el método fondo() (exterior en n1, interior en el resto). Todo lo demás vive una sola vez en Nivel: recorrer la matriz, crear y ubicar los objetos, instanciar soldados y juggernauts con su patrón, y agregar la interfaz. Tiene logica usar herencia porque los seis niveles hacen lo mismo pero con datos distintos. <br>
Por qué ```object``` y no ```Class```. Cada nivel existe una sola vez y config lo nombra directamente (```listaNiveles = [n1, n2, n3, n4, n5]```, ```config.irANivel(nTrampa)```). <br>
De esta forma conseguimos que diseñar niveles sea mucho mas simple ya que solo los diferencia los datos que contienen. 

## Polimorfismo
El código que usa los objetos no pregunta de qué tipo son, solo les manda mensajes y cada uno responde a su manera. <br> 
Esto aparece en varios niveles, uno de los usos mas importantes que se le dio a este concepto fue en el **movimiento de los personajes**. ```haciaArriba```, ```haciaAbajo```, ```haciaLaDerecha``` y ```haciaLaIzquierda``` entienden los mismos mensajes: ```nombre()```, ```posicionSiguiente(posicion)``` y ```puedeVer(...)```.
```
// movimiento.wlk
const nuevaPosicion = personaje.direccionMirando().posicionSiguiente(personaje.position())

// soldado.wlk
direccionMirando.puedeVer(self, self.position(), personaje.position())
```
Ningún método del juego tiene un ```if (direccion == arriba) ... else if (direccion == abajo) ....``` Cada dirección sabe cómo calcular su siguiente posición, cómo se llama (para armar el nombre del sprite) y qué significa "ver" hacia ella.
La gran ventaja es que el movimiento, el sprite y la visión del soldado funcionan con cualquier dirección sin condicionales. Es lo que permite que ```Soldado.siguienteDireccion()``` simplemente tome el próximo elemento de la lista del patrón y lo use. Lo mismo sucede con la velocidad.<br>
El polimorfismo tambien es fundamental para poder implementar la **relacion entre los personajes y objetos**, por ejemplo: cuando el jugador ataca, ```Ghost.matar()```:
```
if (enemigo.puedeMorir()){
    partida.camaraMuerte()
    enemigo.morir()
}
```
```Soldado.puedeMorir()``` devuelve ```true``` y ```Juggernaut.puedeMorir()``` devuelve ```false```. Ghost no sabe si tiene delante un Soldado o un Juggernaut, y no existe ningún ```if (enemigo.esJuggernaut())```. Si mañana agregamos un enemigo blindado o un jefe, redefine ```puedeMorir()``` y ```Ghost.matar()``` no se toca. <br>
El mismo patrón se repite en el escenario: ```Objeto.image()``` arma ```"objetos/" + self.nombreImagen() + ".png"``` y cada subclase redefine solo ```nombreImagen()``` (```"Barril"```, ```"Llave"```, ```"Trampa"...```). La superclase fija el esquema de la ruta y las subclases completan el dato que cambia. <br>
Sin dudas el uso mas util de polimorfismo en nuestro juego se encuentra en la metodo ```interactuarCon```, ```config.iniciarPartida()``` registra un único callback para todas las colisiones del Ghost:
```
game.onCollideDo(ghost, { elementoQueChoque => elementoQueChoque.interactuarCon(ghost) })

```
Luego cada elemento responde a su manera, por ejemplo: ```Meta``` pasa de nivel mientras que ```Trampa``` suena y le pide al personaje ```morir()```. <br>
El callback de config es una línea y no conoce ningún elemento. Sin polimorfismo habría una cadena de ```if (elemento.esLlave()) ... else if (elemento.esTrampa()) ...``` que crecería con cada objeto nuevo.
## Composicion
```Soldado``` y ```PatronMovimiento``` usan composición:
```
class Soldado inherits Personaje {
    const patronMovimiento
    ...
}

class PatronMovimiento {
    const property direcciones
    const property pasos
}
```

Cada soldado tiene su propio PatronMovimiento, creado en el mismo momento que él  y que no comparte con nadie. Su ciclo de vida está atado al del soldado: es parte de él. <br>
Por qué composición y no herencia. El recorrido es un rasgo que varía, no un tipo de soldado. En Nivel.crearObjeto hay seis variantes de enemigo:
- Soldado horizontal de 8 pasos, vertical de 8, horizontal de 4 y vertical de 4.
- Juggernaut horizontal de 8 y vertical de 4.

Con herencia serían 6 clases (o más cuando se agreguen patrones), todas casi iguales. Con composición son 2 clases de enemigo y 1 clase de datos, y las combinaciones se arman al crear el objeto. Ademas de esta forma cualquier tipo de enemigo puede tomar cualquier patron, para agregar nuevos patrones no habria que tocar codigo en soldado ya que desconoce el patron que le toca. <br>
```Nivel``` guarda una referencia a Ghost ```(var ghost = null)```, pero no lo crea ni lo posee. Quien lo crea es ```config```. El Ghost llega al nivel por parámetro ```(crear(personajeJugable))```. **Eso es asociación**, no composición: el Ghost no depende del Nivel, y de hecho sobrevive a él

# Diagramas

<img width="1616" height="1308" alt="image" src="https://github.com/user-attachments/assets/d7f6a591-391d-4b5d-a142-bd19ba8d8bf9" />

[link](https://www.planttext.com?text=dLNRRjGm47tFL-InbRfymAfQjPG2HImK5VLzDXbbftBiC7OYAF3lZA-Rf8W7dZ8-ZZrppbnyPHsm6tjLLOq2Q-jxP6iqF67ziwhhmLXoPBIO4ohJK0kjjsaoycc9iMbaUqyCklKG3ADsoQOUEjIt4shdbtPyGcVEplDEi7evoU-X8JWhjtdysuWjiCKl8wKp3VIaWQDjcD6RltFOxux6kX0owOai7HIAxGWrtYlG9Yy-AfZApitO74afludsLcDFNVJb6Em05kIM6AycYP3tPgAUF9s0GWSiqOVxvq3mCGUodyZOC4KMFRZ4foLnnscH3kr7xzJeWA6zoxJYFuqRGT4pyAD7IVd4pFLuC4eG4nNnAHl0iIIgC0YiMchm_kN6vQMPa9bQtEtgGJA1-nXqlTwSvVJV2afzTCR7cWXPwaRl3j_ah0VOHpagbPMOG3ydUwAEF3xa-WoweSF6cUibsflMN2ja1qkSn1q7vVX6_AtEnAmK0J-CNOUiOOnLzH-IbAlM2eSBIxMZ3RojiVx4gVqkVsqsiQpNOCfjbNCSm5Ey1TziTYzzR-lHGexiyy77kkvqjDTy66tAgpRzWV4kzFAgUTT9FaA3_60qjIzBegZnMggRL966iSrswDDenpQDzbU6Ve2qI96brHuTpCmRIGAqS-GjABjOomZ9laltfoKyvJyVPHuL5waDgog95THE9EPGfB900g4v4cdDaKHk3cMASomGdGCb-0NeASo1I6HnKQ7ZhpnTdgLReb6-5HOaJEfy8daMGls0RexX0L1XXFGWhFpGriwFfbIIljIxKDAonGWSGpjpD9ZpZ9qQKshQrrQS-FBwBFw_gBzVr3_AgUJXRDPN5x6joY-d5ldhNrAXaKxecz9ost0uRRrwjSjDivLv8e-dbeUXgahF-H_YMxHD8wkghb2tyiB-0G00)

