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
    parameter Physiolibrary.Types.HydraulicConductance cPerfusion=1.250102626409427e-07*(((1/3)*(1 - 0.05)));
    parameter Physiolibrary.Types.HydraulicConductance cShunt=1.250102626409427e-07*(((1/3)*0.05));
  Physiolibrary.Fluid.Components.VolumePump deadSpaceVolumePump(redeclare package Medium = Air, SolutionFlow=DV*RR)
    annotation (Placement(transformation(extent={{-10,128},{10,148}})));
  Physiolibrary.Fluid.Sources.PressureSource pressureSource(redeclare package Medium = Air)
    annotation (Placement(transformation(extent={{-92,128},{-72,148}})));
  Physiolibrary.Fluid.Components.ElasticVessel alveoli(
    redeclare package Medium = Air,
    useSubstances=true,
    onElectricGround=false,
    volume_start(displayUnit="l") = 0.0023,
    Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
    ZeroPressureVolume(displayUnit="l") = 0.0013,
    ExternalPressure(displayUnit="mmHg") = 100791.72488574,
    nPorts=2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,102})));
  Physiolibrary.Fluid.Sources.VolumeOutflowSource volumeOutflow(SolutionFlow=TV*RR, redeclare package Medium = Air)
    annotation (Placement(transformation(extent={{68,128},{88,148}})));
  Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureInAlveoli(redeclare package Medium = Air)
    annotation (Placement(transformation(extent={{-38,92},{-18,112}})));
  Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureOutAlveoli(redeclare package Medium = Air)
    annotation (Placement(transformation(extent={{18,92},{38,112}})));
  Physiolibrary.Fluid.Components.Conductor conductor(redeclare package Medium = Air, Conductance(displayUnit=
          "l/(cmH2O.s)") = 1.5295743194669e-05) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-58,112})));
  Chemical.Components.GasSolubility O2(KC=1e-4) annotation (Placement(transformation(extent={{-24,58},{-4,78}})));
  Chemical.Components.GasSolubility CO2(KC=1e-4) annotation (Placement(transformation(extent={{4,58},{24,78}})));
  Physiolibrary.Fluid.Sensors.PartialPressure pO2_blood(
    redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
    substanceData=Chemical.Substances.Oxygen_gas(),
    redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
    annotation (Placement(transformation(extent={{-50,34},{-30,54}})));
  Physiolibrary.Fluid.Sensors.PartialPressure pCO2_blood(
    redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
    substanceData=Chemical.Substances.CarbonDioxide_gas(),
    redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
    annotation (Placement(transformation(extent={{50,34},{30,54}})));
  Physiolibrary.Fluid.Components.Resistor systemicResistanceA(redeclare package Medium = Blood, Resistance=
        7999343.2449*(20*(7/8))) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={16,-140})));
  Physiolibrary.Fluid.Components.VolumePump leftHeartPump(
    redeclare package Medium = Blood,
    useSolutionFlowInput=true,
    SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-96})));
  Physiolibrary.Fluid.Components.VolumePump rightHeartPump(
    redeclare package Medium = Blood,
    useSolutionFlowInput=true,
    SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,-96})));
  Physiolibrary.Fluid.Components.ElasticVessel pulmonaryArteries(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.00038,
    Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0003,
    nPorts=3) annotation (Placement(transformation(extent={{-56,-40},{-36,-20}})));
  Physiolibrary.Fluid.Components.ElasticVessel pulmonaryVeins(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.0004,
    Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0004,
    nPorts=3) annotation (Placement(transformation(extent={{32,-40},{52,-20}})));
  Physiolibrary.Fluid.Components.ElasticVessel systemicArteries(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.00085,
    Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
    ZeroPressureVolume(displayUnit="l") = 0.00045,
    nPorts=3) annotation (Placement(transformation(extent={{30,-152},{50,-132}})));
  Physiolibrary.Fluid.Components.ElasticVessel systemicVeins(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.00325,
    Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
    ZeroPressureVolume(displayUnit="l") = 0.00295,
    nPorts=3) annotation (Placement(transformation(extent={{-50,-152},{-30,-132}})));
  Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureArteries(redeclare package Medium = Blood)
    annotation (Placement(transformation(extent={{52,-148},{72,-128}})));
  Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureVeins(redeclare package Medium = Blood)
                                                                   annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-62,-138})));
  Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasurePulmArteries(redeclare package Medium = Blood)
    annotation (Placement(transformation(extent={{-58,-36},{-78,-16}})));
  Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasurePulmVeins(redeclare package Medium = Blood)
    annotation (Placement(transformation(extent={{52,-36},{72,-16}})));
  Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance(k=1.250102626409427e-07*(5/4))
                                     annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={70,-112})));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu=2) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={60,-96})));
  Modelica.Blocks.Math.MultiProduct multiProduct1(nu=2) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-60,-96})));
  Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance1(k=1.250102626409427e-07*(5/4))
                                    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-70,-78})));
  Physiolibrary.Fluid.Components.Resistor systemicResistanceB(redeclare package Medium = Blood, Resistance=
        7999343.2449*(20*(1/8))) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-16,-140})));
  Physiolibrary.Fluid.Components.ElasticVessel systemicCapillaries(
    redeclare package Medium = Blood,
    useSubstances=true,
    volume_start(displayUnit="l") = 0.0003,
    Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0002,
    nPorts=5) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-170})));
  Physiolibrary.Fluid.Components.ElasticVessel pulmonaryCapillaries(
    redeclare package Medium = Blood,
    useSubstances=true,
    volume_start(displayUnit="l") = 0.00015,
    Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0001,
    nPorts=5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,20})));
  Physiolibrary.Fluid.Sensors.PressureMeasure
    pressureMeasurePulmonaryCapillaries(redeclare package Medium = Blood)
                                        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={62,32})));
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
  Physiolibrary.Fluid.Components.Conductor pulmonaryConductanceA(Conductance=cPerfusion*(7/8))
    annotation (Placement(transformation(extent={{-26,-38},{-6,-18}})));
  Physiolibrary.Fluid.Components.Conductor pulmonaryConductanceB(Conductance=cPerfusion*(1/8))
    annotation (Placement(transformation(extent={{4,-38},{24,-18}})));
  Physiolibrary.Fluid.Components.Conductor shuntConductance(Conductance=cShunt)
    annotation (Placement(transformation(extent={{-12,-62},{8,-42}})));
