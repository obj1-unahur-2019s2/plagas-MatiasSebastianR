class Hogar {
	
	var property nivelMugre
	var property confort
	
	method esBuena() { return nivelMugre <= confort/2 }

	method ataquePlaga(plaga) { return nivelMugre + plaga.nivelDeDanio() }
}

class Huerta {
	
	var property capacidadDeProduccion
	
	method esBuena() { return capacidadDeProduccion > nivelHuerta.nivel() }
	
	method ataquePlaga(plaga) { 
		return capacidadDeProduccion - plaga.nivelDeDanio()*0.1 and 
		return if (plaga.transmiteEnfermedades()) { capacidadDeProduccion - 10 }
		else { }
	}
}

object nivelHuerta {
	var property nivel
}

class Mascota {
	
	var property nivelDeSalud
	
	method esBuena() { return nivelDeSalud >= 250 }
	method ataquePlaga(plaga) {
		return if(plaga.transmiteEnfermedades()) { nivelDeSalud - plaga.nivelDeDanio() }
		else { }
	}
}

class Plaga {
	var poblacion = 0
	
	method transmiteEnfermedades() { return poblacion >= 10
	}
	method plagaAtaca() { return poblacion*1.1 }
}

class PlagaCucarachas inherits Plaga {
	
	var property pesoPromedio
	
	method nivelDeDanio() { return poblacion/2 }
	
	override method transmiteEnfermedades() {
		return super() and pesoPromedio >= 10
	}
	
	override method plagaAtaca() {
		return super() and pesoPromedio + 2
	}
}

class PlagaMosquitos inherits Plaga {
	
	method nivelDeDanio() { return poblacion }
	
	override method transmiteEnfermedades() {
		return super() and poblacion % 3 == 0
	}
}

class PlagaPulgas inherits Plaga {
	
	method nivelDeDanio() { return poblacion*2}
}

class PlagaGarrapatas inherits PlagaPulgas {
	
	override method plagaAtaca() {
		return poblacion*1.20
	}
}

// para las plagas de garrapatas: la población aumenta un 20%, en lugar del aumento de 10%. 
// Este es el aspecto en el que las plagas de garrapatas se distinguen de las de pulgas.



//Efectos de un ataque sobre las plagas
//
//Cuando una plaga ataca a un elemento, también se produce un efecto sobre la plaga.
//
//Este efecto consiste en que la población de la plaga aumenta un 10%. Hay dos casos particulares
//
//    para las plagas de cucarachas: además del aumento de población, el peso promedio aumenta en 2 gramos.
//
//
//Requerimiento
//Agregar al modelo los efectos descriptos.
//
//Consejo
//Agregar un método en las plagas que implemente el ataque a un elemento, que haga dos cosas:
//
//    aplicar los efectos sobre la plaga, y
//    decirle al elemento que recibe un ataque usando lo que se agregó en la etapa anterior.
