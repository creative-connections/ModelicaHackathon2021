within ;
package Hack_Maduda_friday
  model Circulation
    extends Physiolibrary.Icons.Microcirculation;
    Physiolibrary.Fluid.Components.VolumePump LeftHeart(
      redeclare package Medium = Blood,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={30,14})));
    Physiolibrary.Fluid.Components.VolumePump RightHeart(
      redeclare package Medium = Blood,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-74,8})));
    Physiolibrary.Fluid.Components.ElasticVessel VeinsPulmo(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.0004,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0004,
      nPorts=3) annotation (Placement(transformation(extent={{20,60},{40,80}})));
    Physiolibrary.Fluid.Components.ElasticVessel ArteriesPulmo(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00038,
      Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0003,
      nPorts=3) annotation (Placement(transformation(extent={{-84,58},{-64,78}})));
    Physiolibrary.Fluid.Components.ElasticVessel ArteriesBody(
      redeclare package Medium = Blood,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.00085,
      Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
      ZeroPressureVolume(displayUnit="l") = 0.00045,
      nPorts=4) annotation (Placement(transformation(extent={{20,-54},{40,-34}})));
    Physiolibrary.Fluid.Components.ElasticVessel VeinsBody(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00325,
      Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
      ZeroPressureVolume(displayUnit="l") = 0.00295,
      nPorts=3)
      annotation (Placement(transformation(extent={{-84,-56},{-64,-36}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowRight(redeclare package Medium
        = Blood) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={30,-18})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureVB(redeclare
        package Medium = Blood) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-120,-34})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureAP(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-106,66},{-86,86}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureVP(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{52,76},{72,96}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance(
        k=1.250102626409427e-07*(5/4)) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={84,10})));
    Modelica.Blocks.Math.MultiProduct multiProduct(nu=2) annotation (Placement(
          transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={56,14})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance1(
       k=1.250102626409427e-07*(5/4))
      annotation (Placement(transformation(extent={{-130,8},{-122,16}})));
    Modelica.Blocks.Math.MultiProduct multiProduct1(nu=2) annotation (Placement(
          transformation(
          extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-96,8})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowLeft(redeclare package Medium
        = Blood) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-74,36})));
    Physiolibrary.Fluid.Components.Resistor VenResBody(redeclare package Medium
        = Blood, Resistance=7999343.2449*(20/8)) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-48,-48})));
    replaceable package Blood = Physiolibrary.Media.BloodBySiggaardAndersen annotation(choicesAllMatching=true);
    Physiolibrary.Fluid.Interfaces.FluidPort_a SystemicCapOut(redeclare package
        Medium = Blood) annotation (Placement(transformation(rotation=0, extent={{18.5,
              -108},{43.5,-88}}), iconTransformation(extent={{18.5,-108},{43.5,-88}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a PulmoCapillariesIn(redeclare
        package Medium = Blood) annotation (Placement(transformation(rotation=0,
            extent={{-71.5,86},{-46.5,106}}), iconTransformation(extent={{-71.5,86},
              {-46.5,106}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b PulmoCapillariesOut(redeclare
        package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{16,88},{36,108}}),
          iconTransformation(extent={{16,88},{36,108}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b SystemicCapillariesIn(redeclare
        package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-74,-110},{-54,-90}})));
    Physiolibrary.Fluid.Sensors.PartialPressure paCO2(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={66,-46})));
    Physiolibrary.Types.RealIO.PressureOutput PartialPressureCO2_arteries
      annotation (Placement(transformation(extent={{106,34},{126,54}})));
    Physiolibrary.Fluid.Sensors.PartialPressure paO2(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={86,-74})));
    Physiolibrary.Types.RealIO.PressureOutput PartialPressureO2_arteries
      annotation (Placement(transformation(extent={{106,-54},{126,-34}})));
  equation
    connect(LeftHeart.q_in,VeinsPulmo. q_in[1]) annotation (Line(
        points={{30,24},{30,71.7333},{29.9,71.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(LeftHeart.q_out,flowRight. q_in) annotation (Line(
        points={{30,4},{30,-8}},
        color={127,0,0},
        thickness=0.5));
    connect(flowRight.q_out,ArteriesBody. q_in[1]) annotation (Line(
        points={{30,-28},{29.9,-42.05}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureVP.q_in,VeinsPulmo. q_in[2]) annotation (Line(
        points={{58,80},{58,70},{29.9,70}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureVP.pressure,multiProduct. u[1]) annotation (Line(
          points={{68,82},{74,82},{74,11.9},{62,11.9}},
                                                      color={0,0,127}));
    connect(multiProduct.y,LeftHeart. solutionFlow)
      annotation (Line(points={{48.98,14},{37,14}}, color={0,0,127}));
    connect(hydraulicConductance.y,multiProduct. u[2])
      annotation (Line(points={{79,10},{62,10},{62,16.1}},
                                                         color={0,0,127}));
    connect(RightHeart.q_out,flowLeft. q_in) annotation (Line(
        points={{-74,18},{-74,26}},
        color={127,0,0},
        thickness=0.5));
    connect(flowLeft.q_out,ArteriesPulmo. q_in[1]) annotation (Line(
        points={{-74,46},{-74,69.7333},{-74.1,69.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureAP.q_in,ArteriesPulmo. q_in[2]) annotation (Line(
        points={{-100,70},{-100,68},{-74.1,68}},
        color={127,0,0},
        thickness=0.5));
    connect(multiProduct1.y,RightHeart. solutionFlow)
      annotation (Line(points={{-88.98,8},{-81,8}}, color={0,0,127}));
    connect(hydraulicConductance1.y,multiProduct1. u[1]) annotation (Line(points={{-121,12},
            {-102,12},{-102,10.1}},            color={0,0,127}));
    connect(RightHeart.q_in,VeinsBody. q_in[1]) annotation (Line(
        points={{-74,-2},{-74,-44.2667},{-74.1,-44.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(VeinsBody.q_in[2],pressureMeasureVB. q_in) annotation (Line(
        points={{-74.1,-46},{-124,-46},{-124,-40}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureVB.pressure,multiProduct1. u[2]) annotation (Line(
          points={{-114,-38},{-100,-38},{-100,-8},{-112,-8},{-112,5.9},{-102,5.9}},
          color={0,0,127}));
    connect(VenResBody.q_out, VeinsBody.q_in[3]) annotation (Line(
        points={{-58,-48},{-66,-48},{-66,-47.7333},{-74.1,-47.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(VenResBody.q_in, SystemicCapillariesIn) annotation (Line(
        points={{-38,-48},{-38,-100},{-64,-100}},
        color={127,0,0},
        thickness=0.5));
    connect(PulmoCapillariesIn, ArteriesPulmo.q_in[3]) annotation (Line(
        points={{-59,96},{-40,96},{-40,66.2667},{-74.1,66.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(PulmoCapillariesOut, VeinsPulmo.q_in[3]) annotation (Line(
        points={{26,98},{-24,98},{-24,68.2667},{29.9,68.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(SystemicCapOut, ArteriesBody.q_in[2]) annotation (Line(
        points={{31,-98},{31,-43.35},{29.9,-43.35}},
        color={127,0,0},
        thickness=0.5));
    connect(paCO2.referenceFluidPort, ArteriesBody.q_in[3]) annotation (Line(
        points={{56.2,-46},{42,-46},{42,-44.65},{29.9,-44.65}},
        color={127,0,0},
        thickness=0.5));
    connect(paCO2.port_a, ArteriesBody.substances[3]) annotation (Line(points={
            {66,-56},{66,-66},{8,-66},{8,-44},{20,-44}}, color={158,66,200}));
    connect(paCO2.partialPressure, PartialPressureCO2_arteries) annotation (
        Line(points={{66,-36},{66,-16},{98,-16},{98,42},{108,42},{108,44},{116,
            44}},                                                  color={0,0,
            127}));
    connect(PartialPressureCO2_arteries, PartialPressureCO2_arteries)
      annotation (Line(points={{116,44},{116,44}}, color={0,0,127}));
    connect(paO2.referenceFluidPort, ArteriesBody.q_in[4]) annotation (Line(
        points={{76.2,-74},{29.9,-74},{29.9,-45.95}},
        color={127,0,0},
        thickness=0.5));
    connect(paO2.port_a, ArteriesBody.substances[2]) annotation (Line(points={{
            86,-84},{-2,-84},{-2,-44},{20,-44}}, color={158,66,200}));
    connect(paO2.partialPressure, PartialPressureO2_arteries) annotation (Line(
          points={{86,-64},{86,-44},{116,-44},{116,-44}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(extent={{-140,-100},{110,100}})),
      Icon(coordinateSystem(extent={{-140,-100},{110,100}})));
  end Circulation;

  model WholeModel
    //parameter Physiolibrary.Types.Fraction FlungsShunt_start=0.05;
    //parameter Physiolibrary.Types.Frequency RR=0.28333333333333
    //                                           "Respiration Rate";
    parameter Physiolibrary.Types.Volume TV=0.0005 "Tidal Volume",
                                             DV=0.00015 "Dead space";
    package Air = Physiolibrary.Media.Air;
    parameter Physiolibrary.Types.HydraulicConductance c_TotalVentilation=1.019716212977928e-05
        *(((1/1.5)))                                                               "Total Lung Conductance";
    parameter Physiolibrary.Types.HydraulicConductance c_TotalPerfusion=1.250102626409427e-07
        *(1/3*(1 - 0.02))                                                        "Total Lung Conductance";
    parameter Physiolibrary.Types.HydraulicConductance c_shunt=1.250102626409427e-07
        *(0.02*(1/3));
    parameter Integer NA=10  "Number of Alveolar Unit";
    Physiolibrary.Fluid.Sources.PressureSource pressureSource(redeclare package
        Medium = Air)
      annotation (Placement(transformation(extent={{-116,2},{-96,22}})));
    Physiolibrary.Fluid.Components.VolumePump DeadSpace(
      redeclare package Medium = Air,
      useSolutionFlowInput=true,
      q_out(p(start=101277.72470869822)))
      annotation (Placement(transformation(extent={{-54,20},{-34,40}})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource VentilationFlow(
      useSolutionFlowInput=true,
      redeclare package Medium = Air,
      density(start=1.191923596163783))
      annotation (Placement(transformation(extent={{8,2},{28,22}})));
    Physiolibrary.Fluid.Components.Resistor systemicRes(redeclare package
        Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen, Resistance=7999343.2449*
          (20*(7/8)))
      annotation (Placement(transformation(extent={{-4,-138},{16,-118}})));
    Physiolibrary.Fluid.Components.ElasticVessel SystemCapillaries(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0003,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0002,
      nPorts=4,
      chemicalSolution(bloodGases(
          cHCO3(start=24.52399716789123),
          pCO(start=9.996918220973395E-06),
          pCO2(start=5332.920352860495),
          sCO(start=1.8089495849532384E-07),
          sO2CO(start=0.9627736405069439))))
      annotation (Placement(transformation(extent={{-70,-160},{-50,-140}})));
    Chemical.Sources.SubstanceInflowT CO2Production(
      SubstanceFlow(displayUnit="mmol/min") = 0.00020566666666667,
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas()) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-2,-186})));
    Chemical.Sources.SubstanceOutflow O2Consumption(SubstanceFlow(displayUnit="mmol/min")=
           0.00025666666666667) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-106,-150})));
    Circulation circulation(ArteriesBody(chemicalSolution(bloodGases(
            cHCO3(start=24.52399716789123),
            pCO(start=9.996918220972615E-06),
            pCO2(start=5332.920352860494),
            sCO(start=1.8089495849532384E-07),
            sO2CO(start=0.9627736405069454)))))
      annotation (Placement(transformation(extent={{-64,-110},{-22,-76}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2_tissue(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={66,-134})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2_tissue(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-102,-114},{-82,-94}})));
    Physiolibrary.Fluid.Components.Conductor shunt(redeclare package Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen, Conductance=c_shunt)
      annotation (Placement(transformation(extent={{-56,-62},{-36,-42}})));
    AlveolarUnit alveolarUnit[NA](
      redeclare package Air = Air,
      C_ventilation=ones(NA)*(c_TotalVentilation/NA),
      C_circulation=ones(NA)*(c_TotalPerfusion/NA),
      PulmoCapillaries(chemicalSolution(bloodGases(
            cHCO3(start={24.52399716789123,24.52399716789123,24.52399716789123,
                  24.52399716789123,24.52399716789123,24.52399716789123,
                  24.52399716789123,24.52399716789123,24.52399716789123,
                  24.52399716789123}),
            pCO(start={9.996918220973395E-06,9.996918220973395E-06,
                  9.996918220973395E-06,9.996918220973395E-06,
                  9.996918220973395E-06,9.996918220973395E-06,
                  9.996918220973395E-06,9.996918220973395E-06,
                  9.996918220973395E-06,9.996918220973395E-06}),
            pCO2(start={5332.920352860495,5332.920352860495,5332.920352860495,
                  5332.920352860495,5332.920352860495,5332.920352860495,
                  5332.920352860495,5332.920352860495,5332.920352860495,
                  5332.920352860495}),
            sCO(start={1.8089495849532384E-07,1.8089495849532384E-07,
                  1.8089495849532384E-07,1.8089495849532384E-07,
                  1.8089495849532384E-07,1.8089495849532384E-07,
                  1.8089495849532384E-07,1.8089495849532384E-07,
                  1.8089495849532384E-07,1.8089495849532384E-07}),
            sO2CO(start={0.9627736405069439,0.9627736405069439,
                  0.9627736405069439,0.9627736405069439,0.9627736405069439,
                  0.9627736405069439,0.9627736405069439,0.9627736405069439,
                  0.9627736405069439,0.9627736405069439})))))
                                          annotation (Placement(transformation(
            rotation=0, extent={{-66,-38},{-28,0}})));
    VentRegulation ventRegulation annotation (Placement(transformation(rotation=
             0, extent={{52,30},{72,50}})));
    Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={2,76})));
    Physiolibrary.Types.Constants.VolumeConst VD(k(displayUnit="l") = DV)
      annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={42,82})));
  equation

    connect(VentilationFlow.q_in, DeadSpace.q_out) annotation (Line(
        points={{8,12},{-12,12},{-12,30},{-34,30}},
        color={127,0,0},
        thickness=0.5));
    connect(DeadSpace.q_in, pressureSource.y) annotation (Line(
        points={{-54,30},{-86,30},{-86,12},{-96,12}},
        color={127,0,0},
        thickness=0.5));
    connect(systemicRes.q_out, SystemCapillaries.q_in[1]) annotation (Line(
        points={{16,-128},{40,-128},{40,-148.05},{-60.1,-148.05}},
        color={127,0,0},
        thickness=0.5));
    connect(circulation.SystemicCapOut, systemicRes.q_in) annotation (Line(
        points={{-35.272,-109.66},{-34,-109.66},{-34,-128},{-4,-128}},
        color={127,0,0},
        thickness=0.5));
    connect(circulation.SystemicCapillariesIn, SystemCapillaries.q_in[2])
      annotation (Line(
        points={{-51.232,-110},{-52,-110},{-52,-122},{-58,-122},{-58,-136},{
            -60.1,-136},{-60.1,-149.35}},
        color={127,0,0},
        thickness=0.5));

    connect(CO2Production.port_b, pCO2_tissue.port_a) annotation (Line(points={{-12,
            -186},{-34,-186},{-34,-170},{76,-170},{76,-134}},
                         color={158,66,200}));
    connect(pCO2_tissue.referenceFluidPort, SystemCapillaries.q_in[3])
      annotation (Line(
        points={{66,-143.8},{66,-150},{-60.1,-150},{-60.1,-150.65}},
        color={127,0,0},
        thickness=0.5));
    connect(pO2_tissue.referenceFluidPort, SystemCapillaries.q_in[4]) annotation (
       Line(
        points={{-92,-113.8},{-92,-124},{-58,-124},{-58,-136},{-60.1,-136},{
            -60.1,-151.95}},
        color={127,0,0},
        thickness=0.5));

    connect(shunt.q_out, circulation.PulmoCapillariesOut) annotation (Line(
        points={{-36,-52},{-22,-52},{-22,-76.34},{-36.112,-76.34}},
        color={127,0,0},
        thickness=0.5));

    for i in 1:NA loop
    connect(alveolarUnit[i].q_in3, pressureSource.y) annotation (Line(
        points={{-55.36,0},{-54,0},{-54,12},{-96,12}},
        color={127,0,0},
        thickness=0.5));
      connect(alveolarUnit[i].q_in, VentilationFlow.q_in) annotation (Line(
          points={{-39.02,-0.76},{-38,-0.76},{-38,12},{8,12}},
          color={127,0,0},
          thickness=0.5));
      connect(alveolarUnit[i].q_in1, circulation.PulmoCapillariesOut)
        annotation (Line(
          points={{-38.26,-38},{-22,-38},{-22,-76.34},{-36.112,-76.34}},
          color={127,0,0},
          thickness=0.5));
      connect(alveolarUnit[i].q_in2, circulation.PulmoCapillariesIn)
        annotation (Line(
          points={{-55.36,-38},{-72,-38},{-72,-78},{-50.392,-78},{-50.392,
              -76.68}},
          color={127,0,0},
          thickness=0.5));
    end for;
    connect(circulation.PartialPressureCO2_arteries, ventRegulation.paCO2)
      annotation (Line(points={{-20.992,-85.52},{60,-85.52},{60,20},{60.1111,20},
            {60.1111,30.125}}, color={0,0,127}));
    connect(ventRegulation.RR, product1.u1) annotation (Line(points={{66,52.25},
            {64,52.25},{64,70},{14,70}}, color={0,0,127}));
    connect(VD.y, product1.u2)
      annotation (Line(points={{37,82},{14,82}}, color={0,0,127}));
    connect(DeadSpace.solutionFlow, product1.y)
      annotation (Line(points={{-44,37},{-44,76},{-9,76}}, color={0,0,127}));
    connect(ventRegulation.Vv, VentilationFlow.solutionFlow) annotation (Line(
          points={{51.5556,46.75},{18,46.75},{18,19}}, color={0,0,127}));
    connect(shunt.q_in, circulation.PulmoCapillariesIn) annotation (Line(
        points={{-56,-52},{-72,-52},{-72,-78},{-50.392,-78},{-50.392,-76.68}},
        color={127,0,0},
        thickness=0.5));
    connect(pO2_tissue.port_a, O2Consumption.port_a) annotation (Line(points={{
            -82,-104},{-74,-104},{-74,-134},{-86,-134},{-86,-150},{-96,-150}},
          color={158,66,200}));
    connect(SystemCapillaries.substances[3], CO2Production.port_b) annotation (
        Line(points={{-70,-150},{-70,-186},{-12,-186}}, color={158,66,200}));
    connect(SystemCapillaries.substances[2], O2Consumption.port_a)
      annotation (Line(points={{-70,-150},{-96,-150}}, color={158,66,200}));
    connect(circulation.PartialPressureO2_arteries, ventRegulation.paO2)
      annotation (Line(points={{-20.992,-100.48},{69.4444,-100.48},{69.4444,
            30.125}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-220,
              -200},{180,100}})),
                            Diagram(coordinateSystem(preserveAspectRatio=false,
            extent={{-220,-200},{180,100}})),
      experiment(StopTime=600, __Dymola_Algorithm="Dassl"));
  end WholeModel;

  model basic
    package Blood = Physiolibrary.Media.BloodBySiggaardAndersen;
    Physiolibrary.Fluid.Components.VolumePump LeftHeart(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={48,10})));
    Physiolibrary.Fluid.Components.VolumePump RightHeart(
      redeclare package Medium = Physiolibrary.Media.Water,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-74,8})));
    Physiolibrary.Fluid.Components.ElasticVessel VeinsPulmo(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      volume_start(displayUnit="l") = 0.0004,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0004,
      nPorts=3) annotation (Placement(transformation(extent={{38,56},{58,76}})));
    Physiolibrary.Fluid.Components.ElasticVessel ArteriesPulmo(
      redeclare package Medium = Physiolibrary.Media.Water,
      volume_start(displayUnit="l") = 0.00038,
      Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0003,
      nPorts=3) annotation (Placement(transformation(extent={{-84,54},{-64,74}})));
    Physiolibrary.Fluid.Components.ElasticVessel ArteriesBody(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      volume_start(displayUnit="l") = 0.00085,
      Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
      ZeroPressureVolume(displayUnit="l") = 0.00045,
      nPorts=3) annotation (Placement(transformation(extent={{38,-58},{58,-38}})));
    Physiolibrary.Fluid.Components.ElasticVessel VeinsBody(
      redeclare package Medium = Physiolibrary.Media.Water,
      volume_start(displayUnit="l") = 0.00325,
      Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
      ZeroPressureVolume(displayUnit="l") = 0.00295,
      nPorts=3)
      annotation (Placement(transformation(extent={{-84,-56},{-64,-36}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureAB
      annotation (Placement(transformation(extent={{82,-82},{102,-62}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowRight(redeclare package Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen)
                                                      annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={48,-22})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureVB
      annotation (Placement(transformation(extent={{-110,-36},{-90,-16}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureAP
      annotation (Placement(transformation(extent={{-100,66},{-80,86}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureVP
      annotation (Placement(transformation(extent={{70,72},{90,92}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance(
        k=1.250102626409427e-07*(5/4)) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={102,6})));
    Modelica.Blocks.Math.MultiProduct multiProduct(nu=2) annotation (Placement(
          transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={74,10})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance1(
       k=1.250102626409427e-07*(5/4))
      annotation (Placement(transformation(extent={{-130,8},{-122,16}})));
    Modelica.Blocks.Math.MultiProduct multiProduct1(nu=2) annotation (Placement(
          transformation(
          extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-96,8})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowLeft annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-74,36})));
    Physiolibrary.Fluid.Components.Resistor VenResPulmo(Resistance=7999343.2449*(3
          /8)) annotation (Placement(transformation(extent={{2,56},{22,76}})));
    Physiolibrary.Fluid.Components.Resistor ArtResPulmo(Resistance=7999343.2449*((
          7/8)*3))
      annotation (Placement(transformation(extent={{-38,56},{-18,76}})));
    Physiolibrary.Fluid.Components.Resistor VenResBody(Resistance=7999343.2449*(20
          /8)) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-28,-48})));
    Physiolibrary.Fluid.Components.Resistor ArtResBody(Resistance=7999343.2449*((7
          /8)*20)) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={12,-48})));
    Physiolibrary.Fluid.Components.ElasticVessel elasticVessel(
      volume_start(displayUnit="l") = 0.0003,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0002,            nPorts=2)
      annotation (Placement(transformation(extent={{-20,-84},{0,-64}})));
    Physiolibrary.Fluid.Components.ElasticVessel elasticVessel1(
      volume_start(displayUnit="l") = 0.00015,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0001,
      nPorts=2)
      annotation (Placement(transformation(extent={{-18,86},{2,106}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureCAPB
      annotation (Placement(transformation(extent={{28,-108},{48,-88}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureCAPP
      annotation (Placement(transformation(extent={{-62,90},{-42,110}})));

  equation
    connect(LeftHeart.q_in, VeinsPulmo.q_in[1]) annotation (Line(
        points={{48,20},{48,67.7333},{47.9,67.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(LeftHeart.q_out, flowRight.q_in) annotation (Line(
        points={{48,0},{48,-12}},
        color={127,0,0},
        thickness=0.5));
    connect(flowRight.q_out, ArteriesBody.q_in[1]) annotation (Line(
        points={{48,-32},{47.9,-46.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureVP.q_in, VeinsPulmo.q_in[2]) annotation (Line(
        points={{76,76},{76,66},{47.9,66}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureVP.pressure, multiProduct.u[1]) annotation (Line(
          points={{86,78},{92,78},{92,7.9},{80,7.9}}, color={0,0,127}));
    connect(multiProduct.y, LeftHeart.solutionFlow)
      annotation (Line(points={{66.98,10},{55,10}}, color={0,0,127}));
    connect(hydraulicConductance.y, multiProduct.u[2])
      annotation (Line(points={{97,6},{80,6},{80,12.1}}, color={0,0,127}));
    connect(RightHeart.q_out, flowLeft.q_in) annotation (Line(
        points={{-74,18},{-74,26}},
        color={127,0,0},
        thickness=0.5));
    connect(flowLeft.q_out, ArteriesPulmo.q_in[1]) annotation (Line(
        points={{-74,46},{-74,65.7333},{-74.1,65.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureAP.q_in, ArteriesPulmo.q_in[2]) annotation (Line(
        points={{-94,70},{-94,64},{-74.1,64}},
        color={127,0,0},
        thickness=0.5));
    connect(multiProduct1.y, RightHeart.solutionFlow)
      annotation (Line(points={{-88.98,8},{-81,8}}, color={0,0,127}));
    connect(hydraulicConductance1.y, multiProduct1.u[1]) annotation (Line(points=
            {{-121,12},{-102,12},{-102,10.1}}, color={0,0,127}));
    connect(RightHeart.q_in, VeinsBody.q_in[1]) annotation (Line(
        points={{-74,-2},{-74,-44.2667},{-74.1,-44.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureVB.q_in, VeinsBody.q_in[2]) annotation (Line(
        points={{-104,-32},{-104,-46},{-74.1,-46}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureVB.pressure, multiProduct1.u[2]) annotation (Line(
          points={{-94,-30},{-88,-30},{-88,-6},{-102,-6},{-102,5.9}}, color={0,0,
            127}));
    connect(pressureMeasureAB.q_in, ArteriesBody.q_in[2]) annotation (Line(
        points={{88,-78},{76,-78},{76,-48},{47.9,-48}},
        color={127,0,0},
        thickness=0.5));
    connect(ArtResBody.q_in, ArteriesBody.q_in[3]) annotation (Line(
        points={{22,-48},{48,-48},{48,-49.7333},{47.9,-49.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(ArtResBody.q_out, VenResBody.q_in) annotation (Line(
        points={{2,-48},{-18,-48}},
        color={127,0,0},
        thickness=0.5));
    connect(VenResBody.q_out, VeinsBody.q_in[3]) annotation (Line(
        points={{-38,-48},{-74.1,-48},{-74.1,-47.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(elasticVessel.q_in[1], VenResBody.q_in) annotation (Line(
        points={{-10.1,-72.7},{-10.1,-48},{-18,-48}},
        color={127,0,0},
        thickness=0.5));
    connect(ArtResPulmo.q_in, ArteriesPulmo.q_in[3]) annotation (Line(
        points={{-38,66},{-56,66},{-56,62.2667},{-74.1,62.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(VeinsPulmo.q_in[3], VenResPulmo.q_out) annotation (Line(
        points={{47.9,64.2667},{34,64.2667},{34,66},{22,66}},
        color={127,0,0},
        thickness=0.5));
    connect(ArtResPulmo.q_out, VenResPulmo.q_in) annotation (Line(
        points={{-18,66},{2,66}},
        color={127,0,0},
        thickness=0.5));
    connect(elasticVessel1.q_in[1], VenResPulmo.q_in) annotation (Line(
        points={{-8.1,97.3},{-8,97.3},{-8,66},{2,66}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureCAPB.q_in, elasticVessel.q_in[2]) annotation (Line(
        points={{34,-104},{22,-104},{22,-106},{-10.1,-106},{-10.1,-75.3}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureCAPP.q_in, elasticVessel1.q_in[2]) annotation (Line(
        points={{-56,94},{-56,84},{-8.1,84},{-8.1,94.7}},
        color={127,0,0},
        thickness=0.5));
    annotation (
      experiment(StopTime=600, __Dymola_Algorithm="Dassl"),
      Diagram(coordinateSystem(extent={{-280,-140},{200,120}})),
      Icon(coordinateSystem(extent={{-280,-140},{200,120}})));
  end basic;

  model Bloodbasic
    replaceable package Blood = Physiolibrary.Media.BloodBySiggaardAndersen annotation(choicesAllMatching=true);
    Physiolibrary.Fluid.Components.ElasticVessel PulmoArteries(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00015,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0001,
      nPorts=1) annotation (Placement(transformation(extent={{-24,90},{-4,110}})));

    Physiolibrary.Fluid.Components.VolumePump LeftHeart(
      redeclare package Medium = Blood,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={44,-10})));
    Physiolibrary.Fluid.Components.VolumePump RightHeart(
      redeclare package Medium = Blood,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-78,-12})));
    Physiolibrary.Fluid.Components.ElasticVessel VeinsPulmo(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.0004,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0004,
      nPorts=3) annotation (Placement(transformation(extent={{34,36},{54,56}})));
    Physiolibrary.Fluid.Components.ElasticVessel ArteriesPulmo(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00038,
      Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0003,
      nPorts=3) annotation (Placement(transformation(extent={{-88,38},{-68,58}})));
    Physiolibrary.Fluid.Components.ElasticVessel ArteriesBody(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00085,
      Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
      ZeroPressureVolume(displayUnit="l") = 0.00045,
      nPorts=3) annotation (Placement(transformation(extent={{34,-78},{54,-58}})));
    Physiolibrary.Fluid.Components.ElasticVessel VeinsBody(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00325,
      Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
      ZeroPressureVolume(displayUnit="l") = 0.00295,
      nPorts=3)
      annotation (Placement(transformation(extent={{-88,-76},{-68,-56}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureAB(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{78,-102},{98,-82}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowRight(redeclare package Medium =
          Blood) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={44,-42})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureVB(redeclare
        package Medium = Blood) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-124,-54})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureAP(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-110,46},{-90,66}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureVP(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{66,52},{86,72}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance(
        k=1.250102626409427e-07*(5/4)) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={98,-14})));
    Modelica.Blocks.Math.MultiProduct multiProduct(nu=2) annotation (Placement(
          transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={70,-10})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance1(
       k=1.250102626409427e-07*(5/4))
      annotation (Placement(transformation(extent={{-134,-12},{-126,-4}})));
    Modelica.Blocks.Math.MultiProduct multiProduct1(nu=2) annotation (Placement(
          transformation(
          extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-100,-12})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowLeft(redeclare package Medium =
          Blood) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-78,16})));
    Physiolibrary.Fluid.Components.Resistor VenResPulmo(redeclare package
        Medium =
          Blood, Resistance=7999343.2449*(3/8))
      annotation (Placement(transformation(extent={{-2,36},{18,56}})));
    Physiolibrary.Fluid.Components.Resistor ArtResPulmo(redeclare package
        Medium =
          Blood, Resistance=7999343.2449*((7/8)*3))
      annotation (Placement(transformation(extent={{-42,36},{-22,56}})));
    Physiolibrary.Fluid.Components.Resistor VenResBody(redeclare package Medium =
          Blood, Resistance=7999343.2449*(20/8)) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-32,-68})));
    Physiolibrary.Fluid.Components.Resistor ArtResBody(redeclare package Medium =
          Blood, Resistance=7999343.2449*((7/8)*20)) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={8,-68})));
    Physiolibrary.Fluid.Components.ElasticVessel SystemicArterties(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.0003,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0002,
      nPorts=2)
      annotation (Placement(transformation(extent={{-24,-104},{-4,-84}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureCAPB(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-8,-126},{12,-106}})));
  equation
    connect(LeftHeart.q_in,VeinsPulmo. q_in[1]) annotation (Line(
        points={{44,0},{44,47.7333},{43.9,47.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(LeftHeart.q_out,flowRight. q_in) annotation (Line(
        points={{44,-20},{44,-32}},
        color={127,0,0},
        thickness=0.5));
    connect(flowRight.q_out,ArteriesBody. q_in[1]) annotation (Line(
        points={{44,-52},{43.9,-66.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureVP.q_in,VeinsPulmo. q_in[1]) annotation (Line(
        points={{72,56},{72,47.7333},{43.9,47.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureVP.pressure,multiProduct. u[1]) annotation (Line(
          points={{82,58},{88,58},{88,-12.1},{76,-12.1}},
                                                      color={0,0,127}));
    connect(multiProduct.y,LeftHeart. solutionFlow)
      annotation (Line(points={{62.98,-10},{51,-10}},
                                                    color={0,0,127}));
    connect(hydraulicConductance.y,multiProduct. u[1])
      annotation (Line(points={{93,-14},{76,-14},{76,-12.1}},
                                                         color={0,0,127}));
    connect(RightHeart.q_out,flowLeft. q_in) annotation (Line(
        points={{-78,-2},{-78,6}},
        color={127,0,0},
        thickness=0.5));
    connect(flowLeft.q_out,ArteriesPulmo. q_in[1]) annotation (Line(
        points={{-78,26},{-78,49.7333},{-78.1,49.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureAP.q_in,ArteriesPulmo. q_in[1]) annotation (Line(
        points={{-104,50},{-104,49.7333},{-78.1,49.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(multiProduct1.y,RightHeart. solutionFlow)
      annotation (Line(points={{-92.98,-12},{-85,-12}},
                                                    color={0,0,127}));
    connect(hydraulicConductance1.y,multiProduct1. u[1]) annotation (Line(points={{-125,-8},
            {-106,-8},{-106,-9.9}},            color={0,0,127}));
    connect(RightHeart.q_in,VeinsBody. q_in[1]) annotation (Line(
        points={{-78,-22},{-78,-64.2667},{-78.1,-64.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureAB.q_in,ArteriesBody. q_in[1]) annotation (Line(
        points={{84,-98},{72,-98},{72,-66.2667},{43.9,-66.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(ArtResBody.q_in,ArteriesBody. q_in[2]) annotation (Line(
        points={{18,-68},{43.9,-68}},
        color={127,0,0},
        thickness=0.5));
    connect(ArtResBody.q_out,VenResBody. q_in) annotation (Line(
        points={{-2,-68},{-22,-68}},
        color={127,0,0},
        thickness=0.5));
    connect(VenResBody.q_out,VeinsBody. q_in[1]) annotation (Line(
        points={{-42,-68},{-78.1,-68},{-78.1,-64.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(SystemicArterties.q_in[1], VenResBody.q_in) annotation (Line(
        points={{-14.1,-92.7},{-14.1,-68},{-22,-68}},
        color={127,0,0},
        thickness=0.5));
    connect(ArtResPulmo.q_in,ArteriesPulmo. q_in[2]) annotation (Line(
        points={{-42,46},{-60,46},{-60,48},{-78.1,48}},
        color={127,0,0},
        thickness=0.5));
    connect(VeinsPulmo.q_in[2],VenResPulmo. q_out) annotation (Line(
        points={{43.9,46},{18,46}},
        color={127,0,0},
        thickness=0.5));
    connect(ArtResPulmo.q_out,VenResPulmo. q_in) annotation (Line(
        points={{-22,46},{-2,46}},
        color={127,0,0},
        thickness=0.5));
    connect(VeinsBody.q_in[2],pressureMeasureVB. q_in) annotation (Line(
        points={{-78.1,-66},{-128,-66},{-128,-60}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureVB.pressure,multiProduct1. u[1]) annotation (Line(
          points={{-118,-58},{-104,-58},{-104,-28},{-116,-28},{-116,-9.9},{-106,
            -9.9}},
          color={0,0,127}));
    connect(pressureMeasureCAPB.q_in, SystemicArterties.q_in[1]) annotation (Line(
        points={{-2,-122},{-14.1,-122},{-14.1,-92.7}},
        color={127,0,0},
        thickness=0.5));
    connect(PulmoArteries.q_in[1], VenResPulmo.q_in) annotation (Line(
        points={{-14.1,100},{-12,100},{-12,46},{-2,46}},
        color={127,0,0},
        thickness=0.5));
    annotation (
      experiment(StopTime=600, __Dymola_Algorithm="Dassl"),
      Diagram(coordinateSystem(extent={{-280,-140},{200,120}})),
      Icon(coordinateSystem(extent={{-280,-140},{200,120}})));
  end Bloodbasic;

  model Circulation_old
    Physiolibrary.Fluid.Components.VolumePump LeftHeart(
      redeclare package Medium = Blood,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={48,10})));
    Physiolibrary.Fluid.Components.VolumePump RightHeart(
      redeclare package Medium = Blood,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-74,8})));
    Physiolibrary.Fluid.Components.ElasticVessel VeinsPulmo(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.0004,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0004,
      nPorts=3) annotation (Placement(transformation(extent={{38,56},{58,76}})));
    Physiolibrary.Fluid.Components.ElasticVessel ArteriesPulmo(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00038,
      Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0003,
      nPorts=3) annotation (Placement(transformation(extent={{-84,58},{-64,78}})));
    Physiolibrary.Fluid.Components.ElasticVessel ArteriesBody(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00085,
      Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
      ZeroPressureVolume(displayUnit="l") = 0.00045,
      nPorts=3) annotation (Placement(transformation(extent={{38,-58},{58,-38}})));
    Physiolibrary.Fluid.Components.ElasticVessel VeinsBody(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00325,
      Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
      ZeroPressureVolume(displayUnit="l") = 0.00295,
      nPorts=3)
      annotation (Placement(transformation(extent={{-84,-56},{-64,-36}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureAB(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{82,-82},{102,-62}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowRight(redeclare package Medium
        = Blood) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={48,-22})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureVB(redeclare
        package Medium = Blood) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-120,-34})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureAP(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-106,66},{-86,86}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureVP(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{70,72},{90,92}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance(
        k=1.250102626409427e-07*(5/4)) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={102,6})));
    Modelica.Blocks.Math.MultiProduct multiProduct(nu=2) annotation (Placement(
          transformation(
          extent={{-6,-6},{6,6}},
          rotation=180,
          origin={74,10})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance1(
       k=1.250102626409427e-07*(5/4))
      annotation (Placement(transformation(extent={{-130,8},{-122,16}})));
    Modelica.Blocks.Math.MultiProduct multiProduct1(nu=2) annotation (Placement(
          transformation(
          extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-96,8})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowLeft(redeclare package Medium
        = Blood) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-74,36})));
    Physiolibrary.Fluid.Components.Resistor VenResPulmo(redeclare package
        Medium =
          Blood, Resistance=7999343.2449*(3/8))
      annotation (Placement(transformation(extent={{2,56},{22,76}})));
    Physiolibrary.Fluid.Components.Resistor ArtResPulmo(redeclare package
        Medium =
          Blood, Resistance=7999343.2449*((7/8)*3))
      annotation (Placement(transformation(extent={{-38,56},{-18,76}})));
    Physiolibrary.Fluid.Components.Resistor VenResBody(redeclare package Medium
        = Blood, Resistance=7999343.2449*(20/8)) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-28,-48})));
    Physiolibrary.Fluid.Components.Resistor ArtResBody(redeclare package Medium
        = Blood, Resistance=7999343.2449*((7/8)*20)) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={12,-48})));
    Physiolibrary.Fluid.Components.ElasticVessel elasticVessel(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.0003,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0002,
      nPorts=2) annotation (Placement(transformation(extent={{-20,-84},{0,-64}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureCAPB(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-4,-106},{16,-86}})));
    replaceable package Blood = Physiolibrary.Media.BloodBySiggaardAndersen annotation(choicesAllMatching=true);
    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package Medium =
          Blood) annotation (Placement(transformation(rotation=0, extent={{-27.5,
              89.5},{-2.5,110.5}})));
  equation
    connect(LeftHeart.q_in,VeinsPulmo. q_in[1]) annotation (Line(
        points={{48,20},{48,67.7333},{47.9,67.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(LeftHeart.q_out,flowRight. q_in) annotation (Line(
        points={{48,0},{48,-12}},
        color={127,0,0},
        thickness=0.5));
    connect(flowRight.q_out,ArteriesBody. q_in[1]) annotation (Line(
        points={{48,-32},{47.9,-46.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureVP.q_in,VeinsPulmo. q_in[2]) annotation (Line(
        points={{76,76},{76,66},{47.9,66}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureVP.pressure,multiProduct. u[1]) annotation (Line(
          points={{86,78},{92,78},{92,7.9},{80,7.9}}, color={0,0,127}));
    connect(multiProduct.y,LeftHeart. solutionFlow)
      annotation (Line(points={{66.98,10},{55,10}}, color={0,0,127}));
    connect(hydraulicConductance.y,multiProduct. u[2])
      annotation (Line(points={{97,6},{80,6},{80,12.1}}, color={0,0,127}));
    connect(RightHeart.q_out,flowLeft. q_in) annotation (Line(
        points={{-74,18},{-74,26}},
        color={127,0,0},
        thickness=0.5));
    connect(flowLeft.q_out,ArteriesPulmo. q_in[1]) annotation (Line(
        points={{-74,46},{-74,69.7333},{-74.1,69.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureAP.q_in,ArteriesPulmo. q_in[2]) annotation (Line(
        points={{-100,70},{-100,68},{-74.1,68}},
        color={127,0,0},
        thickness=0.5));
    connect(multiProduct1.y,RightHeart. solutionFlow)
      annotation (Line(points={{-88.98,8},{-81,8}}, color={0,0,127}));
    connect(hydraulicConductance1.y,multiProduct1. u[1]) annotation (Line(points={{-121,12},
            {-102,12},{-102,10.1}},            color={0,0,127}));
    connect(RightHeart.q_in,VeinsBody. q_in[1]) annotation (Line(
        points={{-74,-2},{-74,-44.2667},{-74.1,-44.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureAB.q_in,ArteriesBody. q_in[2]) annotation (Line(
        points={{88,-78},{76,-78},{76,-48},{47.9,-48}},
        color={127,0,0},
        thickness=0.5));
    connect(ArtResBody.q_in,ArteriesBody. q_in[3]) annotation (Line(
        points={{22,-48},{48,-48},{48,-49.7333},{47.9,-49.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(ArtResBody.q_out,VenResBody. q_in) annotation (Line(
        points={{2,-48},{-18,-48}},
        color={127,0,0},
        thickness=0.5));
    connect(VenResBody.q_out,VeinsBody. q_in[2]) annotation (Line(
        points={{-38,-48},{-74.1,-48},{-74.1,-46}},
        color={127,0,0},
        thickness=0.5));
    connect(elasticVessel.q_in[1],VenResBody. q_in) annotation (Line(
        points={{-10.1,-72.7},{-10.1,-48},{-18,-48}},
        color={127,0,0},
        thickness=0.5));
    connect(ArtResPulmo.q_in,ArteriesPulmo. q_in[3]) annotation (Line(
        points={{-38,66},{-56,66},{-56,66.2667},{-74.1,66.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(VeinsPulmo.q_in[3],VenResPulmo. q_out) annotation (Line(
        points={{47.9,64.2667},{34,64.2667},{34,66},{22,66}},
        color={127,0,0},
        thickness=0.5));
    connect(ArtResPulmo.q_out,VenResPulmo. q_in) annotation (Line(
        points={{-18,66},{2,66}},
        color={127,0,0},
        thickness=0.5));
    connect(VeinsBody.q_in[3],pressureMeasureVB. q_in) annotation (Line(
        points={{-74.1,-47.7333},{-124,-47.7333},{-124,-40}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasureVB.pressure,multiProduct1. u[2]) annotation (Line(
          points={{-114,-38},{-100,-38},{-100,-8},{-112,-8},{-112,5.9},{-102,5.9}},
          color={0,0,127}));
    connect(pressureMeasureCAPB.q_in,elasticVessel. q_in[2]) annotation (Line(
        points={{2,-102},{-10.1,-102},{-10.1,-75.3}},
        color={127,0,0},
        thickness=0.5));
    connect(q_in, VenResPulmo.q_in)
      annotation (Line(points={{-15,100},{-15,66},{2,66}}, color={127,0,0}));
    annotation (
      Diagram(coordinateSystem(extent={{-140,-110},{110,100}})),
      Icon(coordinateSystem(extent={{-140,-110},{110,100}})));
  end Circulation_old;

  model AlveolarUnit
    extends Physiolibrary.Icons.Lungs;
    Physiolibrary.Fluid.Components.ElasticVessel Alveols(
      redeclare package Medium = Air,
      useSubstances=true,
      use_mass_start=false,
      volume_start(displayUnit="l") = 0.0016,
      Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
      ZeroPressureVolume(displayUnit="l") = 0.0013,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=2) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={8,72})));
    Chemical.Components.GasSolubility CO2(KC=1e-4)
      annotation (Placement(transformation(extent={{8,-10},{28,10}})));
    Chemical.Components.GasSolubility O2(KC=1e-4)
      annotation (Placement(transformation(extent={{-26,-10},{-6,10}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-92,-8},{-72,12}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={70,-2})));
    Physiolibrary.Fluid.Components.ElasticVessel PulmoCapillaries(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.00015,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0001,
      nPorts=4) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-6,-50})));
    Physiolibrary.Fluid.Components.Conductor PulmonaryCon(redeclare package
        Medium = Physiolibrary.Media.BloodBySiggaardAndersen, Conductance=
          C_circulation*(8/7))
                          annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-64,-90})));
    Physiolibrary.Fluid.Components.Conductor conductor_in(redeclare package
        Medium = Air, Conductance(displayUnit="l/(cmH2O.s)") = C_ventilation)
      annotation (Placement(transformation(extent={{-46,60},{-26,80}})));
    Physiolibrary.Fluid.Components.Conductor PulmoVeins(redeclare package
        Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen, Conductance=
          C_circulation*(8))
      annotation (Placement(transformation(extent={{28,-98},{48,-78}})));
  //   parameter Physiolibrary.Types.HydraulicConductance c_perf=1.250102626409427e-07
  //       *((1 - 0.02)*(1/3));
    replaceable package Air =
                  Physiolibrary.Media.Air;
    parameter Physiolibrary.Types.HydraulicConductance C_ventilation=
        1.019716212977928e-05*(1/1.5);
    parameter Physiolibrary.Types.HydraulicConductance C_circulation=
        1.250102626409427e-07*(1/3);
    Physiolibrary.Fluid.Interfaces.FluidPorts_a q_in(redeclare package Medium =
          Air) annotation (Placement(transformation(rotation=0, extent={{32,76},
              {52,96}}), iconTransformation(extent={{32,76},{52,96}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in1(redeclare package Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen) annotation (Placement(
          transformation(rotation=0, extent={{36,-120},{56,-100}}),
          iconTransformation(extent={{36,-120},{56,-100}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in2(redeclare package Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen) annotation (Placement(
          transformation(rotation=0, extent={{-54,-120},{-34,-100}}),
          iconTransformation(extent={{-54,-120},{-34,-100}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in3(redeclare package Medium =
          Air) annotation (Placement(transformation(rotation=0, extent={{-54,80},
              {-34,100}}), iconTransformation(extent={{-54,80},{-34,100}})));
    Physiolibrary.Fluid.Components.Conductor conductor_out(redeclare package
        Medium = Air, Conductance(displayUnit="l/(cmH2O.s)") = C_ventilation)
      annotation (Placement(transformation(extent={{46,62},{66,82}})));
  equation
    connect(Alveols.q_in[1], conductor_in.q_out) annotation (Line(
        points={{6.7,71.9},{-26,71.9},{-26,70}},
        color={127,0,0},
        thickness=0.5));
    connect(O2.gas_port,Alveols. substances[1])
      annotation (Line(points={{-16,10},{-16,62},{8,62}},  color={158,66,200}));
    connect(CO2.gas_port,Alveols. substances[2])
      annotation (Line(points={{18,10},{18,62},{8,62}},color={158,66,200}));
    connect(O2.liquid_port,PulmoCapillaries. substances[2]) annotation (Line(
          points={{-16,-10},{-16,-30},{-10,-30},{-10,-40},{-6,-40}},
                                                           color={158,66,200}));
    connect(CO2.liquid_port,PulmoCapillaries. substances[3]) annotation (Line(
          points={{18,-10},{18,-40},{-6,-40}},         color={158,66,200}));
    connect(pO2.referenceFluidPort,PulmoCapillaries. q_in[1]) annotation (Line(
        points={{-82,-7.8},{-82,-49.9},{-4.05,-49.9}},
        color={127,0,0},
        thickness=0.5));
    connect(O2.liquid_port,pO2. port_a) annotation (Line(points={{-16,-10},{-16,-20},
            {-40,-20},{-40,2},{-72,2}},      color={158,66,200}));
    connect(CO2.liquid_port,pCO2. port_a) annotation (Line(points={{18,-10},{18,-22},
            {86,-22},{86,-2},{80,-2}},
                                     color={158,66,200}));
    connect(PulmonaryCon.q_out,PulmoCapillaries. q_in[2]) annotation (Line(
        points={{-74,-90},{-82,-90},{-82,-54},{-24,-54},{-24,-49.9},{-5.35,-49.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2.referenceFluidPort,PulmoCapillaries. q_in[3]) annotation (Line(
        points={{70,-11.8},{70,-49.9},{-6.65,-49.9}},
        color={127,0,0},
        thickness=0.5));
    connect(q_in2, PulmonaryCon.q_in) annotation (Line(points={{-44,-110},{-44,
            -90},{-54,-90}},
                        color={127,0,0}));
    connect(q_in3, conductor_in.q_in)
      annotation (Line(points={{-44,90},{-44,70},{-46,70}}, color={127,0,0}));
    connect(PulmoVeins.q_out, q_in1) annotation (Line(
        points={{48,-88},{46,-88},{46,-110}},
        color={127,0,0},
        thickness=0.5));
    connect(PulmoVeins.q_in, PulmoCapillaries.q_in[4]) annotation (Line(
        points={{28,-88},{14,-88},{14,-49.9},{-7.95,-49.9}},
        color={127,0,0},
        thickness=0.5));
    connect(conductor_out.q_in, Alveols.q_in[2]) annotation (Line(
        points={{46,72},{9.3,72},{9.3,71.9}},
        color={127,0,0},
        thickness=0.5));
    connect(conductor_out.q_out, q_in) annotation (Line(
        points={{66,72},{42,72},{42,86}},
        color={127,0,0},
        thickness=0.5));
    annotation (Diagram(coordinateSystem(extent={{-100,-110},{100,90}})), Icon(
          coordinateSystem(extent={{-100,-110},{100,90}})));
  end AlveolarUnit;

  model VentRegulation
    extends Physiolibrary.Icons.RespiratoryCenter;
    Physiolibrary.Types.Constants.PressureConst pressure(k(displayUnit="kPa")=
           4800) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={-34,-66})));
    Modelica.Blocks.Math.Add x(k2=-1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-40,-40})));
    Modelica.Blocks.Math.Product Vv_nonregulated annotation (Placement(
          transformation(
          extent={{-7,-7},{7,7}},
          rotation=90,
          origin={37,23})));
    Modelica.Blocks.Math.Max Vv_val annotation (Placement(transformation(
          extent={{-7,-7},{7,7}},
          rotation=180,
          origin={5,49})));
    Modelica.Blocks.Sources.Constant const(k=0)
      annotation (Placement(transformation(extent={{-5,-5},{5,5}},
          rotation=180,
          origin={25,43})));
    Modelica.Blocks.Interfaces.RealInput paCO2 annotation (Placement(
          transformation(
          rotation=90,
          extent={{-19,-19},{19,19}},
          origin={-47,-79}),iconTransformation(
          extent={{-19,-19},{19,19}},
          rotation=90,
          origin={-47,-79})));
    Modelica.Blocks.Interfaces.RealOutput Vv annotation (Placement(transformation(
          rotation=180,
          extent={{-14,-14},{14,14}},
          origin={-124,54}), iconTransformation(
          extent={{-14,-14},{14,14}},
          rotation=180,
          origin={-124,54})));
    Physiolibrary.Types.Constants.VolumeConst cc(k(displayUnit="l") = 0.00035)
      annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={-70,36})));
    Physiolibrary.Types.Constants.FrequencyConst m(k=0.505) annotation (Placement(
          transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={-34,40})));
    Modelica.Blocks.Math.Division Vv_m annotation (Placement(transformation(
          extent={{7,-7},{-7,7}},
          rotation=0,
          origin={-57,45})));
    Modelica.Blocks.Math.Add Vt annotation (Placement(transformation(
          extent={{-7,-7},{7,7}},
          rotation=180,
          origin={-89,41})));
    Modelica.Blocks.Math.Division RRval annotation (Placement(transformation(
          extent={{6,-6},{-6,6}},
          rotation=0,
          origin={-80,-8})));
    Modelica.Blocks.Interfaces.RealOutput RR annotation (Placement(transformation(
          rotation=180,
          extent={{-14,-14},{14,14}},
          origin={-126,-8}), iconTransformation(
          extent={{-14,-14},{14,14}},
          rotation=90,
          origin={6,98})));
    Modelica.Blocks.Math.Min Vt_cond
      annotation (Placement(transformation(extent={{-92,-50},{-78,-36}})));
    Physiolibrary.Types.Constants.VolumeConst volume(k(displayUnit="l") = 0.0023)
      annotation (Placement(transformation(extent={{-112,-64},{-104,-56}})));
    Modelica.Blocks.Interfaces.RealInput paO2 annotation (Placement(
          transformation(
          rotation=90,
          extent={{-19,-19},{19,19}},
          origin={23,-79}), iconTransformation(
          extent={{-19,-19},{19,19}},
          rotation=90,
          origin={37,-79})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst W(k(displayUnit="l/min")
         = 0.001925) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={-12,-66})));
    Physiolibrary.Types.Constants.PressureConst Cp(k(displayUnit="kPa") = 4300)
      annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={44,-70})));
    Modelica.Blocks.Math.Add Pdiff(k2=-1) annotation (Placement(transformation(
          extent={{-7,-7},{7,7}},
          rotation=90,
          origin={29,-43})));
    Modelica.Blocks.Math.Division slopeVv annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=90,
          origin={-6,-4})));
    Modelica.Blocks.Math.Min min1 annotation (Placement(transformation(
          extent={{-7,-7},{7,7}},
          rotation=90,
          origin={19,-23})));
    Physiolibrary.Types.Constants.PressureConst Pmax(k(displayUnit="kPa") = 700)
      annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={2,-54})));
  equation
    connect(pressure.y, x.u2)
      annotation (Line(points={{-34,-61},{-34,-52}},
                                                   color={0,0,127}));
    connect(x.y, Vv_nonregulated.u1)
      annotation (Line(points={{-40,-29},{-40,14},{32.8,14},{32.8,14.6}},
                                                  color={0,0,127}));
    connect(Vv_nonregulated.y, Vv_val.u2)
      annotation (Line(points={{37,30.7},{37,53.2},{13.4,53.2}},
                                                               color={0,0,127}));
    connect(paCO2, x.u1) annotation (Line(points={{-47,-79},{-48,-79},{-48,-56},
            {-46,-56},{-46,-52}},
                       color={0,0,127}));
    connect(Vv_val.u1, const.y) annotation (Line(points={{13.4,44.8},{18,44.8},
            {18,43},{19.5,43}},
                            color={0,0,127}));
    connect(cc.y, Vt.u1) annotation (Line(points={{-75,36},{-80.6,36},{-80.6,
            36.8}},
          color={0,0,127}));
    connect(Vv, Vv_val.y) annotation (Line(points={{-124,54},{-14,54},{-14,49},
            {-2.7,49}},
                  color={0,0,127}));
    connect(Vt.y, Vt_cond.u1) annotation (Line(points={{-96.7,41},{-104,41},{
            -104,-38.8},{-93.4,-38.8}},
                                   color={0,0,127}));
    connect(volume.y, Vt_cond.u2) annotation (Line(points={{-103,-60},{-93.4,-60},
            {-93.4,-47.2}}, color={0,0,127}));
    connect(RRval.u1, Vv_val.y) annotation (Line(points={{-72.8,-4.4},{-72.8,28},
            {-14,28},{-14,49},{-2.7,49}},
                                color={0,0,127}));
    connect(Vt_cond.y, RRval.u2) annotation (Line(points={{-77.3,-43},{-72,-43},
            {-72,-11.6},{-72.8,-11.6}},
                                 color={0,0,127}));
    connect(Vv_m.y, Vt.u2) annotation (Line(points={{-64.7,45},{-80.6,45},{
            -80.6,45.2}},
          color={0,0,127}));
    connect(m.y, Vv_m.u2) annotation (Line(points={{-39,40},{-44,40},{-44,40.8},
            {-48.6,40.8}},
                    color={0,0,127}));
    connect(Vv_m.u1, Vv_val.y) annotation (Line(points={{-48.6,49.2},{-2.7,49.2},
            {-2.7,49}},color={0,0,127}));
    connect(RRval.y, RR)
      annotation (Line(points={{-86.6,-8},{-126,-8}}, color={0,0,127}));
    connect(paO2, Pdiff.u1) annotation (Line(points={{23,-79},{24.8,-79},{24.8,
            -51.4}}, color={0,0,127}));
    connect(Cp.y, Pdiff.u2) annotation (Line(points={{44,-65},{44,-56},{33.2,
            -56},{33.2,-51.4}}, color={0,0,127}));
    connect(W.y, slopeVv.u1) annotation (Line(points={{-12,-61},{-10,-61},{-10,
            -11.2},{-9.6,-11.2}}, color={0,0,127}));
    connect(Pdiff.y, min1.u2) annotation (Line(points={{29,-35.3},{29,-31.4},{
            23.2,-31.4}}, color={0,0,127}));
    connect(Pmax.y, min1.u1) annotation (Line(points={{2,-49},{2,-31.4},{14.8,
            -31.4}}, color={0,0,127}));
    connect(min1.y, slopeVv.u2) annotation (Line(points={{19,-15.3},{19,-14},{2,
            -14},{2,-26},{-2.4,-26},{-2.4,-11.2}}, color={0,0,127}));
    connect(slopeVv.y, Vv_nonregulated.u2) annotation (Line(points={{-6,2.6},{
            -6,6},{41.2,6},{41.2,14.6}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(extent={{-120,-80},{60,80}})),Icon(
          coordinateSystem(extent={{-120,-80},{60,80}})));
  end VentRegulation;
  annotation (uses(
      Physiolibrary(version="3.0.0-alpha8"),
      Modelica(version="4.0.0"),
      Chemical(version="1.4.0")));
end Hack_Maduda_friday;
