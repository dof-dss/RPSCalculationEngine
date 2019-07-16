using Microsoft.Extensions.Configuration;
using Newtonsoft.Json.Linq;
using SASignatureGenerator.TokenProvider;
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Common
{
    public class CalculationEngineClient 
    {
        private string _gatewayRelayUrl = null;
        private string _token = null;

        public CalculationEngineClient()
        {
            LoadConfiguration();
        }

        public async Task<ServiceResponse> GetStringAsync(string method)
        {
            var url = _gatewayRelayUrl + "/agg/" + method;

            using (var _httpClient = new HttpClient())
            {
                _httpClient.DefaultRequestHeaders.Add("ServiceBusAuthorization", _token);
                var httpResponse = await _httpClient.GetAsync(url);
                var responseContent = await httpResponse.Content.ReadAsStringAsync();

                return new ServiceResponse()
                {
                    StatusCode = httpResponse.StatusCode,
                    Content = responseContent
                };
            }
        }

        public async Task<ServiceResponse> PostAsJsonAsync(string method, string json)
        {
            try
            {
                var url = _gatewayRelayUrl + "/agg/" + method;

                using (var _httpClient = new HttpClient())
                {

                    _httpClient.DefaultRequestHeaders.Add("ServiceBusAuthorization", _token);

                    var content = new StringContent(json, Encoding.UTF8, "application/json");

                    var httpResponse = await _httpClient.PostAsync(url, content);
                    var responseContent = await httpResponse.Content.ReadAsStringAsync();

                    return new ServiceResponse()
                    {
                        StatusCode = httpResponse.StatusCode,
                        Content = responseContent,
                        JsonRoot = JObject.Parse(responseContent)
                    };
                }
            }
            catch (Exception exp)
            {
                return null;
            }
        }

        private void LoadConfiguration()
        {
            var configuration = new ConfigurationBuilder()
                                        .AddEnvironmentVariables()
                                        .AddJsonFile("specflow.json", optional: false, reloadOnChange: true)
                                        .Build();

            // first try environment var
            _gatewayRelayUrl = configuration.GetSection("GatewayRelayUrl").Value;
            if (_gatewayRelayUrl == null)
                throw new Exception("Unable to retrieve Gateway Relay Url");

            var sasKeyName = configuration.GetSection("SASKeyName").Value;
            if (sasKeyName == null)
                throw new Exception("Unable to retrieve SAS Key Name");

            var sasKey = configuration.GetSection("SASKey").Value;
            if (sasKey == null)
                throw new Exception("Unable to retrieve SAS Key");

            var tokenProvider = new SharedAccessSignatureTokenProvider();
            _token = tokenProvider.GetToken(sasKeyName, sasKey, _gatewayRelayUrl, TimeSpan.FromHours(1));
        }
    }
}
