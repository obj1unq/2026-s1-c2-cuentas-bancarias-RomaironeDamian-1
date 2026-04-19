object casa {
    var totalGastado = 0
    var cuentaBancaria = null
    var porcentajeViveres = 0
    var reparaciones = 0
    var montoReparaciones = 0
    var estrategia = null

    method comprarViveres(porcentajeAComprar, calidad) {
      self.validarViveres(porcentajeAComprar)
      self.gastar(porcentajeAComprar * calidad)
      porcentajeViveres = porcentajeViveres + porcentajeAComprar
    }

    method validarViveres(porcentajeAComprar) {
      if (100 < (porcentajeViveres + porcentajeAComprar)) {
        self.error("No se pueden comprar viveres que superen el 100% de los viveres de la casa")
      } 
    }

    method registrarReparacion(monto) {
      montoReparaciones = montoReparaciones + monto
      reparaciones = reparaciones + 1
    }

    method realizarReparaciones() {
      self.gastar(montoReparaciones)
      montoReparaciones = 0
      reparaciones = 0
    }

    method casaEnOrden() {
      return (not(self.reparacionesPendientes()) and self.viveresSuficientes())
    }

    method reparacionesPendientes() {
      return (reparaciones > 0)
    }

    method viveresSuficientes() {
      return(porcentajeViveres >= 40)
    }

    method porcentajeViveres(_porcentajeViveres) {
      porcentajeViveres = _porcentajeViveres
    }

    method porcentajeViveres() {
      return porcentajeViveres
    }

    method gastar(monto) {
        cuentaBancaria.extraer(monto)
        totalGastado = totalGastado + monto
    }

    method cambiarCuenta(cuenta) {
      cuentaBancaria = cuenta
    }
    
    method montoReparaciones() {
      return montoReparaciones
    }

    method cuentaBancaria() {
      return cuentaBancaria
    }

    method totalGastado() {
      return(totalGastado)
    }

    method estrategia(_estrategia) {
      estrategia = _estrategia
    }

    method cambiarMes() {
      estrategia.mantenimiento()
      totalGastado = 0
    }
}