object cuentaCorriente {
    var saldo = 0

    method deposito(monto) {
        saldo = saldo + monto
    }

    method extraer(monto) {
        saldo = saldo - monto
    }

    method saldo(_saldo) {
      saldo = _saldo
    }

    method saldo() {
      return (saldo)
    }
}

object cuentaConGastos {
  var saldo = 0
  var costoOperacion = 0

  method deposito(monto) {
    self.validarDeposito(monto)
    saldo = saldo + monto - costoOperacion
  }

  method extraer(monto) {
    saldo = saldo - monto
  }

  method validarDeposito(monto) {
    if (monto < costoOperacion) {
        self.error("Saldo insuficiente")
    }
  }

  method costoOperacion(nuevoCosto) {
    costoOperacion = nuevoCosto
  }

    method saldo() {
      return (saldo)
    }

    method saldo(_saldo) {
      saldo = _saldo
    }
}

object cuentaCombinada {
    var cuentaPrimaria = cuentaCorriente
    var cuentaSecundaria = cuentaConGastos

    method cuentaPrimaria(_cuentaPrimaria) {
      cuentaPrimaria = _cuentaPrimaria
    }

    method cuentaSecundaria(_cuentaSecundaria) {
      cuentaSecundaria = _cuentaSecundaria
    }

    method deposito(monto) {
      cuentaPrimaria.deposito(monto)
    }

    method saldo() {
      return(0.max(cuentaPrimaria.saldo()) + 0.max(cuentaSecundaria.saldo()))
    }

    method extraer(monto) {
        self.validarExtraccion(monto)
      if (self.laPrimeraCubre(monto)) {
        cuentaPrimaria.extraer(monto)
      }
      else {
        cuentaSecundaria.extraer(monto - 0.max(cuentaPrimaria.saldo()))
        cuentaPrimaria.extraer(0.max(cuentaPrimaria.saldo()))
      }
    }

    method validarExtraccion(monto) {
      if (self.saldo() < monto) {
        self.error("segui participando")
      }
    }

    method laPrimeraCubre(monto) {
      return(monto < cuentaPrimaria.saldo())
    }

    method laSecundariaCubre(monto) {
      return(monto < cuentaSecundaria.saldo())
    }
}

/*
object cuentaPrimaria {
    var saldo = 0 
    method deposito(monto) {
      saldo = saldo + monto
    }

    method extraer(monto) {
      saldo = saldo - monto
    }

    method saldo() {
      return(saldo)
    }
}
object cuentaSecundaria {
    var saldo = 0 
    method deposito(monto) {
      saldo = saldo + monto
    }

    method extraer(monto) {
      saldo = saldo - monto
    }

    method saldo() {
      return(saldo)
    }
}
*/