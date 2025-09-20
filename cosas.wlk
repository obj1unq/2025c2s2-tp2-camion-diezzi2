object knightRider {
	const peso              = 500
	const nivelPeligrosidad = 10

	method peso() {
		return peso
	}

	method nivelPeligrosidad() {
		return nivelPeligrosidad
	}
}

object arenaAGranel {
	var property peso       = 100
	const nivelPeligrosidad = 1

	method nivelPeligrosidad() {
		return nivelPeligrosidad
	}
}

object bumblebee {
	const peso                  = 800
	const nivelPeligrosidadBase = 15
	var estaEnModoRobot        = true

	method estaEnModoRobot(_estaEnModoRobot) {
		estaEnModoRobot = _estaEnModoRobot
	}

	method peso() {
		return peso
	}

	method nivelPeligrosidad() {
		return if (estaEnModoRobot) {
			nivelPeligrosidadBase * 2
		}
		else nivelPeligrosidadBase
	}
}

object paqueteDeLadrillos {
	const pesoPorLadrillo   = 2
	var cantidadDeLadrillos = 50
	const nivelPeligrosidad = 2

	method cantidadDeLadrillos(_cantidadDeLadrillos) {
		cantidadDeLadrillos = _cantidadDeLadrillos
	}

	method peso() {
		return pesoPorLadrillo * cantidadDeLadrillos
	}

	method nivelPeligrosidad() {
		return nivelPeligrosidad
	}
}

object bateriaAntiaerea {
	const pesoBase   = 200
	var tieneMisiles = true

	method tieneMisiles(_tieneMisiles) {
		tieneMisiles = _tieneMisiles
	}

	method peso() {
		return if (tieneMisiles) {
			pesoBase + 100
		}
		else pesoBase
	}

	method nivelPeligrosidad() {
		return if (tieneMisiles) {
			100
		}
		else 0
	}
}

object residuosRadiactivos {
	var property peso       = 70
	const nivelPeligrosidad = 200

	method nivelPeligrosidad() {
		return nivelPeligrosidad
	}  
}

object contenedorPortuario {
	var pesoBase        = 100
	var cosasContenidas = #{}

	method cargaMasPeligrosa() {
		return cosasContenidas.max({cosa => cosa.nivelPeligrosidad()})
	}

	method peso() {
		return pesoBase + cosasContenidas.sum({cosa => cosa.peso()})
	}

	method nivelPeligrosidad() {
		return if (cosasContenidas.isEmpty()) {
			0
		} 
		else self.cargaMasPeligrosa().nivelPeligrosidad()
	}
}

object embalajeDeSeguridad {
	var cosaEmbalada = residuosRadiactivos

	method peso() {
		return cosaEmbalada.peso()
	}

	method nivelPeligrosidad() {
		return cosaEmbalada.nivelPeligrosidad() / 2
	}
}