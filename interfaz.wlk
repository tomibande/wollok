import wollok.game.*

object interfaz {
    method position() = game.at(0, 11)

    method text() = "Vidas: " + jugador.vidas() + " | Llaves: " + jugador.llaves() + " | Presiona R para reiniciar"

    method textColor() = "FFFFFFFF"
}

object mensajes {
    var property mensaje = ""
    var property visible = false

    method position() = game.at(2, 6)

    method text() = mensaje

    method textColor() = "FFFF00FF"

    method mostrar(nuevoMensaje) {
        mensaje = nuevoMensaje
        if (!visible) {
            visible = true
            game.addVisual(self)
        }
        game.schedule(2000, { self.ocultar() })
    }

    method mostrarVictoria() {
        mensaje = "¡¡¡SALISTE!!! ¡GANASTE EL JUEGO!"
        if (!visible) {
            visible = true
            game.addVisual(self)
        }
    }

    method mostrarGameOver() {
        mensaje = "GAME OVER - Perdiste todas las vidas"
        if (!visible) {
            visible = true
            game.addVisual(self)
        }
    }

    method ocultar() {
        if (visible) {
            visible = false
            game.removeVisual(self)
        }
    }
}
