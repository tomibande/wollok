import wollok.game.*

class Puerta {
    var property position
    const property destino
    var property estaAbierta

    method image() = if (estaAbierta) "puerta_abierta.png" else "puerta_cerrada.png"

    method colisionarCon(jugador) {
        if (estaAbierta) {
            juego.cambiarHabitacion(destino)
        } else {
            if (jugador.usarLlave()) {
                self.abrir()
            }
        }
    }

    method abrir() {
        estaAbierta = true
        mensajes.mostrar("¡Puerta abierta!")
    }

    method regenerarPosicion() {
        position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0))
    }
}

class PuertaSalida {
    var property position

    method image() = "salida.png"

    method colisionarCon(jugador) {
        juego.verificarVictoria()
    }

    method regenerarPosicion() {
        position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0))
    }
}

class Trampa {
    var property position

    method image() = "trampa.png"

    method colisionarCon(jugador) {
        jugador.perderVida()
    }

    method regenerarPosicion() {
        position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0))
    }
}

class Llave {
    var property position
    var property recogido = false

    method image() = "llave.png"

    method colisionarCon(jugador) {
        if (!recogido) {
            jugador.agarrarLlave()
            recogido = true
            game.removeVisual(self)
        }
    }

    method regenerarPosicion() {
        position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0))
        recogido = false
    }
}

class PocionVida {
    var property position
    var property recogido = false

    method image() = "pocion.png"

    method colisionarCon(jugador) {
        if (!recogido) {
            jugador.ganarVida()
            recogido = true
            game.removeVisual(self)
        }
    }

    method regenerarPosicion() {
        position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0))
        recogido = false
    }
}
