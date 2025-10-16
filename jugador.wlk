import wollok.game.*

object jugador {
    var property position = game.at(1, 10)
    var property vidas = 3
    var property llaves = 0
    const posicionInicial = game.at(1, 10)

    method image() = "jugador.png"

    method moverArriba() {
        self.moverA(position.up(1))
    }

    method moverAbajo() {
        self.moverA(position.down(1))
    }

    method moverIzquierda() {
        self.moverA(position.left(1))
    }

    method moverDerecha() {
        self.moverA(position.right(1))
    }

    method moverA(nuevaPosicion) {
        if (self.posicionValida(nuevaPosicion)) {
            position = nuevaPosicion
            self.verificarColisiones()
        }
    }

    method posicionValida(pos) {
        return pos.x().between(0, game.width() - 1) &&
               pos.y().between(0, game.height() - 1)
    }

    method verificarColisiones() {
        const objetosEnPosicion = game.getObjectsIn(position)
        objetosEnPosicion.forEach({ objeto =>
            if (objeto != self && objeto != interfaz) {
                objeto.colisionarCon(self)
            }
        })
    }

    method perderVida() {
        vidas = (vidas - 1).max(0)
        mensajes.mostrar("¡Perdiste una vida! Vidas: " + vidas)

        if (vidas == 0) {
            juego.verificarDerrota()
        } else {
            self.volverAlInicio()
        }
    }

    method ganarVida() {
        vidas = (vidas + 1).min(5)
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
    }

    method colisionarCon(otro) {
        // El jugador no hace nada cuando colisiona
    }
}