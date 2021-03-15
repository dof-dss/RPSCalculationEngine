using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Insolvency.CalculationsEngine.Redundancy.Common.ConfigLookups
{
    public static class TraceInfoSerializer
    {
        public static string GetTraceDetails()
        {
            return JsonConvert.SerializeObject(new TraceInfo());
        }
    }

    public class TraceInfo
    {
        public DateTime DateTime { get; set; } = DateTime.Now;
    }

}
