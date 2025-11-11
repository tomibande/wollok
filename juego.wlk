import wollok.game.*
import jugador.*
import interfaz.*
import habitaciones.*

object juego {
    var property habitacionActual = habitacion1

    method iniciar() {
        game.title("Laberinto Tramposo")
        game.width(15)
        game.height(12)
        game.cellSize(50)

        self.configurarTeclas()
        self.cargarHabitacion(habitacion1)

        game.addVisual(jugador)
        game.addVisual(interfaz)

        game.start()
    }

    method configurarTeclas() {
        keyboard.up().onPressDo({ jugador.moverArriba() })
        keyboard.down().onPressDo({ jugador.moverAbajo() })
        keyboard.left().onPressDo({ jugador.moverIzquierda() })
        keyboard.right().onPressDo({ jugador.moverDerecha() })
        keyboard.r().onPressDo({ self.reiniciarJuego() })
    }

    method cargarHabitacion(habitacion) {
        self.limpiarHabitacion()
        habitacionActual = habitacion
        habitacion.cargar()
        jugador.volverAlInicio()
    }
    method limpiarHabitacion() {
        game.allVisuals().asList().forEach({ v => game.removeVisual(v) })
        game.addVisual(jugador)
        game.addVisual(interfaz)
    }
    method reiniciarJuego() {
        mensajes.ocultar()
        jugador.reiniciar()
        self.generarNuevoLaberinto()
        self.cargarHabitacion(habitacion1)
        mensajes.mostrar("¡Juego reiniciado!")
    }

    method generarNuevoLaberinto() {
        habitacion1.regenerar()
        habitacion2.regenerar()
        habitacion3.regenerar()
        habitacion4.regenerar()
        habitacionSalida.regenerar()
    }

    method cambiarHabitacion(nuevaHabitacion) {
        mensajes.mostrar("Entrando a nueva habitación...")
        game.schedule(500, { self.cargarHabitacion(nuevaHabitacion) })
    }

    method verificarVictoria() {
        mensajes.mostrarVictoria()
        game.schedule(5000, { 
            self.reiniciarJuego()
        })
    }

    method verificarDerrota() {
        mensajes.mostrarGameOver()
        game.schedule(2000, { self.reiniciarJuego() })
    }
}

    method verificarDerrota() {
        mensajes.mostrarGameOver()
        game.schedule(2000, { self.reiniciarJuego() })
    }
}
