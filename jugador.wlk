import wollok.game.*
import interfaz.*

object jugador {
    var property position = game.at(1, 10)
    var property vidas = 3
    var property llaves = 0
    var property juegoActivo = true
    const posicionInicial = game.at(1, 10)

    method image() = "jugador.png"

    method moverArriba() {
        if (juegoActivo) self.moverA(position.up(1))
    }

    method moverAbajo() {
        if (juegoActivo) self.moverA(position.down(1))
    }

    method moverIzquierda() {
        if (juegoActivo) self.moverA(position.left(1))
    }

    method moverDerecha() {
        if (juegoActivo) self.moverA(position.right(1))
    }

    method moverA(nuevaPosicion) {
        if (self.posicionValida(nuevaPosicion)) {
            position = nuevaPosicion
            self.verificarColisiones()
        }
    }

    method posicionValida(pos) {
        return pos.x().between(0, game.width() - 1) &&
               pos.y().between(0, game.height() - 2)
    }

    method verificarColisiones() {
        const objetosEnPosicion = game.getObjectsIn(position)
        objetosEnPosicion.forEach({ objeto =>
            if (objeto != self && objeto.respondsTo("colisionarCon")) {
                objeto.colisionarCon(self)
            }
        })
    }

    method perderVida() {
        vidas = vidas - 1
        mensajes.mostrar("¡Perdiste una vida! Vidas: " + vidas)

        if (vidas <= 0) {
            vidas = 0
            juegoActivo = false
            self.verificarDerrota()
        } else {
            self.volverAlInicio()
        }
    }

    method ganarVida() {
        vidas = if (vidas + 1 > 5) 5 else vidas + 1
        mensajes.mostrar("¡Ganaste una vida! Vidas: " + vidas)
    }
    method agarrarLlave() {
        llaves += 1
        mensajes.mostrar("¡Llave obtenida! Llaves: " + llaves)
    }

    method usarLlave() {
        if (llaves > 0) {
            llaves -= 1
            return true
        }
        mensajes.mostrar("¡Necesitas una llave!")
        return false
    }

    method volverAlInicio() {
        position = posicionInicial
    }

    method reiniciar() {
        vidas = 3
        llaves = 0
        position = posicionInicial
        juegoActivo = true
    }

    method colisionarCon(otro) {
        // El jugador no hace nada cuando colisiona
    }
    method cambiarHabitacion(nuevaHabitacion) {
    
    }
  method verificarVictoria() {
        mensajes.mostrar("¡Ganaste!")
        // Añadir comportamiento adicional (pantalla final, reiniciar, etc.)
    }

    method verificarDerrota() {
        mensajes.mostrar("¡Perdiste!")
        // Añadir comportamiento adicional (pantalla final, reiniciar, etc.)
    }
}
