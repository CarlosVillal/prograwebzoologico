using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace proyectoZoologico.Entidades
{
	public class HistorialMedico
	{
		public int idHistorialMedico { get; set; }
		public int? idUsuario { get; set; }
		public int? idAnimal { get; set; }
		public string motivo { get; set; }
		public string detalles { get; set; }
		public DateTime? fechaAtencion { get; set; }

		public string nombreUsuario { get; set; }
		public string apellidosUsuario { get; set; }
		public string nombreAnimal { get; set; }
	}
}