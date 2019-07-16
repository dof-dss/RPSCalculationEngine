using Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Common;
using Cms.RpsCalculations.HttpAggregator.DTOs.Notice;
using TechTalk.SpecFlow;

namespace Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Steps
{
    [Binding]
    [Scope(Feature = "Notice Composite")]
    public class NoticeSteps : CoreSteps<NoticePayCompositeCalculationResponseDTO>
    {
        public NoticeSteps(ScenarioContext scenarioContext, CalculationEngineClient calculationEngineClient)
            : base(scenarioContext, calculationEngineClient, "aggnotice")
        {}
    }
}
