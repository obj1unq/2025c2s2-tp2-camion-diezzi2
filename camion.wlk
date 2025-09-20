import cosas.*

object camion {
	const property cosas = #{}
	const pesoDeTara     = 1000
		
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}

	method todoPesoEsPar() {
		return cosas.all({cosa => cosa.peso() % 2 == 0})
	}

	method hayAlgoDePeso(pesoAConsultar) {
		return cosas.any({cosa => cosa.peso() == pesoAConsultar})
	}

	method pesoTotal() {
		return pesoDeTara + cosas.sum({cosa => cosa.peso()})
	}

	method estaExcedidoDePeso() {
		return self.pesoTotal() > 2500
	}

	method cargaConNivelDePeligrosidad(nivelPeligrosidadConsultado) {
		self.validarConsultaDePeligrosidad(nivelPeligrosidadConsultado)
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivelPeligrosidadConsultado})
	}

	method cargasConNivelPeligrosidadSuperiorA(nivelPeligrosidadConsultado) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivelPeligrosidadConsultado})
	}

	method cargasMasPeligrosasQue(cargaConsultada) {
		return self.cargasConNivelPeligrosidadSuperiorA(cargaConsultada.nivelPeligrosidad())
	}

	method puedeCircularEnRuta(peligrosidadMaxima) {
		return self.cargasConNivelPeligrosidadSuperiorA(peligrosidadMaxima) == #{} and not(self.estaExcedidoDePeso())
	}

	// validadores

	method validarCarga(unaCosa) {
		if (cosas.contains(unaCosa)) {
			self.error("La cosa que se está intentando cargar ya se encuentra en el camión")
		}
	}

	method validarDescarga(unaCosa) {
		if (not(cosas.contains(unaCosa))) {
			self.error("La cosa que se está intentando descargar no se encuentra en el camión")
		}
	}

	method validarConsultaDePeligrosidad(nivelPeligrosidadConsultado) {
		if (not(cosas.any({cosa => cosa.nivelPeligrosidad() == nivelPeligrosidadConsultado}))) {
			self.error("No existe una cosa en el camión con el nivel de peligrosidad consultado")
		}
	}
}
