import datos.*
import utilidades.*
import wollok.game.*
import componentes.*
import tablero.*

// celda que representa una tecla en el teclado
class CeldaTecla inherits Celda{
	
	//contiene el estado de la tecla
	const celdaEstado = new CeldaEstado(id="estadoTecla"+id, position=self.position(), ruta="celdasTeclado/celdaTeclado")
	
	//contiene la letra que representa esta tecla
	const celdaLetra = new CeldaLetra(id="letraTecla"+id, letra=id, position = position)
	
	
	override method image(){}
	
	//dibuja todos los elementos de la tecla, y agrega su evento
	override method dibujar(){
		celdaEstado.dibujar()
		celdaLetra.dibujar()
		self.agregarEvento()
	}
	
	//agrega el evento correspondiente a la tecla
	method agregarEvento(){
		keyboard.letter(id).onPressDo({
			self.presionar()
		})
	}
	
	//realiza la accion deseada al momento de presionar esta tecla
	method presionar(){
		// manda mensaje a tablero para que se añada la letra
	}
	
	//resetea la tecla a su estado inicial
	override method resetear(){
		celdaEstado.inicial()
	}
}

object teclado inherits Componente{ 
 
	method initialize(){
		
		posicionesTeclas.lista().forEach({
			letra, posicion =>
			elementos.add(new CeldaTecla(id=letra, position=posicion))
		})
		
		self.reconocerTeclasDelTeclado()
	}
	
	// Reconoce las teclas del teclado, haciendo que se puedan utilizar
	method reconocerTeclasDelTeclado(){
		
		// Reconoce la primera hilera
		
		keyboard.q().onPressDo({ tablero.teclaPresionada("q") })
		keyboard.w().onPressDo({ tablero.teclaPresionada("w") })
		keyboard.e().onPressDo({ tablero.teclaPresionada("e") })
		keyboard.r().onPressDo({ tablero.teclaPresionada("r") })
		keyboard.t().onPressDo({ tablero.teclaPresionada("t") })
		keyboard.y().onPressDo({ tablero.teclaPresionada("y") })
		keyboard.u().onPressDo({ tablero.teclaPresionada("u") })
		keyboard.i().onPressDo({ tablero.teclaPresionada("i") })
		keyboard.o().onPressDo({ tablero.teclaPresionada("o") })
		keyboard.p().onPressDo({ tablero.teclaPresionada("p") })
		
		// Reconoce la segunda hilera
		
		keyboard.a().onPressDo({ tablero.teclaPresionada("a") })
		keyboard.s().onPressDo({ tablero.teclaPresionada("s") })
		keyboard.d().onPressDo({ tablero.teclaPresionada("d") })
		keyboard.f().onPressDo({ tablero.teclaPresionada("f") })
		keyboard.g().onPressDo({ tablero.teclaPresionada("g") })
		keyboard.h().onPressDo({ tablero.teclaPresionada("h") })
		keyboard.j().onPressDo({ tablero.teclaPresionada("j") })
		keyboard.k().onPressDo({ tablero.teclaPresionada("k") })
		keyboard.l().onPressDo({ tablero.teclaPresionada("l") })
		
		
	}
}















