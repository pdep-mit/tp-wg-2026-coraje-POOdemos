object debug {
    const activo = false

    method say(objeto, mensaje) {
        if (activo) {
            game.say(objeto, mensaje)
        }
    }
}