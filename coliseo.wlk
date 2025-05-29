import gladiadores.*

object coliseo {
    const grupos = []
    const gladiadoresSueltos = []

    //Metodos de indicacion
    method combateEntreGrupos() {
        if (grupos.size() >= 2) {
            const grupo1 = grupos.anyOne()
            const grupo2 = grupos.anyOne()

            grupo1.combate(grupo2)
        }
    }

    method combateEntreGrupoYGladiador() {
        if (not grupos.isEmpty() and not gladiadoresSueltos.isEmpty()) {
            const grupo = grupos.anyOne()
            const gladiador = gladiadoresSueltos.anyOne()

            gladiador.pelear(grupo.campeon())
        }
    }

    method curarATodos() {
        gladiadoresSueltos.forEach({gladiador => gladiador.curarVida()})
        grupos.forEach({grupo => grupo.curarAIntegrantes()})
    }

    method agregarGrupo(unGrupo) {
        grupos.add(unGrupo)
    } 

    method agregarGladiadorSuelto(unGladiador) {
        gladiadoresSueltos.add(unGladiador)
    } 
}


class Grupos {
    //Propiedades a la hora de instanciar
    const property gladiadores
    const property fundador 
    const coFundador
    //Variables
    var peleas = 0

    //Metodos de consulta
    method nombre() = fundador.generarNombreDeGrupo(coFundador)
    method peleas() = peleas
    method campeonActual() = self.gladiadoresConVida().max({gladiador => gladiador.poderDeAtaque()})
    method gladiadoresConVida() = gladiadores.filter({gladiador => gladiador.vida() > 0})
    
    //Metodos de indicacion
    method combate(otroGrupo) {
        (1..3).forEach({n => self.campeonActual().pelear(otroGrupo.campeonActual())})
        self.aumentarPeleas()
        otroGrupo.aumentarPeleas()
    }

    method curarAIntegrantes() {
        gladiadores.forEach({gladiador => gladiador.curarVida()})
    }

    method agregarGladiadores(listaGladiadores) {
        gladiadores.addAll(listaGladiadores)
    }

    method quitarGladiadores(listaGladiadores) {
        gladiadores.removeAll(listaGladiadores)
    }

    method aumentarPeleas() {
        peleas += 1
    }
}