using proyectoZoologico.AccesoDatos;
using proyectoZoologico.Entidades.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using proyectoZoologico.Entidades;

namespace proyectoZoologico.Logica
{
	public class LogHistorialMedico
	{
		string con = "Data Source=DESKTOP-S3SJ51C\\SERVIDORSQL;Initial Catalog=bdForo;Integrated Security=True";

		public ResIngresarHistorialMedico insertarHistorial(ReqIngresarHistorialMedico req)
		{
			ResIngresarHistorialMedico res = new ResIngresarHistorialMedico();
			res.errors = new List<string>();
			Int16 tipoDeTransaccion = 0;
			string descripcionError = "";
			int? errorId = 0;

			try
			{
				if (req == null)
				{
					res.errors.Add("Res nulo");
					res.result = false;
				}
				else
				{
					if (req.elHistorialMedico.idUsuario == 0)
					{
						res.errors.Add("ID de usuario faltante");
						res.result = false;
					}
					if (req.elHistorialMedico.idAnimal == 0)
					{
						res.errors.Add("ID de animal faltante");
						res.result = false;
					}
					if (String.IsNullOrEmpty(req.elHistorialMedico.motivo))
					{
						res.errors.Add("Motivo de atención faltante");
						res.result = false;
					}
					if (String.IsNullOrEmpty(req.elHistorialMedico.detalles))
					{
						res.errors.Add("Detalles de atención faltante");
						res.result = false;
					}

					if (res.errors.Any())
					{
						//Hay errores
						tipoDeTransaccion = (Int16)EnumTipo.errorLogica;
					}
					else
					{
						//No hay errores
						//Mandar a AD
						int? idReturn = 0;
						int? idError = 0;
						string errorBD = "";

						conexionbdDataContext miLinq = new conexionbdDataContext(con);
						miLinq.SP_INGRESAR_HISTORIAL_MEDICO(req.elHistorialMedico.idUsuario, (int?)req.elHistorialMedico.idAnimal, req.elHistorialMedico.motivo, req.elHistorialMedico.detalles, ref idReturn, ref idError, ref descripcionError);

						if (idError == 0)
						{
							res.result = true;
							tipoDeTransaccion = (Int16)enumTipo.exitoso;
							errorId = 0;
						}
						else
						{
							errorId = idError;
							descripcionError = errorBD;
							res.result = false;
							res.errors.Add(errorBD);
							tipoDeTransaccion = (Int16)enumTipo.errorDeBaseDatos;
						}
					}
				}
			}
			catch (Exception ex)
			{
				res.result = false;
				tipoDeTransaccion = (Int16)EnumTipo.errorNoControlado;
				descripcionError = ex.StackTrace;
				res.errors.Add(ex.StackTrace); //!!!!!!
			}
			finally
			{
				//Utilitarios.bitacorear(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, tipoDeTransaccion, (int)errorId, descripcionError, JsonConvert.SerializeObject(req), JsonConvert.SerializeObject(res));
			}

			return res;
		}

		public ResObtenerHistorialMedico obtenerHistorialMedico(ReqObtenerHistorialMedico req)
		{
			Int16 tipoDeTransaccion = 0;
			string descripcionError = "";
			int? errorId = 0;
			ResObtenerHistorialMedico res = new ResObtenerHistorialMedico();
			res.errors = new List<string>();

			try
			{

				conexionbdDataContext miLinq = new conexionbdDataContext(con);
				List<SP_OBTENER_HISTORIAL_MEDICOResult> listaDeLinq = new List<SP_OBTENER_HISTORIAL_MEDICOResult>();
				listaDeLinq = miLinq.SP_OBTENER_HISTORIAL_MEDICO().ToList();
				res.listaDeHistorialMedico = this.crearListaDeHistorialMedico(listaDeLinq);
				res.result = true;

			}
			catch (Exception ex)
			{
				res.result = false;
				tipoDeTransaccion = (Int16)enumTipo.errorNoControlado;
				descripcionError = ex.StackTrace;
				res.errors.Add(ex.StackTrace); //!!!!!!
			}
			finally
			{
				//	Utilitarios.bitacorear(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, tipoDeTransaccion, (int)errorId, descripcionError, JsonConvert.SerializeObject(req), JsonConvert.SerializeObject(res));
			}
			return res;
		}

		private List<HistorialMedico> crearListaDeHistorialMedico(List<SP_OBTENER_HISTORIAL_MEDICOResult> listaDeLinq)
		{
			List<HistorialMedico> listaArmada = new List<HistorialMedico>();
			foreach (SP_OBTENER_HISTORIAL_MEDICOResult tipoComplejo in listaDeLinq)
			{
				listaArmada.Add(this.crearHistorialMedico(tipoComplejo));
			}
			return listaArmada;
		}

		private HistorialMedico crearHistorialMedico(SP_OBTENER_HISTORIAL_MEDICOResult unTipoComplejo)
		{
			HistorialMedico unHistorialMedico = new HistorialMedico();
			unHistorialMedico.idHistorialMedico = unTipoComplejo.ID_HISTORIAL_MEDICO;
			unHistorialMedico.idUsuario = unTipoComplejo.ID_USUARIO;
			unHistorialMedico.idAnimal = unTipoComplejo.ID_ANIMAL;
			unHistorialMedico.motivo = unTipoComplejo.MOTIVO_ATENCION;
			unHistorialMedico.detalles = unTipoComplejo.DETALLES;
			unHistorialMedico.fechaAtencion = unTipoComplejo.FECHA_ATENCION;
			unHistorialMedico.nombreAnimal = unTipoComplejo.NOMBRE_ANIMAL;
			unHistorialMedico.nombreUsuario = unTipoComplejo.NOMBRE;
			unHistorialMedico.apellidosUsuario = unTipoComplejo.APELLIDOS;

			return unHistorialMedico;
		}
	}
}