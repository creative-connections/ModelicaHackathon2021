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

    parameter Physiolibrary.Types.HydraulicConductance cShunt=1.250102626409427e-07*((1/3)*0.02);
    parameter Physiolibrary.Types.HydraulicConductance cTotalVentilation(displayUnit="l/(cmH2O.s)")=
    1.019716212977928e-05*((1/1.5));
    parameter Physiolibrary.Types.HydraulicConductance cTotalCirculation=1.250102626409427e-07*((1/3)*(1 - 0.02));

    parameter Integer NA=5    "Number of alveolar units";


  Physiolibrary.Fluid.Components.VolumePump deadSpaceVolumePump(redeclare package Medium = Air, SolutionFlow=DV*RR)
    annotation (Placement(transformation(extent={{-10,2},{10,22}})));
  Physiolibrary.Fluid.Sources.PressureSource pressureSource(redeclare package Medium = Air)
    annotation (Placement(transformation(extent={{-92,2},{-72,22}})));
  Physiolibrary.Fluid.Sources.VolumeOutflowSource volumeOutflow(SolutionFlow=TV*RR, redeclare package Medium = Air)
    annotation (Placement(transformation(extent={{68,2},{88,22}})));
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
    nPorts=4) annotation (Placement(transformation(extent={{-56,-58},{-36,-38}})));
  Physiolibrary.Fluid.Components.ElasticVessel pulmonaryVeins(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.0004,
    Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0004,
    nPorts=4) annotation (Placement(transformation(extent={{36,-58},{56,-38}})));
  Physiolibrary.Fluid.Components.ElasticVessel systemicArteries(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.00085,
    Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
    ZeroPressureVolume(displayUnit="l") = 0.00045,
    nPorts=4) annotation (Placement(transformation(extent={{36,-152},{56,-132}})));
  Physiolibrary.Fluid.Components.ElasticVessel systemicVeins(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.00325,
    Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
    ZeroPressureVolume(displayUnit="l") = 0.00295,
    nPorts=4) annotation (Placement(transformation(extent={{-56,-152},{-36,-132}})));
  Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureArteries(redeclare package Medium = Blood)
    annotation (Placement(transformation(extent={{56,-148},{76,-128}})));
  Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasureVeins(redeclare package Medium = Blood)
                                                                   annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-66,-138})));
  Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasurePulmArteries(redeclare package Medium = Blood)
    annotation (Placement(transformation(extent={{-56,-54},{-76,-34}})));
  Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasurePulmVeins(redeclare package Medium = Blood)
    annotation (Placement(transformation(extent={{56,-54},{76,-34}})));
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
        origin={66,-164})));
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
        origin={0,-50})));
  AlveolarUnit alveolarUnit[NA](
    redeclare package Blood = Blood,
    redeclare package Air = Air,
    cVentilation=ones(NA)*(cTotalVentilation/NA),
    cCirculation=ones(NA)*(cTotalCirculation/NA))
     annotation (Placement(transformation(rotation=0, extent={{-10,-30},{10,-10}})));
