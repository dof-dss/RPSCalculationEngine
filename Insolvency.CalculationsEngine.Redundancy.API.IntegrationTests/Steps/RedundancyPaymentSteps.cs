using Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Common;
using Insolvency.CalculationsEngine.Redundancy.BL.DTOs.RedundancyPayment;
using System;
using System.Collections.Generic;
using System.Text;
using TechTalk.SpecFlow;

namespace Insolvency.CalculationsEngine.Redundancy.API.IntegrationTests.Steps
{
    [Binding]
    [Scope(Feature = "Redundancy Payment")]
    public class RedundancyPaymentSteps : CoreSteps<RedundancyPaymentResponseDto>
    {
        public RedundancyPaymentSteps(ScenarioContext scenarioContext, CalculationEngineClient calculationEngineClient)
            : base(scenarioContext, calculationEngineClient, "aggrp")
        {
        }
    }
}
