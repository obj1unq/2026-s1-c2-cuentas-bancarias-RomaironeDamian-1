import casa.*

object full {
  const calidadCompra = 5
  
  method calidadCompra() {
    return calidadCompra
  }

    method mantenimiento() {
    self.comprarViveres()
    self.realizarReparacioneSiSePuede()
  }

  method comprarViveres() {
    if (casa.casaEnOrden()) {
        casa.comprarViveres((100 - casa.porcentajeViveres()), calidadCompra)
    }
    else {
        casa.comprarViveres((40 - casa.porcentajeViveres()), calidadCompra)
        self.realizarReparacioneSiSePuede()
    }
  }

  method realizarReparacioneSiSePuede() {
    if (casa.reparacionesPendientes() and (casa.cuentaBancaria().saldo() >= casa.montoReparaciones())) {
        casa.realizarReparaciones() 
    }
  } 
}

object minimoEIndispensable {
  var calidadCompra = 1

  method calidadCompra() {
    return calidadCompra
  }

    method calidadCompra(_calidadCompra) {
    calidadCompra = _calidadCompra
  }

  method mantenimiento() {
    self.comprarViveres()
  }

  method comprarViveres() {
    if (not(casa.viveresSuficientes())) {
        casa.comprarViveres((40 - casa.porcentajeViveres()), calidadCompra)
    }
  }

}