equation
  connect(deadSpaceVolumePump.q_out,volumeOutflow. q_in)
    annotation (Line(
      points={{10,12},{68,12}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureSource.y,deadSpaceVolumePump. q_in)
    annotation (Line(
      points={{-72,12},{-10,12}},
      color={127,0,0},
      thickness=0.5));
  connect(rightHeartPump.q_out,pulmonaryArteries. q_in[1]) annotation (Line(
      points={{-46,-86},{-46,-62},{-46.1,-62},{-46.1,-46.05}},
      color={127,0,0},
      thickness=0.5));
  connect(leftHeartPump.q_in,pulmonaryVeins. q_in[1])
    annotation (Line(
      points={{46,-86},{46,-46},{45.9,-46},{45.9,-46.05}},
      color={127,0,0},
      thickness=0.5));
  connect(systemicResistanceA.q_in,systemicArteries. q_in[1])
    annotation (Line(
      points={{32,-140},{45.9,-140},{45.9,-140.05}},
      color={127,0,0},
      thickness=0.5));
  connect(leftHeartPump.q_out,systemicArteries. q_in[2])
    annotation (Line(
      points={{46,-106},{46,-141.35},{45.9,-141.35}},
      color={127,0,0},
      thickness=0.5));
  connect(rightHeartPump.q_in,systemicVeins. q_in[1]) annotation (Line(
      points={{-46,-106},{-46,-140.05},{-46.1,-140.05}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasureArteries.q_in,systemicArteries. q_in[3])
    annotation (Line(
      points={{62,-144},{45.9,-144},{45.9,-142.65}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasureVeins.q_in,systemicVeins. q_in[2]) annotation (Line(
      points={{-62,-144},{-46,-144},{-46,-141.35},{-46.1,-141.35}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasurePulmArteries.q_in,pulmonaryArteries. q_in[2])
    annotation (Line(
      points={{-62,-50},{-46,-50},{-46,-47.35},{-46.1,-47.35}},
      color={127,0,0},
      thickness=0.5));
  connect(pulmonaryVeins.q_in[2],pressureMeasurePulmVeins. q_in) annotation (Line(
      points={{45.9,-47.35},{46,-47.35},{46,-50},{62,-50}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureMeasurePulmVeins.pressure,multiProduct. u[1]) annotation (
      Line(points={{72,-48},{72,-98.1}},                       color={0,0,127}));
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
        points={{-72,-142},{-76,-142},{-76,-98.1},{-72,-98.1}},
                                                            color={0,0,127}));
  connect(systemicResistanceB.q_out,systemicVeins. q_in[3]) annotation (Line(
      points={{-32,-140},{-46,-140},{-46,-144},{-46.1,-144},{-46.1,-142.65}},
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
      points={{62,-170},{30,-170},{30,-170.1},{1.11022e-16,-170.1}},
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
  connect(shuntConductance.q_in, pulmonaryArteries.q_in[3])
    annotation (Line(
      points={{-10,-50},{-46.1,-50},{-46.1,-48.65}},
      color={127,0,0},
      thickness=0.5));
  connect(shuntConductance.q_out, pulmonaryVeins.q_in[3])
    annotation (Line(
      points={{10,-50},{45.9,-50},{45.9,-48.65}},
      color={127,0,0},
      thickness=0.5));
  for i in 1:NA loop
  connect(alveolarUnit[i].q_in1, pulmonaryArteries.q_in[4]) annotation (Line(
      points={{-4,-30},{-4,-34},{-28,-34},{-28,-50},{-46.1,-50},{-46.1,-49.95}},
      color={127,0,0},
      thickness=0.5));
  connect(alveolarUnit[i].q_in, pressureSource.y)
    annotation (Line(
      points={{-10,-10},{-60,-10},{-60,12},{-72,12}},
      color={127,0,0},
      thickness=0.5));
  connect(alveolarUnit[i].q_out, volumeOutflow.q_in)
    annotation (Line(
      points={{10,-10},{56,-10},{56,12},{68,12}},
      color={127,0,0},
      thickness=0.5));
  connect(alveolarUnit[i].q_out1, pulmonaryVeins.q_in[4]) annotation (Line(
      points={{4,-30},{4,-34},{28,-34},{28,-50},{46,-50},{46,-52},{45.9,-52},{45.9,-49.95}},
      color={127,0,0},
      thickness=0.5));
  end for;
public
  model AlveolarUnit
    Physiolibrary.Fluid.Components.Resistor pulmonaryResistanceA(redeclare package Medium = Blood, Resistance=(1/
          cCirculation)*(7/8))
                             annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-16,-16})));
    Physiolibrary.Fluid.Components.Resistor pulmonaryResistanceB(redeclare package Medium = Blood, Resistance=(1/
          cCirculation)*(1/8))
                             annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={16,-16})));
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
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasurePulmonaryCapillaries(redeclare package Medium = Blood)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={62,10})));
    Chemical.Components.GasSolubility O2(KC=1e-4) annotation (Placement(transformation(extent={{-24,58},{-4,78}})));
    Chemical.Components.GasSolubility CO2(KC=1e-4) annotation (Placement(transformation(extent={{4,58},{24,78}})));
    Physiolibrary.Fluid.Components.Conductor conductorA(redeclare package Medium = Air, Conductance(displayUnit="l/(cmH2O.s)")=
           cVentilation) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-60,102})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureInAlveoli(redeclare package Medium = Air)
      annotation (Placement(transformation(extent={{-38,92},{-18,112}})));
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
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasureOutAlveoli(redeclare package Medium = Air)
      annotation (Placement(transformation(extent={{18,92},{38,112}})));
      replaceable package Blood =
          Physiolibrary.Media.BloodBySiggaardAndersen annotation(choicesAllMatching=True);
      replaceable package Air =
          Physiolibrary.Media.Air annotation(choicesAllMatching=True);
      parameter Physiolibrary.Types.HydraulicConductance cVentilation=1.250102626409427e-07*(1/1.5);
      parameter Physiolibrary.Types.HydraulicConductance cCirculation=1.250102626409427e-07*(1/3);
    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package Medium = Air)
      annotation (Placement(transformation(rotation=0, extent={{-110,150},{-90,170}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b q_out(redeclare package Medium = Air)
      annotation (Placement(transformation(rotation=0, extent={{90,150},{110,170}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in1(redeclare package Medium = Blood)
      annotation (Placement(transformation(rotation=0, extent={{-50,-50},{-30,-30}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b q_out1(redeclare package Medium = Blood)
      annotation (Placement(transformation(rotation=0, extent={{30,-50},{50,-30}})));
    Physiolibrary.Fluid.Components.Conductor conductorB(redeclare package Medium = Air, Conductance(displayUnit="l/(cmH2O.s)")=
           cVentilation)        annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={60,102})));
  equation
    connect(flowMeasureInAlveoli.q_out,alveoli. q_in[1]) annotation (Line(
        points={{-18,102},{-2,102},{-2,100},{-1.3,100},{-1.3,101.9}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasureOutAlveoli.q_in,alveoli. q_in[2])
      annotation (Line(
        points={{18,102},{1.3,102},{1.3,101.9}},
        color={127,0,0},
        thickness=0.5));
    connect(O2.gas_port,alveoli. substances[1])
      annotation (Line(points={{-14,78},{-14,92},{0,92}},            color={158,66,200}));
    connect(alveoli.substances[2],CO2. gas_port)
      annotation (Line(points={{0,92},{14,92},{14,78}},              color={158,66,200}));
    connect(pressureMeasurePulmonaryCapillaries.q_in, pulmonaryCapillaries.q_in[1])
      annotation (Line(
        points={{58,4},{0,4},{0,20.1},{2.08,20.1}},
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
    connect(O2.liquid_port, pO2_blood.port_a)
      annotation (Line(points={{-14,58},{-14,44},{-30,44}}, color={158,66,200}));
    connect(CO2.liquid_port, pCO2_blood.port_a)
      annotation (Line(points={{14,58},{14,44},{30,44}}, color={158,66,200}));
    connect(pulmonaryResistanceB.q_in, pulmonaryCapillaries.q_in[4])
      annotation (Line(
        points={{6,-16},{0,-16},{0,20.1},{-1.04,20.1}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryResistanceA.q_out, pulmonaryCapillaries.q_in[5])
      annotation (Line(
        points={{-6,-16},{0,-16},{0,20.1},{-2.08,20.1}},
        color={127,0,0},
        thickness=0.5));
    connect(q_in, conductorA.q_in) annotation (Line(
        points={{-100,160},{-80,160},{-80,102},{-70,102}},
        color={127,0,0},
        thickness=0.5));
    connect(conductorA.q_out, flowMeasureInAlveoli.q_in)
      annotation (Line(
        points={{-50,102},{-38,102}},
        color={127,0,0},
        thickness=0.5));
    connect(q_in1, pulmonaryResistanceA.q_in)
      annotation (Line(
        points={{-40,-40},{-40,-16},{-26,-16}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryResistanceB.q_out, q_out1)
      annotation (Line(
        points={{26,-16},{40,-16},{40,-40}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasureOutAlveoli.q_out, conductorB.q_in)
      annotation (Line(
        points={{38,102},{50,102}},
        color={127,0,0},
        thickness=0.5));
    connect(conductorB.q_out, q_out)
      annotation (Line(
        points={{70,102},{80,102},{80,160},{100,160}},
        color={127,0,0},
        thickness=0.5));
    annotation (
      Diagram(coordinateSystem(extent={{-100,-40},{100,160}})),
      Icon(coordinateSystem(extent={{-100,-40},{100,160}})));
  end AlveolarUnit;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-220},{100,40}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-220},{100,40}})),
    uses(
      Physiolibrary(version="3.0.0-alpha7"),
      Modelica(version="4.0.0"),
      Chemical(version="1.4.0-alpha7")));
end jednoduchy_model_spojeny;
