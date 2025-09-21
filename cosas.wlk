object knightRider {
	const peso              = 500
	const nivelPeligrosidad = 10
	const bultosUsados      = 1

	method bultosUsados() {
		return bultosUsados
	}

	method peso() {
		return peso
	}

	method nivelPeligrosidad() {
		return nivelPeligrosidad
	}

	method registrarEfectoDeAccidente() {}
}

object arenaAGranel {
	var property peso       = 100
	const nivelPeligrosidad = 1
	const bultosUsados      = 1

	method bultosUsados() {
		return bultosUsados
	}

	method nivelPeligrosidad() {
		return nivelPeligrosidad
	}

	method registrarEfectoDeAccidente() {
		peso += 20
	}
}

object bumblebee {
	const peso                  = 800
	const nivelPeligrosidadBase = 15
	var estaEnModoRobot         = true
	const bultosUsados          = 2

	method bultosUsados() {
		return bultosUsados
	}

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

	method registrarEfectoDeAccidente() {
		estaEnModoRobot = not(estaEnModoRobot)
	}
}

object paqueteDeLadrillos {
	const pesoPorLadrillo   = 2
	var cantidadDeLadrillos = 50
	const nivelPeligrosidad = 2

	method bultosUsados() {
		return 3.min((cantidadDeLadrillos / 100).roundUp(0))
	}

	method cantidadDeLadrillos(_cantidadDeLadrillos) {
		cantidadDeLadrillos = _cantidadDeLadrillos
	}

	method peso() {
		return pesoPorLadrillo * cantidadDeLadrillos
	}

	method nivelPeligrosidad() {
		return nivelPeligrosidad
	}

	method registrarEfectoDeAccidente() {
		cantidadDeLadrillos = 0.max(cantidadDeLadrillos - 12)
	}
}

object bateriaAntiaerea {
	const pesoBase   = 200
	var tieneMisiles = true

	method bultosUsados() {
		return if (tieneMisiles) {
			2
		}
		else 1
	}

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

	method registrarEfectoDeAccidente() {
		tieneMisiles = false
	}
}

object residuosRadiactivos {
	var property peso       = 70
	const nivelPeligrosidad = 200
	const bultosUsados      = 1

	method bultosUsados() {
		return bultosUsados
	}

	method nivelPeligrosidad() {
		return nivelPeligrosidad
	}

	method registrarEfectoDeAccidente() {
		peso += 15
	}
}

object contenedorPortuario {
	var pesoBase        = 100
	var cosasContenidas = #{}
	const bultoPropio   = 1

	method bultosUsados() {
		return bultoPropio + cosasContenidas.sum({cosa => cosa.bultosUsados()})
	}

	method cargaMasPeligrosa() {
		return cosasContenidas.max({cosa => cosa.nivelPeligrosidad()})
	}

	method cosasContenidas(_cosasContenidas) {
		cosasContenidas = _cosasContenidas
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

	method registrarEfectoDeAccidente() {
		cosasContenidas.forEach({cosa => cosa.registrarEfectoDeAccidente()})
	}
}

object embalajeDeSeguridad {
	var cosaEmbalada   = residuosRadiactivos
	const bultosUsados = 2

	method bultosUsados() {
		return bultosUsados
	}

	method cosaEmbalada(_cosaEmbalada) {
		cosaEmbalada = _cosaEmbalada
	}

	method peso() {
		return cosaEmbalada.peso()
	}

	method nivelPeligrosidad() {
		return cosaEmbalada.nivelPeligrosidad() / 2
	}

	method registrarEfectoDeAccidente() {}
}