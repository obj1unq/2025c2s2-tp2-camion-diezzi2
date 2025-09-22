//CAMINOS

object ruta9 {
    const nivelDePeligrosidadLimite = 20

    method soportaElViaje(vehiculo) {
        return vehiculo.puedeCircularEnRutaDeNivel(nivelDePeligrosidadLimite)
    }
}

object caminosVecinales {
    var pesoMaximoPermitido = 700

    method pesoMaximoPermitido(_pesoMaximoPermitido) {
      pesoMaximoPermitido = _pesoMaximoPermitido
    }

    method soportaElViaje(vehiculo) {
        return vehiculo.pesoTotal() <= pesoMaximoPermitido
    }
}

// ALMACEN

object almacen {
    const property cosas = #{}

    method almacenar(unaCosa) {
        self.validarAlmacenamiento(unaCosa)
        cosas.add(unaCosa)
    }

    // validador

    method validarAlmacenamiento(unaCosa) {
		if (cosas.contains(unaCosa)) {
			self.error("La cosa que se está intentando almacenar ya se encuentra en el almacén")
		}
	}
}