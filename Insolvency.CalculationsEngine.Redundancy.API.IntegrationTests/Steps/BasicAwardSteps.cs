using Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Common;
using Cms.RpsCalculations.HttpAggregator.DTOs.BasicAward;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Steps
{
    [Binding]
    [Scope(Feature = "Basic Award")]
    public class BasicAwardSteps : CoreSteps<BasicAwardCalculationResponseDTO>
    {
        public BasicAwardSteps(ScenarioContext scenarioContext, CalculationEngineClient calculationEngineClient)
            : base(scenarioContext, calculationEngineClient, "aggba")
        {
        }
    }
}
