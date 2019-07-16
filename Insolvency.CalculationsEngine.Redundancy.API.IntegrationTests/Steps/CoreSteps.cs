using Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Common;
using FluentAssertions;
using Newtonsoft.Json;
using System;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Steps
{
    public class CoreSteps<T> where T : IEquatable<T>
    {
        private readonly ScenarioContext _scenarioContext;
        private readonly CalculationEngineClient _calculationEngineClient;

        private ServiceResponse _serviceResponse = null;
        private string _method = null;

        public CoreSteps(ScenarioContext scenarioContext, CalculationEngineClient calculationEngineClient, string method)
        {
            _scenarioContext = scenarioContext ?? throw new ArgumentNullException("scenarioContext");
            _calculationEngineClient = calculationEngineClient ?? throw new ArgumentNullException("calculationEngineClient");
            _method = method;
        }

        [Given(@"I want to test ""(.*)"" method")]
        public void GivenIWantToTestMethod(string method)
        {
            _method = method;
        }
        
        [When(@"I make a request to the (.*)")]
        public async Task WhenIMakeAnCallToTheCalculationService(string endpoint)
        {
            _serviceResponse = await _calculationEngineClient.GetStringAsync(_method);
        }

        [When(@"I post to the (.*) with:")]
        public async Task WhenIPostToTheCalculationService(string endpoint, string json)
        {
            _serviceResponse = await _calculationEngineClient.PostAsJsonAsync(_method, json);
        }

        [Then(@"I get a response with status code ""(.*)""")]
        public void ThenIGetAResponseWithStatusCode(int statusCode)
        {
            _serviceResponse.Should().NotBeNull();
            _serviceResponse.StatusCode.Should().Be(statusCode);
        }
        
        [Then(@"the response contains ""(.*)""")]
        public void ThenTheResponseContains(string content)
        {
            _serviceResponse.Should().NotBeNull();
            _serviceResponse.Content.Contains(content, StringComparison.InvariantCultureIgnoreCase).Should().BeTrue();
        }

        [Then(@"the response is:")]
        public void ThenTheResponseIs(string json)
        {
            _serviceResponse.Should().NotBeNull();
            _serviceResponse.JsonRoot.Should().NotBeNull();

            CompareJson(_serviceResponse.Content, json).Should().BeTrue();
        }

        private bool CompareJson(string json1, string json2)
        {
            var obj1 = JsonConvert.DeserializeObject<T>(json1);
            var obj2 = JsonConvert.DeserializeObject<T>(json2);

            return obj1.Equals(obj2);
        }
    }
}
