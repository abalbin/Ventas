﻿using System.Collections.Generic;

namespace VentasApp.Models.ViewModels
{
    public class ChartViewModel
    {
        public List<HighChartsSeries> allSeries { get; set; }
        public HighChartAxis xAxis { get; set; }
        public HighChartAxis yAxis { get; set; }
        public HighChartTitle title { get; set; }
        public HighChartTitle subtitle { get; set; }
    }
}