equation
  connect(deadSpaceVolumePump.q_out,volumeOutflow. q_in)
    annotation (Line(
      points={{10,138},{68,138}},
      color={127,0,0},
      thickness=0.5));
  connect(flowMeasureInAlveoli.q_out,alveoli. q_in[1]) annotation (Line(
      points={{-18,102},{-2,102},{-2,100},{-1.3,100},{-1.3,101.9}},
      color={127,0,0},
      thickness=0.5));
  connect(flowMeasureOutAlveoli.q_in,alveoli. q_in[2])
    annotation (Line(
      points={{18,102},{1.3,102},{1.3,101.9}},
      color={127,0,0},
      thickness=0.5));
  connect(flowMeasureOutAlveoli.q_out,volumeOutflow. q_in)
    annotation (Line(
      points={{38,102},{58,102},{58,138},{68,138}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureSource.y,conductor. q_in)
    annotation (Line(
      points={{-72,138},{-58,138},{-58,122}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureSource.y,deadSpaceVolumePump. q_in)
    annotation (Line(
      points={{-72,138},{-10,138}},
      color={127,0,0},
      thickness=0.5));
  connect(conductor.q_out,flowMeasureInAlveoli. q_in)
    annotation (Line(
      points={{-58,102},{-38,102}},
      color={127,0,0},
      thickness=0.5));
  connect(O2.gas_port,alveoli. substances[1])
    annotation (Line(points={{-14,78},{-14,92},{0,92}},            color={158,66,200}));
  connect(alveoli.substances[2],CO2. gas_port)
    annotation (Line(points={{0,92},{14,92},{14,78}},              color={158,66,200}));
  connect(rightHeartPump.q_out,pulmonaryArteries. q_in[1]) annotation (Line(
      points={{-40,-86},{-40,-44},{-46.1,-44},{-46.1,-28.2667}},
      color={127,0,0},
      thickness=0.5));
  connect(leftHeartPump.q_in,pulmonaryVeins. q_in[1])
    annotation (Line(
      points={{40,-86},{40,-58},{42,-58},{42,-28},{41.9,-28},{41.9,-28.2667}},
      color={127,0,0},
      thickness=0.5));
  connect(systemicResistanceA.q_in,systemicArteries. q_in[1])
    annotation (Line(
      points={{26,-140},{39.9,-140},{39.9,-140.267}},
      color={127,0,0},
      thickness=0.5));
  connect(leftHeartPump.q_out,systemicArteries. q_in[2])
    annotation (Line(
      points={{40,-106},{40,-142},{39.9,-142}},
      color={127,0,0},
      thickness=0.5));
  connect(rightHeartPump.q_in,systemicVeins. q_in[1]) annotation (Line(
      points={{-40,-106},{-40,-140.267},{-40.1,-140.267}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasureArteries.q_in,systemicArteries. q_in[3])
    annotation (Line(
      points={{58,-144},{39.9,-144},{39.9,-143.733}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasureVeins.q_in,systemicVeins. q_in[2]) annotation (Line(
      points={{-58,-144},{-40,-144},{-40,-142},{-40.1,-142}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasurePulmArteries.q_in,pulmonaryArteries. q_in[2])
    annotation (Line(
      points={{-64,-32},{-44,-32},{-44,-30},{-46.1,-30}},
      color={127,0,0},
      thickness=0.5));
  connect(pulmonaryVeins.q_in[2],pressureMeasurePulmVeins. q_in) annotation (Line(
      points={{41.9,-30},{42,-30},{42,-32},{58,-32}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasurePulmVeins.pressure,multiProduct. u[1]) annotation (
      Line(points={{68,-30},{66,-30},{66,-98.1}},              color={0,0,127}));
  connect(hydraulicConductance.y,multiProduct. u[2]) annotation (Line(points={{70,-107},{70,-98},{66,-98},{66,-93.9}},
                                         color={0,0,127}));
  connect(multiProduct.y,leftHeartPump. solutionFlow)
    annotation (Line(points={{52.98,-96},{47,-96}},
                                                  color={0,0,127}));
  connect(multiProduct1.y,rightHeartPump. solutionFlow)
    annotation (Line(points={{-52.98,-96},{-47,-96}},
                                                    color={0,0,127}));
  connect(hydraulicConductance1.y,multiProduct1. u[1]) annotation (Line(points={{-70,-83},{-70,-94},{-66,-94},{-66,
          -93.9}},                                color={0,0,127}));
  connect(pressureMeasureVeins.pressure,multiProduct1. u[2]) annotation (Line(
        points={{-68,-142},{-70,-142},{-70,-98.1},{-66,-98.1}},
                                                            color={0,0,127}));
  connect(systemicResistanceB.q_out,systemicVeins. q_in[3]) annotation (Line(
      points={{-26,-140},{-40,-140},{-40,-144},{-40.1,-144},{-40.1,-143.733}},
      color={127,0,0},
      thickness=0.5));
  connect(systemicResistanceB.q_in,systemicCapillaries. q_in[1]) annotation (Line(
      points={{-6,-140},{0,-140},{0,-170.1},{-2.08,-170.1}},
      color={127,0,0},
      thickness=0.5));
  connect(systemicResistanceA.q_out,systemicCapillaries. q_in[2])
    annotation (Line(
      points={{6,-140},{0,-140},{0,-170.1},{-1.04,-170.1}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasurePulmonaryCapillaries.q_in, pulmonaryCapillaries.q_in[1])
    annotation (Line(
      points={{58,26},{2.08,26},{2.08,20.1}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasureSystemicCapillaries.q_in,systemicCapillaries. q_in[3])
    annotation (Line(
      points={{58,-170},{30,-170},{30,-170.1},{1.11022e-16,-170.1}},
      color={127,0,0},
      thickness=0.5));
  connect(pO2_blood.referenceFluidPort, pulmonaryCapillaries.q_in[2]) annotation (Line(
      points={{-40,34.2},{-40,20},{1.04,20},{1.04,20.1}},
      color={127,0,0},
      thickness=0.5));
  connect(pCO2_blood.referenceFluidPort, pulmonaryCapillaries.q_in[3]) annotation (Line(
      points={{40,34.2},{40,20},{-1.11022e-16,20},{-1.11022e-16,20.1}},
      color={127,0,0},
      thickness=0.5));
  connect(O2.liquid_port, pulmonaryCapillaries.substances[2])
    annotation (Line(points={{-14,58},{-14,30},{0,30}}, color={158,66,200}));
  connect(CO2.liquid_port, pulmonaryCapillaries.substances[3])
    annotation (Line(points={{14,58},{14,30},{0,30}}, color={158,66,200}));
  connect(systemicCapillaries.substances[2], O2_left.port_a)
    annotation (Line(points={{-8.88178e-16,-180},{-8.88178e-16,-208},{-60,-208}}, color={158,66,200}));
  connect(systemicCapillaries.substances[3], CO2_left.port_b)
    annotation (Line(points={{-8.88178e-16,-180},{-8.88178e-16,-208},{60,-208}}, color={158,66,200}));
  connect(O2.liquid_port, pO2_blood.port_a)
    annotation (Line(points={{-14,58},{-14,44},{-30,44}}, color={158,66,200}));
  connect(CO2.liquid_port, pCO2_blood.port_a)
    annotation (Line(points={{14,58},{14,44},{30,44}}, color={158,66,200}));
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
  connect(pulmonaryArteries.q_in[3], pulmonaryConductanceA.q_in)
    annotation (Line(
      points={{-46.1,-31.7333},{-46.1,-28},{-26,-28}},
      color={127,0,0},
      thickness=0.5));
  connect(pulmonaryConductanceA.q_out, pulmonaryCapillaries.q_in[4]) annotation (Line(
      points={{-6,-28},{0,-28},{0,20},{-2,20},{-2,20.1},{-1.04,20.1}},
      color={127,0,0},
      thickness=0.5));
  connect(pulmonaryConductanceB.q_in, pulmonaryCapillaries.q_in[5]) annotation (Line(
      points={{4,-28},{0,-28},{0,20},{-2.08,20},{-2.08,20.1}},
      color={127,0,0},
      thickness=0.5));
  connect(pulmonaryConductanceB.q_out, pulmonaryVeins.q_in[3]) annotation (Line(
      points={{24,-28},{42,-28},{42,-32},{41.9,-32},{41.9,-31.7333}},
      color={127,0,0},
      thickness=0.5));
  connect(shuntConductance.q_out, pulmonaryConductanceB.q_out)
    annotation (Line(
      points={{8,-52},{28,-52},{28,-28},{24,-28}},
      color={127,0,0},
      thickness=0.5));
  connect(shuntConductance.q_in, pulmonaryConductanceA.q_in) annotation (Line(
      points={{-12,-52},{-30,-52},{-30,-28},{-26,-28}},
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
