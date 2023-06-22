using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using proyectoZoologico.AccesoDatos;
using proyectoZoologico.Entidades;
using proyectoZoologico.Entidades.Enum;
using proyectoZoologico.Entidades.Response;
using proyectoZoologico.Logica;

namespace zooApi.Controllers
{
    public class HistorialMedicoController : Controller
    {
		// GET: HistorialMedico
		public ResObtenerHistorialMedico Get()
		{
			ReqObtenerHistorialMedico req = new ReqObtenerHistorialMedico();

			LogHistorialMedico logicaDelBackend = new LogHistorialMedico();
			return logicaDelBackend.obtenerHistorialMedico(req);
		}

		[System.Web.Http.HttpPost]
		[System.Web.Http.Route("api/HistorialMedico/ingresarAtencion")]
		public ResIngresarHistorialMedico ingresarAtencion([FromBody] ReqIngresarHistorialMedico req)
		{
			LogHistorialMedico logicaDelBackend = new LogHistorialMedico();
			return logicaDelBackend.insertarHistorial(req);

		}
	}
}
