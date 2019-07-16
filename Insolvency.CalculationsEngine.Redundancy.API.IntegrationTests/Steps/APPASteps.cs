using System;
using System.Collections.Generic;
using System.Text;
using Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Common;
using Cms.RpsCalculations.HttpAggregator.DTOs.APPA;
using TechTalk.SpecFlow;

namespace Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Steps
{
    [Binding]
    [Scope(Feature = "APPA Composite")]
    public class APPASteps : CoreSteps<APPACalculationResponseDTO>
    {
        public APPASteps(ScenarioContext scenarioContext, CalculationEngineClient calculationEngineClient) 
            : base(scenarioContext, calculationEngineClient, "aggappa")
        {
        }
   
    }
}
