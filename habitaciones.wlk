import wollok.game.*
class Habitacion {
    const property puertas = []
    const property trampas = []
    const property objetos = []

    method cargar() {
        puertas.forEach({ puerta => game.addVisual(puerta) })
        trampas.forEach({ trampa => game.addVisual(trampa) })
        objetos.forEach({ objeto => game.addVisual(objeto) })
    }

    method regenerar() {
        puertas.forEach({ puerta => puerta.regenerarPosicion() })
        trampas.forEach({ trampa => trampa.regenerarPosicion() })
        objetos.forEach({ objeto => objeto.regenerarPosicion() })
    }
}
object habitacion1 {
    const puertas = [
        new Puerta(position = game.at(7, 6), destino = habitacion2, estaAbierta = true),
        new Puerta(position = game.at(13, 3), destino = habitacion3, estaAbierta = false)
    ]
    const trampas = [
        new Trampa(position = game.at(4, 5)),
        new Trampa(position = game.at(8, 8)),
        new Trampa(position = game.at(11, 2))
    ]
    const objetos = [
        new Llave(position = game.at(3, 3)),
        new PocionVida(position = game.at(10, 9))
    ]

    method cargar() {
        puertas.forEach({ puerta => game.addVisual(puerta) })
        trampas.forEach({ trampa => game.addVisual(trampa) })
        objetos.forEach({ objeto => if (!objeto.recogido()) game.addVisual(objeto) })
    }

    method regenerar() {
        puertas.clear()
        puertas.add(new Puerta(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0)), destino = habitacion2, estaAbierta = true))
        puertas.add(new Puerta(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0)), destino = habitacion3, estaAbierta = false))

        trampas.clear()
        3.times({ i => trampas.add(new Trampa(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0)))) })

        objetos.clear()
        objetos.add(new Llave(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0))))
        objetos.add(new PocionVida(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0))))
    }
}

object habitacion2 {
    const puertas = [
        new Puerta(position = game.at(2, 2), destino = habitacion1, estaAbierta = true),
        new Puerta(position = game.at(12, 8), destino = habitacion4, estaAbierta = false)
    ]
    const trampas = [
        new Trampa(position = game.at(5, 6)),
        new Trampa(position = game.at(9, 3)),
        new Trampa(position = game.at(7, 9))
    ]
    const objetos = [
        new Llave(position = game.at(6, 5)),
        new PocionVida(position = game.at(11, 4))
    ]

    method cargar() {
        puertas.forEach({ puerta => game.addVisual(puerta) })
        trampas.forEach({ trampa => game.addVisual(trampa) })
        objetos.forEach({ objeto => if (!objeto.recogido()) game.addVisual(objeto) })
    }

    method regenerar() {
        puertas.clear()
        puertas.add(new Puerta(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0)), destino = habitacion1, estaAbierta = true))
        puertas.add(new Puerta(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0)), destino = habitacion4, estaAbierta = false))

        trampas.clear()
        3.times({ i => trampas.add(new Trampa(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0)))) })

        objetos.clear()
        objetos.add(new Llave(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0))))
        objetos.add(new PocionVida(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0))))
    }
}

object habitacion3 {
    const puertas = [
        new Puerta(position = game.at(3, 7), destino = habitacion1, estaAbierta = true),
        new Puerta(position = game.at(11, 5), destino = habitacionSalida, estaAbierta = false)
    ]
    const trampas = [
        new Trampa(position = game.at(6, 8)),
        new Trampa(position = game.at(8, 4)),
        new Trampa(position = game.at(4, 3)),
        new Trampa(position = game.at(10, 7))
    ]
    const objetos = [
        new Llave(position = game.at(7, 6)),
        new PocionVida(position = game.at(5, 2))
    ]

    method cargar() {
        puertas.forEach({ puerta => game.addVisual(puerta) })
        trampas.forEach({ trampa => game.addVisual(trampa) })
        objetos.forEach({ objeto => if (!objeto.recogido()) game.addVisual(objeto) })
    }

    method regenerar() {
        puertas.clear()
        puertas.add(new Puerta(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0)), destino = habitacion1, estaAbierta = true))
        puertas.add(new Puerta(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0)), destino = habitacionSalida, estaAbierta = false))

        trampas.clear()
        4.times({ i => trampas.add(new Trampa(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0)))) })

        objetos.clear()
        objetos.add(new Llave(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0))))
        objetos.add(new PocionVida(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0))))
    }
}

object habitacion4 {
    const puertas = [
        new Puerta(position = game.at(4, 9), destino = habitacion2, estaAbierta = true),
        new Puerta(position = game.at(10, 3), destino = habitacionSalida, estaAbierta = false)
    ]
    const trampas = [
        new Trampa(position = game.at(7, 7)),
        new Trampa(position = game.at(5, 4)),
        new Trampa(position = game.at(9, 8))
    ]
    const objetos = [
        new Llave(position = game.at(8, 5)),
        new Llave(position = game.at(3, 3))
    ]

    method cargar() {
        puertas.forEach({ puerta => game.addVisual(puerta) })
        trampas.forEach({ trampa => game.addVisual(trampa) })
        objetos.forEach({ objeto => if (!objeto.recogido()) game.addVisual(objeto) })
    }

    method regenerar() {
        puertas.clear()
        puertas.add(new Puerta(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0)), destino = habitacion2, estaAbierta = true))
        puertas.add(new Puerta(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0)), destino = habitacionSalida, estaAbierta = false))

        trampas.clear()
        3.times({ i => trampas.add(new Trampa(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0)))) })

        objetos.clear()
        objetos.add(new Llave(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0))))
        objetos.add(new Llave(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0))))
    }
}

object habitacionSalida {
    const puertas = [
        new PuertaSalida(position = game.at(7, 5))
    ]
    const trampas = [
        new Trampa(position = game.at(5, 8)),
        new Trampa(position = game.at(9, 8)),
        new Trampa(position = game.at(5, 3)),
        new Trampa(position = game.at(9, 3))
    ]
    const objetos = []

    method cargar() {
        puertas.forEach({ puerta => game.addVisual(puerta) })
        trampas.forEach({ trampa => game.addVisual(trampa) })
    }

    method regenerar() {
        puertas.clear()
        puertas.add(new PuertaSalida(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0))))

        trampas.clear()
        4.times({ i => trampas.add(new Trampa(position = game.at(1.randomUpTo(14).truncate(0), 1.randomUpTo(11).truncate(0)))) })
    }
}