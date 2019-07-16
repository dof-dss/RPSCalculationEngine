using Newtonsoft.Json.Linq;
using System.Net;
using System.Net.Http;

namespace Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Common
{
    public class ServiceResponse
    {
        public HttpStatusCode StatusCode { get; set; }
        public string Content { get; set; }
        public JToken JsonRoot { get; set; }
    }
}
