class Personas{
	var property edad 
	method inteligencia()= if (edad.between(20, 40)) 12 else 8
	method potencia()= 20
	method esDestacado()= self.edad() == 25 || self.edad() == 35
	method darTributo(planeta){}
	method valor() = self.inteligencia() + self.potencia()
}
class Atletas inherits Personas{
	var masaMuscular = 4 
	var tecnicasConocidas = 2
	override method potencia()= super() + masaMuscular * tecnicasConocidas
	override method esDestacado()= super() || tecnicasConocidas > 5
	method entrenar(dias){masaMuscular= masaMuscular + dias.div(5)}
	method aprenderTecnica(){tecnicasConocidas += 1}
	override method darTributo(planeta){planeta.construirMurrallas(2)}
}
class Docentes inherits Personas{
	var cantCursos = 0  // Revisar poner cte
	override method inteligencia() = super() + 2 * cantCursos
	override method esDestacado() = cantCursos > 3
	override method darTributo(planeta){planeta.fundarMuseo()}
	override method valor() = super() + 5
}
class Planeta{
	var habitantes = #{}
	var property defensa = 2
	var cantMuseos 
	var longitudTotal
	method delegacionDiplomatica() = habitantes.filter{habitante => habitante.esDestacado()}
	method esCulto() = cantMuseos > 2 && habitantes.all{habitante => habitante.inteligencia() > 10}
	method potenciaReal() = habitantes.sum{habitante => habitante.potencia()}
	method construitMurrallas(cantidad){longitudTotal = longitudTotal + cantidad}
	method fundarMuseo(){cantMuseos = cantMuseos + 1 }
	method potenciaAparente() = habitantes.max{habitante => habitante.potencia()} * habitantes.length()
	method necesitaReforzarse() = 2 * self.potenciaAparente() >= self.potenciaReal()
	method recibirTributo() = habitantes.map{ habitante => habitante.darTributo(self)}
	method habitantesValiosos() = habitantes.filter{ habitante => habitante.valor() >= 40}
	method apaciguarPlaneta(apaciguado) = (self.habitantesValiosos()).map{ habitante => habitante.darTributo(apaciguado)}
}
class Soldado inherits Personas{
	var armas = #{}
	override method potencia() = super() + self.potenciaPorArma()
	method potenciaPorArma() = armas.sum{arma => arma.potenciaQueBrinda(self)} //raro
	override method darTributo(planeta){planeta.construirMurallas(5)}
}
class Pistolete{
	var largo 
	method potenciaQueBrinda(soldado) = if (soldado.edad() > 30) 3 * largo else 2 * largo
}

class Espadon{
	var peso
	method potenciaQueBrinda(soldado) = if (soldado.edad() < 40) peso / 2 else 6
}
