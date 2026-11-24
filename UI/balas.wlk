
import UI.cargador.cargador

object textoBalas {
    var property position = game.at(4, 0)
    
    // Wollok llama a text() constantemente; toString() convierte el número a texto
    method text() = "x " + cargador.balas().toString()
    
    // Opcional: color del texto en formato hexadecimal RGBA (blanco por defecto)
    method textColor() {
        if (cargador.balas() == 0) {
            return "FF0000FF" // Rojo
        } else {
            return "FFFFFFFF" // Blanco
        }
    }
}