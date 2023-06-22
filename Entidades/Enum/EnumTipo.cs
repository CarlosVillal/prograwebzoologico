using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyectoZoologico.Entidades
{
	public enum EnumTipo
	{
		errorNoControlado = -1,
		errorLogica = 0, 
		exitoso = 1, 
		errorDeBaseDatos = 2, 
	}
}