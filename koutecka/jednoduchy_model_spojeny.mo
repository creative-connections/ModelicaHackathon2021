within ;

model jednoduchy_model_spojeny
    replaceable package Blood =
        Physiolibrary.Media.BloodBySiggaardAndersen annotation(choicesAllMatching=True);
    replaceable package Air =
        Physiolibrary.Media.Air annotation(choicesAllMatching=True);

    parameter Physiolibrary.Types.Frequency RR=0.286
                                                "Respiration rate";
    parameter Physiolibrary.Types.Volume TV=0.0005
                                                "Tidal volume";
    parameter Physiolibrary.Types.Volume DV=0.00015
                                                 "Dead space volume";

    parameter Physiolibrary.Types.Fraction fractionLungsShunt=0.05;
    parameter Physiolibrary.Types.HydraulicConductance cPerfusion=1.250102626409427e-07*(((((1/3)*(1 - 0.05)))));
    parameter Physiolibrary.Types.HydraulicConductance cShunt=1.250102626409427e-07*(((((1/3)*0.05))));

    parameter Integer NA = 10 "Number of alveolar units";

  Physiolibrary.Fluid.Components.VolumePump deadSpaceVolumePump(redeclare package Medium = Air, SolutionFlow=DV*RR)
    annotation (Placement(transformation(extent={{-10,128},{10,148}})));
  Physiolibrary.Fluid.Sources.PressureSource pressureSource(redeclare package Medium = Air)
    annotation (Placement(transformation(extent={{-92,128},{-72,148}})));
  Physiolibrary.Fluid.Sources.VolumeOutflowSource volumeOutflow(SolutionFlow=TV*RR, redeclare package Medium = Air)
    annotation (Placement(transformation(extent={{68,128},{88,148}})));
  Physiolibrary.Fluid.Components.Resistor systemicResistanceA(redeclare package Medium = Blood, Resistance=
        7999343.2449*(20*(7/8))) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={22,-140})));
  Physiolibrary.Fluid.Components.VolumePump leftHeartPump(
    redeclare package Medium = Blood,
    useSolutionFlowInput=true,
    SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={46,-96})));
  Physiolibrary.Fluid.Components.VolumePump rightHeartPump(
    redeclare package Medium = Blood,
    useSolutionFlowInput=true,
    SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-46,-96})));
  Physiolibrary.Fluid.Components.ElasticVessel pulmonaryArteries(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.00038,
    Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0003,
    nPorts=12)
              annotation (Placement(transformation(extent={{-56,-28},{-36,-8}})));
  Physiolibrary.Fluid.Components.ElasticVessel pulmonaryVeins(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.0004,
    Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0004,
    nPorts=3) annotation (Placement(transformation(extent={{36,-28},{56,-8}})));
  Physiolibrary.Fluid.Components.ElasticVessel systemicArteries(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.00085,
    Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
    ZeroPressureVolume(displayUnit="l") = 0.00045,
    nPorts=3) annotation (Placement(transformation(extent={{36,-152},{56,-132}})));
  Physiolibrary.Fluid.Components.ElasticVessel systemicVeins(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.00325,
    Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
    ZeroPressureVolume(displayUnit="l") = 0.00295,
    nPorts=3) annotation (Placement(transformation(extent={{-56,-152},{-36,-132}})));
  Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureArteries(redeclare package Medium = Blood)
    annotation (Placement(transformation(extent={{58,-148},{78,-128}})));
  Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureVeins(redeclare package Medium = Blood)
                                                                   annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-68,-138})));
  Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasurePulmArteries(redeclare package Medium = Blood)
    annotation (Placement(transformation(extent={{-56,-24},{-76,-4}})));
  Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasurePulmVeins(redeclare package Medium = Blood)
    annotation (Placement(transformation(extent={{56,-24},{76,-4}})));
  Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance(k=1.250102626409427e-07*(5/4))
                                     annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={76,-112})));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu=2) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={66,-96})));
  Modelica.Blocks.Math.MultiProduct multiProduct1(nu=2) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-66,-96})));
  Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance1(k=1.250102626409427e-07*(5/4))
                                    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-76,-78})));
  Physiolibrary.Fluid.Components.Resistor systemicResistanceB(redeclare package Medium = Blood, Resistance=
        7999343.2449*(20*(1/8))) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-22,-140})));
  Physiolibrary.Fluid.Components.ElasticVessel systemicCapillaries(
    redeclare package Medium = Blood,
    useSubstances=true,
    volume_start(displayUnit="l") = 0.0003,
    Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0002,
    nPorts=5) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-170})));
  Physiolibrary.Fluid.Sensors.PressureMeasure
    pressureMeasureSystemicCapillaries(redeclare package Medium = Blood)
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={62,-164})));
  Chemical.Sources.SubstanceOutflow O2_left(SubstanceFlow(displayUnit="mmol/min") = 1.666666666666667e-05*(2*7.71))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,-208})));
  Chemical.Sources.SubstanceInflowT CO2_left(
    SubstanceFlow(displayUnit="mmol/min") = 1.666666666666667e-05*(2*6.17),
    redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
    substanceData=Chemical.Substances.CarbonDioxide_gas()) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,-208})));
  Physiolibrary.Fluid.Sensors.PartialPressure pO2_tissue(
    redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
    substanceData=Chemical.Substances.Oxygen_gas(),
    redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
    annotation (Placement(transformation(extent={{-50,-180},{-30,-200}})));
  Physiolibrary.Fluid.Sensors.PartialPressure pCO2_tissue(
    redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
    substanceData=Chemical.Substances.CarbonDioxide_gas(),
    redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
    annotation (Placement(transformation(extent={{50,-180},{30,-200}})));
  Physiolibrary.Fluid.Components.Conductor shuntConductance(redeclare package Medium = Blood, Conductance(
        displayUnit="l/(cmH2O.s)") = cShunt) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,-20})));
  AlveolarUnit alveolarUnit[NA](
    redeclare package Blood = Blood,
    redeclare package Air = Air,
    cPerfusion=cPerfusion) annotation (Placement(transformation(rotation=0, extent={{-10,46},{10,66}})));
