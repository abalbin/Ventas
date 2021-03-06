﻿using System.Collections.Generic;

namespace VentasApp.Models.ViewModels
{
    public class HighChartsSeries
    {
        public List<HighChartsPoint> data { set; get; }
        public HighChartDataLabel dataLabels { get; set; }
        public string name { set; get; }
        public string type { set; get; }
    }
}