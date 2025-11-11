import wollok.game.*
import interfaz.*

class Puerta {
    var property position
    const property destino
    var property estaAbierta

    method image() = if (estaAbierta) "puerta_abierta.png" else "puerta_cerrada.png"

    method colisionarCon(jugador) {
        if (estaAbierta) {
            jugador.cambiarHabitacion(destino)
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
}

class PuertaSalida {
    var property position

    method image() = "salida.png"

    method colisionarCon(jugador) {
        jugador.ganar()
    }
}

class Trampa {
    var property position

    method image() = "trampa.png"

    method colisionarCon(jugador) {
        jugador.perderVida()
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

    method regenerar() {
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

    method regenerar() {
        recogido = false
    }
}
