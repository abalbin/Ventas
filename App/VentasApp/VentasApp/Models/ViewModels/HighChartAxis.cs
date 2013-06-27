using System.Collections.Generic;

namespace VentasApp.Models.ViewModels
{
    public class HighChartAxis
    {
        public List<string> categories { get; set; }
        public int min { get; set; }
        public HighChartTitle title { get; set; }
    }
}