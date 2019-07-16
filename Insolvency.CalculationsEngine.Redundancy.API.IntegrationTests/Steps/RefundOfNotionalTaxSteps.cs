using Cms.RpsCalculations.HttpAggregator.DTOs.RefundOfNotionalTax;
using System;
using System.Collections.Generic;
using System.Text;
using Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Common;
using TechTalk.SpecFlow;

namespace Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Steps
{
    [Binding]
    [Scope(Feature = "Refund of Notional Tax")]
    public class RefundOfNotionalTaxSteps:CoreSteps<RefundOfNotionalTaxResponseDto>
    {
        public RefundOfNotionalTaxSteps(ScenarioContext scenarioContext, CalculationEngineClient calculationEngineClient) 
            : base(scenarioContext, calculationEngineClient, "aggront")
        {
        }
    }
}
