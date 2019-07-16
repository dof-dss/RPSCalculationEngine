using Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Common;
using Insolvency.CalculationsEngine.Redundancy.BL.DTOs.Apportionment;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Steps
{

    [Binding]
    [Scope(Feature = "Apportionment")]
    public class ApportionmentSteps : CoreSteps<ApportionmentCalculationResponseDTO>
    {
        public ApportionmentSteps(ScenarioContext scenarioContext, CalculationEngineClient calculationEngineClient)
            : base(scenarioContext, calculationEngineClient, "aggApportionment")
        {
        }
    }
}
