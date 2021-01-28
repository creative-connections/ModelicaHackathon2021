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
  Physiolibrary.Fluid.Components.VolumePump deadSpaceVolumePump(redeclare package Medium = Air, SolutionFlow=DV*RR)
    annotation (Placement(transformation(extent={{-10,96},{10,116}})));
  Physiolibrary.Fluid.Sources.PressureSource pressureSource(redeclare package Medium = Air)
    annotation (Placement(transformation(extent={{-92,96},{-72,116}})));
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
        origin={0,72})));
  Physiolibrary.Fluid.Sources.VolumeOutflowSource volumeOutflow(SolutionFlow=TV*RR, redeclare package Medium = Air)
    annotation (Placement(transformation(extent={{72,96},{92,116}})));
  Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureInAlveoli(redeclare package Medium = Air)
    annotation (Placement(transformation(extent={{-38,62},{-18,82}})));
  Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureOutAlveoli(redeclare package Medium = Air)
    annotation (Placement(transformation(extent={{18,62},{38,82}})));
  Physiolibrary.Fluid.Components.Conductor conductor(redeclare package Medium = Air, Conductance(displayUnit=
          "l/(cmH2O.s)") = 1.5295743194669e-05) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-58,90})));
  Chemical.Components.GasSolubility O2(KC=1e-4) annotation (Placement(transformation(extent={{-24,28},{-4,48}})));
  Chemical.Components.GasSolubility CO2(KC=1e-4) annotation (Placement(transformation(extent={{4,28},{24,48}})));
  Chemical.Sources.SubstanceOutflow O2_left(SubstanceFlow(displayUnit="mmol/min") = 1.666666666666667e-05*(2*7.71))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,4})));
  Chemical.Sources.SubstanceInflowT CO2_left(
    SubstanceFlow(displayUnit="mmol/min") = 1.666666666666667e-05*(2*6.17),
    redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
    substanceData=Chemical.Substances.CarbonDioxide_gas()) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,4})));
  Physiolibrary.Fluid.Sensors.PartialPressure pO2_blood(
    redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
    substanceData=Chemical.Substances.Oxygen_gas(),
    redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
    annotation (Placement(transformation(extent={{-60,18},{-40,38}})));
  Physiolibrary.Fluid.Sensors.PartialPressure pCO2_blood(
    redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
    substanceData=Chemical.Substances.CarbonDioxide_gas(),
    redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
    annotation (Placement(transformation(extent={{60,18},{40,38}})));
  Physiolibrary.Fluid.Components.Resistor pulmonaryResistanceB(redeclare package Medium = Blood, Resistance=
        7999343.2449*((1/8)*3)) annotation (Placement(transformation(extent={{6,-60},{26,-40}})));
  Physiolibrary.Fluid.Components.Resistor systemicResistanceA(redeclare package Medium = Blood, Resistance=
        7999343.2449*(20*(7/8))) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={14,-140})));
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
    nPorts=3) annotation (Placement(transformation(extent={{-50,-62},{-30,-42}})));
  Physiolibrary.Fluid.Components.ElasticVessel pulmonaryVeins(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.0004,
    Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0004,
    nPorts=3) annotation (Placement(transformation(extent={{30,-62},{50,-42}})));
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
    annotation (Placement(transformation(extent={{-52,-58},{-72,-38}})));
  Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasurePulmVeins(redeclare package Medium = Blood)
    annotation (Placement(transformation(extent={{52,-58},{72,-38}})));
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
        origin={-14,-140})));
  Physiolibrary.Fluid.Components.Resistor pulmonaryResistanceA(redeclare package Medium = Blood, Resistance=
        7999343.2449*((7/8)*3)) annotation (Placement(transformation(extent={{-26,-60},{-6,-40}})));
  Physiolibrary.Fluid.Components.ElasticVessel systemicCapillaries(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.0003,
    Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0002,
    nPorts=3) annotation (Placement(transformation(extent={{-10,-178},{10,-158}})));
  Physiolibrary.Fluid.Components.ElasticVessel pulmonaryCapillaries1(
    redeclare package Medium = Blood,
    useSubstances=true,
    volume_start(displayUnit="l") = 0.00015,
    Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0001,
    nPorts=5) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-28})));
  Physiolibrary.Fluid.Sensors.PressureMeasure
    pressureMeasurePulmonaryCapillaries(redeclare package Medium = Blood)
                                        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={62,-16})));
  Physiolibrary.Fluid.Sensors.PressureMeasure
    pressureMeasureSystemicCapillaries(redeclare package Medium = Blood)
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={62,-164})));
equation
  connect(deadSpaceVolumePump.q_out,volumeOutflow. q_in)
    annotation (Line(
      points={{10,106},{72,106}},
      color={127,0,0},
      thickness=0.5));
  connect(flowMeasureInAlveoli.q_out,alveoli. q_in[1]) annotation (Line(
      points={{-18,72},{-2,72},{-2,70},{-1.3,70},{-1.3,71.9}},
      color={127,0,0},
      thickness=0.5));
  connect(flowMeasureOutAlveoli.q_in,alveoli. q_in[2])
    annotation (Line(
      points={{18,72},{1.3,72},{1.3,71.9}},
      color={127,0,0},
      thickness=0.5));
  connect(flowMeasureOutAlveoli.q_out,volumeOutflow. q_in)
    annotation (Line(
      points={{38,72},{60,72},{60,106},{72,106}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureSource.y,conductor. q_in)
    annotation (Line(
      points={{-72,106},{-58,106},{-58,100}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureSource.y,deadSpaceVolumePump. q_in)
    annotation (Line(
      points={{-72,106},{-10,106}},
      color={127,0,0},
      thickness=0.5));
  connect(conductor.q_out,flowMeasureInAlveoli. q_in)
    annotation (Line(
      points={{-58,80},{-58,72},{-38,72}},
      color={127,0,0},
      thickness=0.5));
  connect(O2.gas_port,alveoli. substances[1])
    annotation (Line(points={{-14,48},{-14,58},{0,58},{0,62}},     color={158,66,200}));
  connect(alveoli.substances[2],CO2. gas_port)
    annotation (Line(points={{0,62},{0,58},{14,58},{14,48}},       color={158,66,200}));
  connect(CO2.liquid_port,CO2_left. port_b)
    annotation (Line(points={{14,28},{14,4},{40,4}},      color={158,66,200}));
  connect(O2.liquid_port,O2_left. port_a)
    annotation (Line(points={{-14,28},{-14,4},{-40,4}},    color={158,66,200}));
  connect(pO2_blood.port_a,O2_left. port_a)
    annotation (Line(points={{-40,28},{-32,28},{-32,4},{-40,4}},       color={158,66,200}));
  connect(pCO2_blood.port_a,CO2_left. port_b)
    annotation (Line(points={{40,28},{32,28},{32,4},{40,4}},       color={158,66,200}));
  connect(rightHeartPump.q_out,pulmonaryArteries. q_in[1]) annotation (Line(
      points={{-40,-86},{-40,-66},{-40.1,-66},{-40.1,-50.2667}},
      color={127,0,0},
      thickness=0.5));
  connect(pulmonaryResistanceB.q_out,pulmonaryVeins. q_in[1]) annotation (Line(
      points={{26,-50},{40,-50},{40,-50.2667},{39.9,-50.2667}},
      color={127,0,0},
      thickness=0.5));
  connect(leftHeartPump.q_in,pulmonaryVeins. q_in[2])
    annotation (Line(
      points={{40,-86},{40,-52},{39.9,-52}},
      color={127,0,0},
      thickness=0.5));
  connect(systemicResistanceA.q_in,systemicArteries. q_in[1])
    annotation (Line(
      points={{24,-140},{39.9,-140},{39.9,-140.267}},
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
      points={{-58,-54},{-40,-54},{-40,-52},{-40.1,-52}},
      color={127,0,0},
      thickness=0.5));
  connect(pulmonaryVeins.q_in[3],pressureMeasurePulmVeins. q_in) annotation (Line(
      points={{39.9,-53.7333},{40,-53.7333},{40,-54},{58,-54}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasurePulmVeins.pressure,multiProduct. u[1]) annotation (
      Line(points={{68,-52},{70,-52},{70,-94},{66,-94},{66,-98.1}},
                                                               color={0,0,127}));
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
      points={{-24,-140},{-40,-140},{-40,-144},{-40.1,-144},{-40.1,-143.733}},
      color={127,0,0},
      thickness=0.5));
  connect(pulmonaryResistanceA.q_in,pulmonaryArteries. q_in[3]) annotation (Line(
      points={{-26,-50},{-40,-50},{-40,-54},{-40.1,-54},{-40.1,-53.7333}},
      color={127,0,0},
      thickness=0.5));
  connect(pulmonaryResistanceB.q_in, pulmonaryCapillaries1.q_in[1]) annotation (Line(
      points={{6,-50},{0,-50},{0,-28},{2,-28},{2,-27.9},{2.08,-27.9}},
      color={127,0,0},
      thickness=0.5));
  connect(pulmonaryResistanceA.q_out, pulmonaryCapillaries1.q_in[2]) annotation (Line(
      points={{-6,-50},{0,-50},{0,-28},{2,-28},{2,-27.9},{1.04,-27.9}},
      color={127,0,0},
      thickness=0.5));
  connect(systemicResistanceB.q_in,systemicCapillaries. q_in[1]) annotation (Line(
      points={{-4,-140},{0,-140},{0,-166.267},{-0.1,-166.267}},
      color={127,0,0},
      thickness=0.5));
  connect(systemicResistanceA.q_out,systemicCapillaries. q_in[2])
    annotation (Line(
      points={{4,-140},{0,-140},{0,-168},{-0.1,-168}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasurePulmonaryCapillaries.q_in, pulmonaryCapillaries1.q_in[3]) annotation (Line(
      points={{58,-22},{-1.11022e-16,-22},{-1.11022e-16,-27.9}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasureSystemicCapillaries.q_in,systemicCapillaries. q_in[3])
    annotation (Line(
      points={{58,-170},{30,-170},{30,-169.733},{-0.1,-169.733}},
      color={127,0,0},
      thickness=0.5));
  connect(O2.liquid_port, pulmonaryCapillaries1.substances[1])
    annotation (Line(points={{-14,28},{-14,-18},{1.9984e-15,-18}}, color={158,66,200}));
  connect(CO2.liquid_port, pulmonaryCapillaries1.substances[2])
    annotation (Line(points={{14,28},{14,-18},{1.9984e-15,-18}}, color={158,66,200}));
  connect(pO2_blood.referenceFluidPort, pulmonaryCapillaries1.q_in[4]) annotation (Line(
      points={{-50,18.2},{-66,18.2},{-66,18},{-82,18},{-82,-27.9},{-1.04,-27.9}},
      color={127,0,0},
      thickness=0.5));
  connect(pCO2_blood.referenceFluidPort, pulmonaryCapillaries1.q_in[5]) annotation (Line(
      points={{50,18.2},{66,18.2},{66,18},{80,18},{80,-27.9},{-2.08,-27.9}},
      color={127,0,0},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-200},{100,140}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-200},{100,140}})),
    uses(
      Physiolibrary(version="3.0.0-alpha7"),
      Modelica(version="4.0.0"),
      Chemical(version="1.4.0-alpha7")));
end jednoduchy_model_spojeny;
