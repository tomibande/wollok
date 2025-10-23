# Laberinto Tramposo

Un juego de laberinto con trampas desarrollado en Wollok Game.

## Descripción

Navega a través de habitaciones llenas de trampas, recoge llaves para abrir puertas y encuentra la salida. ¡Cuidado con las trampas que te harán perder vidas!

## Características

- **5 Habitaciones diferentes**: Cada una con su propio diseño de trampas y objetos
- **Sistema de vidas**: Comienzas con 3 vidas, pierde todas y reiniciarás
- **Llaves y puertas**: Encuentra llaves para abrir puertas cerradas
- **Pociones de vida**: Recupera vida perdida
- **Regeneración aleatoria**: Presiona R para regenerar todo el laberinto con posiciones aleatorias

## Controles

- **Flechas direccionales**: Mover al jugador (↑ ↓ ← →)
- **R**: Reiniciar el juego y regenerar el laberinto

## Elementos del juego

- 🟦 **Jugador**: Tu personaje que debe encontrar la salida
- 🚪 **Puertas abiertas**: Verde, puedes pasar libremente
- 🚪 **Puertas cerradas**: Roja, necesitas una llave para abrirlas
- 🔑 **Llaves**: Recógelas para abrir puertas cerradas
- ⚗️ **Pociones**: Recuperan 1 vida (máximo 5 vidas)
- ⚠️ **Trampas**: Te hacen perder 1 vida y vuelves al inicio de la habitación
- 🏁 **Salida**: Llega aquí para ganar el juego

## Cómo jugar

1. Abre el proyecto en Wollok
2. Asegúrate de tener las imágenes necesarias en el directorio `assets/`
3. Ejecuta el archivo `program.wpgm`
4. Navega por las habitaciones evitando trampas
5. Recoge llaves para abrir puertas
6. Encuentra la salida final para ganar

## Estructura del código

- `program.wpgm`: Punto de entrada del juego
- `juego.wlk`: Lógica principal del juego y gestión de habitaciones
- `jugador.wlk`: Comportamiento del jugador
- `elementos.wlk`: Clases de elementos del juego (puertas, trampas, objetos)
- `habitaciones.wlk`: Definición de las 5 habitaciones
- `interfaz.wlk`: HUD y mensajes del juego

## Requisitos

- Wollok IDE o Wollok Game instalado
- Imágenes en formato PNG en el directorio `assets/` (ver `assets/README.md`)
