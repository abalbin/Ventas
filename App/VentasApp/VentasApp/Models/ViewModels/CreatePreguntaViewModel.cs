using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VentasApp.Models.ViewModels
{
    public class CreatePreguntaViewModel
    {
        public Pregunta pregunta { get; set; }
        public int puntajeExamen { get; set; }
        public int idTipoExamen { get; set; }
    }
}