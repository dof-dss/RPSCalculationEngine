using System;
using System.Collections.Generic;
using System.Text;
using Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Common;
using Cms.RpsCalculations.HttpAggregator.DTOs.Holiday;
using TechTalk.SpecFlow;

namespace Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Steps
{
    [Binding]
    [Scope(Feature = "Holiday Composite")]
    public class HolidaySteps : CoreSteps<HolidayCalculationResponseDTO>
    {
        public HolidaySteps(ScenarioContext scenarioContext, CalculationEngineClient calculationEngineClient)
            : base(scenarioContext, calculationEngineClient, "aggholiday")
        {
        }
    }
}
