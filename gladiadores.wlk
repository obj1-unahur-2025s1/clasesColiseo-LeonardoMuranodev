class Mirmillon {
  //Propiedades a la hora de instanciar
  const property arma
  var property casco
  var property escudo
  var property fuerza

  //Variables
  var vida = 100

  //Metodos de consulta
  method destreza() = 15
  method poderDeAtaque() = arma.poderDeAtaque() + fuerza
  method defensa() = self.destreza() + if(casco == null) 0 else casco.armadura() + if(escudo == null) 0 else escudo.armadura()
  method vida() = vida
  method generarNombreDeGrupo(otroFundador) = "mirmillolandia"

  //Metodos de indicacion
  method pelear(gladiador) {
    self.atacar(gladiador)
    if (gladiador.vida() > 0) {
      gladiador.atacar(self)
    }
  }
  method atacar(gladiador) {
    gladiador.recibirDaño(self.poderDeAtaque() - gladiador.defensa())
  }
  method recibirDaño(unDaño) {
    vida = 0.max(vida - unDaño)
  }

  method curarVida(){
    vida = 100
  }
}

class Dimachaerus {
  //Propiedades a la hora de instanciar
  const property armas
  var property destreza

  //Variables
  var vida = 100

  //Metodos de consulta
  method fuerza() = 10
  method poderDeAtaque() = self.fuerza() + armas.sum({arma => arma.poderDeAtaque()})
  method defensa() = destreza / 2
  method vida() = vida
  method generarNombreDeGrupo(otroFundador) = "D-" + (self.poderDeAtaque() + otroFundador.poderDeAtaque()).round().toString()

  //Metodos de indicacion
  method pelear(gladiador) {
    self.atacar(gladiador)
    if (gladiador.vida() > 0) {
      gladiador.atacar(self)
    }
  }
  method atacar(gladiador) {
    gladiador.recibirDaño(self.poderDeAtaque() - gladiador.defensa())
    destreza += 1
  }
  method recibirDaño(unDaño) {
    vida = 0.max(vida - unDaño)
  }

  method curarVida(){
    vida = 100
  }
}


//Armas
class ArmaDeFilo {
  const property filo
  const property longitud

  method poderDeAtaque() = filo * longitud

  method filo() = filo.min(topeFilo.tope())
}

class ArmaCotundente {
  const property peso

  method poderDeAtaque() = peso
}

object topeFilo {
  const property tope = 1 
}

//Defensas
class Casco {
  method armadura() = 10
}

class Escudo {
  var property luchador

  method asignarALuchador() {
    luchador.casco(self)
  }
  
  method armadura() = 5 + luchador.destreza() * 0.1
}