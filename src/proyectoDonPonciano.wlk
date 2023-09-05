object donPonciano{
	const campoTotal = 15
	var campoSembrado = 10
	var tipoDeCultivo = trigo
	var dinero = 5000
	
	method fumigar(){
		dinero = dinero - (campoTotal * 10)
	}
	method fertilizar(){
		dinero = dinero - tipoDeCultivo.costoFertilizar(campoSembrado)
		tipoDeCultivo.fertilizar()
	}
	method resiembra(cultivo){
		tipoDeCultivo = cultivo
		dinero = dinero - (cultivo.precioSemilla()*campoSembrado)
	}
	method ampliarSiembra(){
		dinero = dinero - (tipoDeCultivo.precioSemilla()*(campoTotal - campoSembrado))
		campoSembrado = campoTotal
	}
	method cosecharSembrar(cultivo, hectareas){
		dinero = dinero + (tipoDeCultivo.precioVenta()*tipoDeCultivo.rendimiento()*campoSembrado)
		campoSembrado = hectareas
		self.resiembra(cultivo)
	}
	
	method dinero()=dinero
	method tipoDeCultivo()= tipoDeCultivo
	method campoSembrado()= campoSembrado
}
object trigo{
	const costoPorHectarea = 500
	var rendimiento = 10
	const precioVenta = 1000
	method precioSemilla() = 1500
	method costoFertilizar(hectareas) = costoPorHectarea * hectareas
	method precioVenta() = precioVenta
	method rendimiento() = rendimiento
	method fertilizar(){
		rendimiento = rendimiento + 2
	}
}

object soja{
	var costoPorHectarea = precioVenta/2
	var rendimiento = 20
	var rendimientoPivote = 40
	var rendimientoSegundo = 40
	var precioVenta = (mercadoDeChicago.valorSoja()*estadoArgentino.dolarSoja())*0.35
	method precioSemilla() = 400
	method costoFertilizar(hectareas) = costoPorHectarea * hectareas
	method precioVenta() = precioVenta
	method rendimiento() = rendimiento
	method fertilizar(){
		rendimientoPivote = rendimientoSegundo
		rendimientoSegundo = rendimiento
		rendimiento = rendimientoPivote
	}
}
object maiz{
	const costoPorHectarea = 500
	const rendimiento = 15
	var precioVenta = 0.5 * soja.precioVenta()
	method precioSemilla() = 100
	method costoFertilizar(hectareas){
		if(costoPorHectarea*hectareas < 5000){
			return costoPorHectarea*hectareas
		}else{return 5000}
	} 
	method precioVenta() = precioVenta
	method rendimiento() = rendimiento
	method fertilizar(){}
}

object mercadoDeChicago{
	method valorSoja() = 2
}

object estadoArgentino{
	method dolarSoja() = 470
}