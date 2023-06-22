using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using proyectoZoologico.Entidades;


namespace proyectoZoologico.Entidades 
{
	public class ReqIngresarHistorialMedico : ReqBase
	{
		public HistorialMedico elHistorialMedico { get; set; }
	}
}