equation
  connect(deadSpaceVolumePump.q_out,volumeOutflow. q_in)
    annotation (Line(
      points={{10,138},{68,138}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureSource.y,deadSpaceVolumePump. q_in)
    annotation (Line(
      points={{-72,138},{-10,138}},
      color={127,0,0},
      thickness=0.5));
  connect(rightHeartPump.q_out,pulmonaryArteries. q_in[1]) annotation (Line(
      points={{-46,-86},{-46,-32},{-46.1,-32},{-46.1,-15.6167}},
      color={127,0,0},
      thickness=0.5));
  connect(leftHeartPump.q_in,pulmonaryVeins. q_in[1])
    annotation (Line(
      points={{46,-86},{46,-16},{45.9,-16},{45.9,-16.2667}},
      color={127,0,0},
      thickness=0.5));
  connect(systemicResistanceA.q_in,systemicArteries. q_in[1])
    annotation (Line(
      points={{32,-140},{45.9,-140},{45.9,-140.267}},
      color={127,0,0},
      thickness=0.5));
  connect(leftHeartPump.q_out,systemicArteries. q_in[2])
    annotation (Line(
      points={{46,-106},{46,-142},{45.9,-142}},
      color={127,0,0},
      thickness=0.5));
  connect(rightHeartPump.q_in,systemicVeins. q_in[1]) annotation (Line(
      points={{-46,-106},{-46,-140.267},{-46.1,-140.267}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasureArteries.q_in,systemicArteries. q_in[3])
    annotation (Line(
      points={{64,-144},{45.9,-144},{45.9,-143.733}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasureVeins.q_in,systemicVeins. q_in[2]) annotation (Line(
      points={{-64,-144},{-46,-144},{-46,-142},{-46.1,-142}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasurePulmArteries.q_in,pulmonaryArteries. q_in[2])
    annotation (Line(
      points={{-62,-20},{-46,-20},{-46,-16.05},{-46.1,-16.05}},
      color={127,0,0},
      thickness=0.5));
  connect(pulmonaryVeins.q_in[2],pressureMeasurePulmVeins. q_in) annotation (Line(
      points={{45.9,-18},{46,-18},{46,-20},{62,-20}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasurePulmVeins.pressure,multiProduct. u[1]) annotation (
      Line(points={{72,-18},{72,-98.1}},                       color={0,0,127}));
  connect(hydraulicConductance.y,multiProduct. u[2]) annotation (Line(points={{76,-107},{76,-98},{72,-98},{72,-93.9}},
                                         color={0,0,127}));
  connect(multiProduct.y,leftHeartPump. solutionFlow)
    annotation (Line(points={{58.98,-96},{53,-96}},
                                                  color={0,0,127}));
  connect(multiProduct1.y,rightHeartPump. solutionFlow)
    annotation (Line(points={{-58.98,-96},{-53,-96}},
                                                    color={0,0,127}));
  connect(hydraulicConductance1.y,multiProduct1. u[1]) annotation (Line(points={{-76,-83},{-76,-94},{-72,-94},{-72,-93.9}},
                                                  color={0,0,127}));
  connect(pressureMeasureVeins.pressure,multiProduct1. u[2]) annotation (Line(
        points={{-74,-142},{-76,-142},{-76,-98.1},{-72,-98.1}},
                                                            color={0,0,127}));
  connect(systemicResistanceB.q_out,systemicVeins. q_in[3]) annotation (Line(
      points={{-32,-140},{-46,-140},{-46,-144},{-46.1,-144},{-46.1,-143.733}},
      color={127,0,0},
      thickness=0.5));
  connect(systemicResistanceB.q_in,systemicCapillaries. q_in[1]) annotation (Line(
      points={{-12,-140},{0,-140},{0,-170.1},{-2.08,-170.1}},
      color={127,0,0},
      thickness=0.5));
  connect(systemicResistanceA.q_out,systemicCapillaries. q_in[2])
    annotation (Line(
      points={{12,-140},{0,-140},{0,-170.1},{-1.04,-170.1}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasureSystemicCapillaries.q_in,systemicCapillaries. q_in[3])
    annotation (Line(
      points={{58,-170},{30,-170},{30,-170.1},{1.11022e-16,-170.1}},
      color={127,0,0},
      thickness=0.5));
  connect(systemicCapillaries.substances[2], O2_left.port_a)
    annotation (Line(points={{-8.88178e-16,-180},{-8.88178e-16,-208},{-60,-208}}, color={158,66,200}));
  connect(systemicCapillaries.substances[3], CO2_left.port_b)
    annotation (Line(points={{-8.88178e-16,-180},{-8.88178e-16,-208},{60,-208}}, color={158,66,200}));
  connect(pO2_tissue.referenceFluidPort, systemicCapillaries.q_in[4]) annotation (Line(
      points={{-40,-180.2},{-40,-178},{0,-178},{0,-170},{2,-170},{2,-170.1},{1.04,-170.1}},
      color={127,0,0},
      thickness=0.5));
  connect(pO2_tissue.port_a, O2_left.port_a)
    annotation (Line(points={{-30,-190},{-24,-190},{-24,-208},{-60,-208}}, color={158,66,200}));
  connect(pCO2_tissue.referenceFluidPort, systemicCapillaries.q_in[5]) annotation (Line(
      points={{40,-180.2},{40,-178},{0,-178},{0,-170},{2.08,-170},{2.08,-170.1}},
      color={127,0,0},
      thickness=0.5));
  connect(pCO2_tissue.port_a, CO2_left.port_b)
    annotation (Line(points={{30,-190},{24,-190},{24,-208},{60,-208}}, color={158,66,200}));
  connect(shuntConductance.q_out, alveolarUnit.q_out1)
    annotation (Line(
      points={{10,-20},{16,-20},{16,46},{4,46}},
      color={127,0,0},
      thickness=0.5));
  connect(shuntConductance.q_in, alveolarUnit.q_in1)
    annotation (Line(
      points={{-10,-20},{-16,-20},{-16,46},{-4,46}},
      color={127,0,0},
      thickness=0.5));
  connect(alveolarUnit.q_out1, pulmonaryVeins.q_in[3]) annotation (Line(
      points={{4,46},{30,46},{30,-16},{45.9,-16},{45.9,-19.7333}},
      color={127,0,0},
      thickness=0.5));
  connect(pulmonaryArteries.q_in[3:12], alveolarUnit.q_in1) annotation (Line(
      points={{-46.1,-20.3833},{-46.1,-34},{-16,-34},{-16,46},{-4,46}},
      color={127,0,0},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-220},{100,160}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-220},{100,160}})),
    uses(
      Physiolibrary(version="3.0.0-alpha7"),
      Modelica(version="4.0.0"),
      Chemical(version="1.4.0-alpha7")));
end jednoduchy_model_spojeny;
