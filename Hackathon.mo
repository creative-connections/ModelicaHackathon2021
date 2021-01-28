within ;
package Hackathon
  model Circulation2
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
    Physiolibrary.Fluid.Components.Resistor VenResBody(redeclare package Medium
        = Blood, Resistance=7999343.2449*(20/8)) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-48,-48})));
    Physiolibrary.Fluid.Components.Resistor ArtResBody(redeclare package Medium
        = Blood, Resistance=7999343.2449*((7/8)*20)) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={12,-48})));
    replaceable package Blood = Physiolibrary.Media.BloodBySiggaardAndersen annotation(choicesAllMatching=true);
    Physiolibrary.Fluid.Interfaces.FluidPort_a SystemicCapOut(redeclare package
        Medium = Blood) annotation (Placement(transformation(rotation=0, extent={
              {-27.5,-110},{-2.5,-90}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a PulmoCapillariesIn(redeclare
        package Medium = Blood) annotation (Placement(transformation(rotation=0,
            extent={{-53.5,88},{-28.5,108}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b PulmoCapillariesOut
      annotation (Placement(transformation(extent={{-14,88},{6,108}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b SystemicCapillariesIn
      annotation (Placement(transformation(extent={{-74,-110},{-54,-90}})));
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
    connect(ArtResBody.q_in,ArteriesBody. q_in[3]) annotation (Line(
        points={{22,-48},{48,-48},{48,-49.7333},{47.9,-49.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(VeinsPulmo.q_in[3],VenResPulmo. q_out) annotation (Line(
        points={{47.9,64.2667},{34,64.2667},{34,66},{22,66}},
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
    connect(ArtResBody.q_out, SystemicCapOut) annotation (Line(
        points={{2,-48},{-15,-48},{-15,-100}},
        color={127,0,0},
        thickness=0.5));
    connect(VenResBody.q_in, SystemicCapillariesIn) annotation (Line(
        points={{-38,-48},{-38,-100},{-64,-100}},
        color={127,0,0},
        thickness=0.5));
    connect(VenResPulmo.q_in, PulmoCapillariesOut) annotation (Line(
        points={{2,66},{-4,66},{-4,98}},
        color={127,0,0},
        thickness=0.5));
    connect(PulmoCapillariesIn, ArteriesPulmo.q_in[3]) annotation (Line(
        points={{-41,98},{-40,98},{-40,66.2667},{-74.1,66.2667}},
        color={127,0,0},
        thickness=0.5));
    annotation (
      Diagram(coordinateSystem(extent={{-140,-100},{110,100}})),
      Icon(coordinateSystem(extent={{-140,-100},{110,100}})));
  end Circulation2;

  model resp
    parameter Physiolibrary.Types.Frequency RR=0.28333333333333
                                               "Respiration Rate";
    parameter Physiolibrary.Types.Volume TV=0.0005 "Tidal Volume",
                                             DV=0.00015 "Dead space";
    package Air = Physiolibrary.Media.Air;
    //parameter Physiolibrary.Types.HydraulicConductance C "Total Lung Conductance";
    //parameter integer N "Number of Lungs Compartments";
    Physiolibrary.Fluid.Sources.PressureSource pressureSource(redeclare package
        Medium = Air)
      annotation (Placement(transformation(extent={{-102,50},{-82,70}})));
    Physiolibrary.Fluid.Components.VolumePump DeadSpace(
      redeclare package Medium = Air,                   useSolutionFlowInput=false,
        SolutionFlow=DV*RR)
      annotation (Placement(transformation(extent={{-18,76},{2,96}})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource volumeOutflowSource(
        SolutionFlow=TV*RR, redeclare package Medium = Air)
      annotation (Placement(transformation(extent={{70,50},{90,70}})));
    Physiolibrary.Fluid.Components.ElasticVessel Alveols(
      redeclare package Medium = Air,
      useSubstances=true,
      use_mass_start=false,
      volume_start(displayUnit="l") = 0.0016,
      Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
      ZeroPressureVolume(displayUnit="l") = 0.0013,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=2)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={4,40})));
    Physiolibrary.Fluid.Components.Conductor conductor(redeclare package Medium
        = Air, Conductance(displayUnit="l/(cmH2O.s)") = 1.019716212977928e-05*(1/
        1.5))
      annotation (Placement(transformation(extent={{-50,28},{-30,48}})));
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
          origin={0,-60})));
    Physiolibrary.Fluid.Components.Resistor PulmonaryRes(Resistance=
          7999343.2449*(3*(7/8)))
      annotation (Placement(transformation(extent={{-44,-100},{-24,-80}})));
    Physiolibrary.Fluid.Components.Resistor systemicRes(redeclare package
        Medium = Physiolibrary.Media.BloodBySiggaardAndersen, Resistance=
          7999343.2449*(20*(7/8)))
      annotation (Placement(transformation(extent={{34,-138},{54,-118}})));
    Physiolibrary.Fluid.Components.ElasticVessel SystemCapillaries(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0003,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0002,
      nPorts=2)
      annotation (Placement(transformation(extent={{-32,-160},{-12,-140}})));
    Chemical.Sources.SubstanceInflowT CO2Production(
      SubstanceFlow(displayUnit="mmol/min") = 0.00020566666666667,
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas()) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={46,-186})));
    Chemical.Sources.SubstanceOutflow O2Consumption(SubstanceFlow(displayUnit=
            "mmol/min") = 0.00025666666666667) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-100,-150})));
    Circulation2 circulation2_1
      annotation (Placement(transformation(extent={{-8,-116},{16,-96}})));
  equation
    connect(volumeOutflowSource.q_in, DeadSpace.q_out) annotation (Line(
        points={{70,60},{22,60},{22,86},{2,86}},
        color={127,0,0},
        thickness=0.5));
    connect(DeadSpace.q_in, pressureSource.y) annotation (Line(
        points={{-18,86},{-72,86},{-72,60},{-82,60}},
        color={127,0,0},
        thickness=0.5));
    connect(conductor.q_in, pressureSource.y) annotation (Line(
        points={{-50,38},{-72,38},{-72,60},{-82,60}},
        color={127,0,0},
        thickness=0.5));
    connect(Alveols.q_in[1], conductor.q_out) annotation (Line(
        points={{2.7,39.9},{-30,39.9},{-30,38}},
        color={127,0,0},
        thickness=0.5));
    connect(Alveols.q_in[2], volumeOutflowSource.q_in) annotation (Line(
        points={{5.3,39.9},{62,39.9},{62,60},{70,60}},
        color={127,0,0},
        thickness=0.5));
    connect(O2.gas_port, Alveols.substances[1])
      annotation (Line(points={{-16,10},{-16,30},{4,30}},  color={158,66,200}));
    connect(CO2.gas_port, Alveols.substances[2])
      annotation (Line(points={{18,10},{18,30},{4,30}},color={158,66,200}));
    connect(O2.liquid_port, PulmoCapillaries.substances[2]) annotation (Line(
          points={{-16,-10},{-16,-40},{0,-40},{0,-50}},    color={158,66,200}));
    connect(CO2.liquid_port, PulmoCapillaries.substances[3]) annotation (Line(
          points={{18,-10},{18,-40},{0,-40},{0,-50}},  color={158,66,200}));
    connect(pCO2.referenceFluidPort, PulmoCapillaries.q_in[1]) annotation (Line(
        points={{70,-11.8},{70,-60},{4,-60},{4,-59.9},{1.95,-59.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pO2.referenceFluidPort, PulmoCapillaries.q_in[2]) annotation (Line(
        points={{-82,-7.8},{-82,-59.9},{0.65,-59.9}},
        color={127,0,0},
        thickness=0.5));
    connect(O2.liquid_port, pO2.port_a) annotation (Line(points={{-16,-10},{-16,
            -20},{-40,-20},{-40,2},{-72,2}}, color={158,66,200}));
    connect(CO2.liquid_port, pCO2.port_a) annotation (Line(points={{18,-10},{18,
            -22},{86,-22},{86,-2},{80,-2}},
                                     color={158,66,200}));
    connect(PulmonaryRes.q_in, PulmoCapillaries.q_in[3]) annotation (Line(
        points={{-44,-90},{-50,-90},{-50,-59.9},{-0.65,-59.9}},
        color={127,0,0},
        thickness=0.5));
    connect(systemicRes.q_out, SystemCapillaries.q_in[1]) annotation (Line(
        points={{54,-128},{78,-128},{78,-148.7},{-22.1,-148.7}},
        color={127,0,0},
        thickness=0.5));
    connect(SystemCapillaries.substances[2], O2Consumption.port_a)
      annotation (Line(points={{-32,-150},{-90,-150}}, color={158,66,200}));
    connect(CO2Production.port_b, SystemCapillaries.substances[3]) annotation (
        Line(points={{36,-186},{-40,-186},{-40,-150},{-32,-150}}, color={158,66,
            200}));
    connect(circulation2_1.PulmoCapillariesIn, PulmonaryRes.q_out) annotation (
        Line(
        points={{1.504,-96.2},{1.504,-90},{-24,-90}},
        color={127,0,0},
        thickness=0.5));
    connect(circulation2_1.PulmoCapillariesOut, PulmoCapillaries.q_in[4])
      annotation (Line(
        points={{5.056,-96.2},{5.056,-82},{-1.95,-82},{-1.95,-59.9}},
        color={127,0,0},
        thickness=0.5));
    connect(circulation2_1.SystemicCapOut, systemicRes.q_in) annotation (Line(
        points={{4,-116},{6,-116},{6,-128},{34,-128}},
        color={127,0,0},
        thickness=0.5));
    connect(circulation2_1.SystemicCapillariesIn, SystemCapillaries.q_in[2])
      annotation (Line(
        points={{-0.704,-116},{0,-116},{0,-124},{-22.1,-124},{-22.1,-151.3}},
        color={127,0,0},
        thickness=0.5));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-280,
              -200},{240,100}})),
                            Diagram(coordinateSystem(preserveAspectRatio=false,
            extent={{-280,-200},{240,100}})));
  end resp;

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
    Physiolibrary.Fluid.Sensors.FlowMeasure flowRight(redeclare package Medium
        = Physiolibrary.Media.BloodBySiggaardAndersen)
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
    Physiolibrary.Fluid.Sensors.FlowMeasure flowRight(redeclare package Medium
        = Blood) annotation (Placement(transformation(
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
    Physiolibrary.Fluid.Sensors.FlowMeasure flowLeft(redeclare package Medium
        = Blood) annotation (Placement(transformation(
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
    Physiolibrary.Fluid.Components.Resistor VenResBody(redeclare package Medium
        = Blood, Resistance=7999343.2449*(20/8)) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-32,-68})));
    Physiolibrary.Fluid.Components.Resistor ArtResBody(redeclare package Medium
        = Blood, Resistance=7999343.2449*((7/8)*20)) annotation (Placement(
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

  model Circulation
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
  end Circulation;

  model WholeModel
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end WholeModel;
  annotation (uses(
      Physiolibrary(version="3.0.0-alpha8"),
      Modelica(version="4.0.0"),
      Chemical(version="1.4.0")));
end Hackathon;