within ;
model spojeni
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

  Physiolibrary.Fluid.Sources.PressureSource pressureSource(redeclare package
      Medium = Physiolibrary.Media.Air)
    annotation (Placement(transformation(extent={{-106,72},{-86,92}})));
  Physiolibrary.Fluid.Components.VolumePump volumePump(redeclare package Medium
      = Physiolibrary.Media.Air, SolutionFlow=DV*RR)
    annotation (Placement(transformation(extent={{-10,86},{10,106}})));
  Physiolibrary.Fluid.Sources.VolumeOutflowSource volumeOutflowSource(
      SolutionFlow=TV*RR, redeclare package Medium = Physiolibrary.Media.Air)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,84})));
  Physiolibrary.Fluid.Components.ElasticVessel Alveoly(
    redeclare package Medium = Physiolibrary.Media.Air,
    useSubstances=true,
    volume_start(displayUnit="l") = 0.0016,
    Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
    ZeroPressureVolume(displayUnit="l") = 0.0013,
    ExternalPressure(displayUnit="mmHg") = 100791.72488574,
    nPorts=3) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,60})));
  Physiolibrary.Fluid.Sensors.PressureMeasure TlakAlveoly(redeclare package
      Medium = Physiolibrary.Media.Air)
    annotation (Placement(transformation(extent={{34,38},{54,58}})));
  Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure(redeclare package Medium
      = Physiolibrary.Media.Air)
    annotation (Placement(transformation(extent={{46,54},{66,74}})));
  Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure1(redeclare package Medium
      = Physiolibrary.Media.Air)
    annotation (Placement(transformation(extent={{-40,54},{-20,74}})));
  Physiolibrary.Fluid.Components.Conductor conductor(redeclare package Medium
      = Physiolibrary.Media.Air, Conductance(displayUnit="l/(cmH2O.s)")=
      1.019716212977928e-05*(1/1.5))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-62,64})));
  Chemical.Components.GasSolubility O2(KC=1e-4)
    annotation (Placement(transformation(extent={{-26,8},{-6,28}})));
  Chemical.Components.GasSolubility CO2(KC=1e-4)
    annotation (Placement(transformation(extent={{8,6},{28,26}})));
  Physiolibrary.Fluid.Sensors.PartialPressure pO2(
    redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
    substanceData=Chemical.Substances.Oxygen_gas(),
    redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
    annotation (Placement(transformation(extent={{-80,14},{-60,34}})));
  Physiolibrary.Fluid.Sensors.PartialPressure pCO2(
    redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
    substanceData=Chemical.Substances.CarbonDioxide_gas(),
    redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={78,16})));
  Physiolibrary.Fluid.Components.VolumePump srdceP(
    redeclare package Medium = Blood,
    useSolutionFlowInput=true,
    SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-56,-156})));
  Physiolibrary.Fluid.Components.VolumePump SrdceL(
    redeclare package Medium = Blood,
    useSolutionFlowInput=true,
    SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={84,-128})));
  Physiolibrary.Fluid.Components.Resistor resistor(redeclare package Medium =
        Blood, Resistance=7999343.2449*((7*3)/8))
    annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
  Physiolibrary.Fluid.Components.Resistor resistor1(redeclare package Medium =
        Blood, Resistance=7999343.2449*((7*20)/8))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={42,-222})));
  Physiolibrary.Fluid.Components.ElasticVessel PlicArterie(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.00038,
    Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0003,
    nPorts=3) annotation (Placement(transformation(extent={{-62,-102},{-42,-82}})));
  Physiolibrary.Fluid.Components.ElasticVessel PlicVena(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.0004,
    Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0004,
    nPorts=3) annotation (Placement(transformation(extent={{70,-104},{90,-84}})));
  Physiolibrary.Fluid.Components.ElasticVessel Arterie(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.00085,
    Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
    ZeroPressureVolume(displayUnit="l") = 0.00045,
    nPorts=3) annotation (Placement(transformation(extent={{72,-230},{92,-208}})));
  Physiolibrary.Fluid.Components.ElasticVessel Veny(
    redeclare package Medium = Blood,
    volume_start(displayUnit="l") = 0.00325,
    Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
    ZeroPressureVolume(displayUnit="l") = 0.00295,
    nPorts=3)
    annotation (Placement(transformation(extent={{-64,-232},{-44,-212}})));
  Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure2(redeclare package Medium
      = Blood)                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={62,-160})));
  Physiolibrary.Fluid.Sensors.PressureMeasure TlakPlicVeny(redeclare package
      Medium = Blood)
    annotation (Placement(transformation(extent={{96,-84},{116,-64}})));
  Physiolibrary.Fluid.Sensors.PressureMeasure TlakPlicArterie(redeclare package
      Medium = Blood)
    annotation (Placement(transformation(extent={{-36,-126},{-16,-106}})));
  Physiolibrary.Fluid.Sensors.PressureMeasure TlakVeny(redeclare package Medium
      = Blood)
    annotation (Placement(transformation(extent={{-136,-226},{-116,-206}})));
  Physiolibrary.Fluid.Sensors.PressureMeasure TlakArterie(redeclare package
      Medium = Blood)
    annotation (Placement(transformation(extent={{102,-220},{122,-200}})));
  Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance(k=
        1.250102626409427e-07*(5/4))
    annotation (Placement(transformation(extent={{118,-60},{126,-52}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={126,-112})));
  Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance1(k=
        1.250102626409427e-07*(5/4))
    annotation (Placement(transformation(extent={{-154,-168},{-146,-160}})));
  Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-178})));
  Physiolibrary.Fluid.Components.Resistor resistor2(redeclare package Medium =
        Blood, Resistance=7999343.2449*(20/8))                     annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-8,-222})));
  Physiolibrary.Fluid.Components.ElasticVessel elasticVessel(
    redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
    useSubstances=true,
    volume_start(displayUnit="l") = 0.0003,
    Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0002,
    nPorts=5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={16,-278})));
  Physiolibrary.Fluid.Components.Resistor resistor3(redeclare package Medium =
        Blood, Resistance=7999343.2449*(3/8))
    annotation (Placement(transformation(extent={{30,-98},{50,-78}})));
  Physiolibrary.Fluid.Components.ElasticVessel elasticVessel1(
    redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
    useSubstances=true,
    volume_start(displayUnit="l") = 0.00015,
    Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
    ZeroPressureVolume(displayUnit="l") = 0.0001,
    nPorts=4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={16,-62})));
  Physiolibrary.Fluid.Sensors.PressureMeasure TlakKapilaryTelo(redeclare
      package Medium = Blood)
    annotation (Placement(transformation(extent={{-22,-264},{-2,-244}})));
  Physiolibrary.Fluid.Sensors.PressureMeasure TlakKapilaryPlice(redeclare
      package Medium = Blood)
    annotation (Placement(transformation(extent={{50,-66},{70,-46}})));
  Chemical.Sources.SubstanceInflowT CO2_left1(
    SubstanceFlow(displayUnit="mmol/min") = 0.00020566666666667,
    redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
    substanceData=Chemical.Substances.CarbonDioxide_gas()) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={84,-292})));
  Chemical.Sources.SubstanceOutflow O2_left1(useSubstanceFlowInput=false,
      SubstanceFlow(displayUnit="mmol/min") = 0.00025666666666667) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-64,-280})));
  Physiolibrary.Fluid.Sensors.PartialPressure pO2_tissue(
    redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
    substanceData=Chemical.Substances.Oxygen_gas(),
    redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
    annotation (Placement(transformation(extent={{-66,-336},{-46,-316}})));
  Physiolibrary.Fluid.Sensors.PartialPressure pCO2_tissue(
    redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
    substanceData=Chemical.Substances.CarbonDioxide_gas(),
    redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={92,-334})));
equation
  connect(volumePump.q_out,volumeOutflowSource. q_in) annotation (Line(
      points={{10,96},{72,96},{72,84},{80,84}},
      color={127,0,0},
      thickness=0.5));
  connect(TlakAlveoly.q_in,Alveoly. q_in[1]) annotation (Line(
      points={{40,42},{24,42},{24,59.9},{-1.73333,59.9}},
      color={127,0,0},
      thickness=0.5));
  connect(flowMeasure.q_in,Alveoly. q_in[2]) annotation (Line(
      points={{46,64},{24,64},{24,65.3},{0,65.3},{0,59.9}},
      color={127,0,0},
      thickness=0.5));
  connect(flowMeasure.q_out,volumeOutflowSource. q_in) annotation (Line(
      points={{66,64},{72,64},{72,84},{80,84}},
      color={127,0,0},
      thickness=0.5));
  connect(flowMeasure1.q_out,Alveoly. q_in[3]) annotation (Line(
      points={{-20,64},{-12,64},{-12,59.9},{1.73333,59.9}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureSource.y,volumePump. q_in) annotation (Line(
      points={{-86,82},{-86,96},{-10,96}},
      color={127,0,0},
      thickness=0.5));
  connect(flowMeasure1.q_in,conductor. q_out) annotation (Line(
      points={{-40,64},{-52,64}},
      color={127,0,0},
      thickness=0.5));
  connect(pressureSource.y,conductor. q_in) annotation (Line(
      points={{-86,82},{-86,64},{-72,64}},
      color={127,0,0},
      thickness=0.5));
  connect(Alveoly.substances[1],O2. gas_port) annotation (Line(points={{0,50},{
          -4,50},{-4,38},{-16,38},{-16,28}},
                                           color={158,66,200}));
  connect(Alveoly.substances[2],CO2. gas_port) annotation (Line(points={{0,50},{
          2,50},{2,40},{18,40},{18,26}}, color={158,66,200}));
  connect(srdceP.q_out,PlicArterie. q_in[1]) annotation (Line(
      points={{-56,-146},{-58,-146},{-58,-90.2667},{-52.1,-90.2667}},
      color={127,0,0},
      thickness=0.5));
  connect(SrdceL.q_in,PlicVena. q_in[1]) annotation (Line(
      points={{84,-118},{84,-108},{66,-108},{66,-92.2667},{79.9,-92.2667}},
      color={127,0,0},
      thickness=0.5));
  connect(srdceP.q_in,Veny. q_in[1]) annotation (Line(
      points={{-56,-166},{-56,-220.267},{-54.1,-220.267}},
      color={127,0,0},
      thickness=0.5));
  connect(SrdceL.q_out, flowMeasure2.q_in) annotation (Line(
      points={{84,-138},{84,-144},{62,-144},{62,-150}},
      color={127,0,0},
      thickness=0.5));
  connect(flowMeasure2.q_out, Arterie.q_in[1]) annotation (Line(
      points={{62,-170},{56,-170},{56,-184},{81.9,-184},{81.9,-217.093}},
      color={127,0,0},
      thickness=0.5));
  connect(TlakPlicVeny.q_in,PlicVena. q_in[2]) annotation (Line(
      points={{102,-80},{100,-80},{100,-94},{79.9,-94}},
      color={127,0,0},
      thickness=0.5));
  connect(TlakArterie.q_in,Arterie. q_in[2]) annotation (Line(
      points={{108,-216},{98,-216},{98,-220},{81.9,-220},{81.9,-219}},
      color={127,0,0},
      thickness=0.5));
  connect(TlakVeny.q_in,Veny. q_in[2]) annotation (Line(
      points={{-130,-222},{-68,-222},{-68,-208},{-56,-208},{-56,-218},{-54.1,
          -218},{-54.1,-222}},
      color={127,0,0},
      thickness=0.5));
  connect(TlakPlicArterie.q_in,PlicArterie. q_in[2]) annotation (Line(
      points={{-30,-122},{-38,-122},{-38,-114},{-52.1,-114},{-52.1,-92}},
      color={127,0,0},
      thickness=0.5));
  connect(TlakPlicVeny.pressure,product1. u2)
    annotation (Line(points={{112,-78},{120,-78},{120,-100}},
                                                         color={0,0,127}));
  connect(hydraulicConductance.y,product1. u1) annotation (Line(points={{127,-56},
          {136,-56},{136,-100},{132,-100}},
                                        color={0,0,127}));
  connect(product1.y,SrdceL. solutionFlow) annotation (Line(points={{126,-123},
          {126,-134},{91,-134},{91,-128}},
                                color={0,0,127}));
  connect(hydraulicConductance1.y,product2. u1) annotation (Line(points={{-145,
          -164},{-140,-164},{-140,-172},{-122,-172}},
                                            color={0,0,127}));
  connect(TlakVeny.pressure,product2. u2) annotation (Line(points={{-120,-220},
          {-116,-220},{-116,-184},{-122,-184}},
                                       color={0,0,127}));
  connect(product2.y,srdceP. solutionFlow) annotation (Line(points={{-99,-178},
          {-88,-178},{-88,-174},{-63,-174},{-63,-156}},      color={0,0,127}));
  connect(Veny.q_in[3],resistor2. q_out) annotation (Line(
      points={{-54.1,-223.733},{-44,-223.733},{-44,-224},{-18,-224},{-18,-222}},
      color={127,0,0},
      thickness=0.5));
  connect(resistor1.q_in,Arterie. q_in[3]) annotation (Line(
      points={{52,-222},{81.9,-222},{81.9,-220.907}},
      color={127,0,0},
      thickness=0.5));
  connect(resistor.q_in,PlicArterie. q_in[3]) annotation (Line(
      points={{-20,-90},{-32,-90},{-32,-93.7333},{-52.1,-93.7333}},
      color={127,0,0},
      thickness=0.5));
  connect(resistor3.q_out,PlicVena. q_in[3]) annotation (Line(
      points={{50,-88},{66,-88},{66,-90},{79.9,-90},{79.9,-95.7333}},
      color={127,0,0},
      thickness=0.5));
  connect(elasticVessel.q_in[1],resistor2. q_in) annotation (Line(
      points={{13.92,-278.1},{13.92,-222},{2,-222}},
      color={127,0,0},
      thickness=0.5));
  connect(TlakKapilaryTelo.q_in,elasticVessel. q_in[2]) annotation (Line(
      points={{-16,-260},{-16,-266},{14.96,-266},{14.96,-278.1}},
      color={127,0,0},
      thickness=0.5));
  connect(TlakKapilaryPlice.q_in,elasticVessel1. q_in[1]) annotation (Line(
      points={{56,-62},{17.95,-61.9}},
      color={127,0,0},
      thickness=0.5));
  connect(O2.liquid_port, elasticVessel1.substances[2])
    annotation (Line(points={{-16,8},{-16,-52},{16,-52}}, color={158,66,200}));
  connect(CO2.liquid_port, elasticVessel1.substances[3])
    annotation (Line(points={{18,6},{16,6},{16,-52}}, color={158,66,200}));
  connect(CO2_left1.port_b, elasticVessel.substances[3]) annotation (Line(
        points={{74,-292},{56,-292},{56,-286},{16,-286},{16,-288}}, color={158,
          66,200}));
  connect(O2_left1.port_a, elasticVessel.substances[2]) annotation (Line(points=
         {{-54,-280},{16,-280},{16,-288}}, color={158,66,200}));
  connect(pO2.referenceFluidPort, elasticVessel1.q_in[2]) annotation (Line(
      points={{-70,14.2},{-72,14.2},{-72,24},{-70,24},{-70,-30},{-72,-30},{-72,
          -61.9},{16.65,-61.9}},
      color={127,0,0},
      thickness=0.5));
  connect(pCO2.referenceFluidPort, elasticVessel1.q_in[2]) annotation (Line(
      points={{78,6.2},{78,-40},{34,-40},{34,-61.9},{16.65,-61.9}},
      color={127,0,0},
      thickness=0.5));
  connect(O2.liquid_port, pO2.port_a) annotation (Line(points={{-16,8},{-16,-14},
          {-38,-14},{-38,24},{-60,24}}, color={158,66,200}));
  connect(CO2.liquid_port, pCO2.port_a) annotation (Line(points={{18,6},{16,6},{
          16,-12},{52,-12},{52,16},{88,16}}, color={158,66,200}));
  connect(O2_left1.port_a, pO2_tissue.port_a) annotation (Line(points={{-54,-280},
          {-32,-280},{-32,-326},{-46,-326}}, color={158,66,200}));
  connect(pO2_tissue.referenceFluidPort, elasticVessel.q_in[3]) annotation (
      Line(
      points={{-56,-335.8},{-44,-335.8},{-44,-330},{4,-330},{4,-266},{14,-266},
          {14,-274},{16,-274},{16,-278.1}},
      color={127,0,0},
      thickness=0.5));
  connect(pCO2_tissue.referenceFluidPort, elasticVessel.q_in[4]) annotation (
      Line(
      points={{92,-343.8},{17.04,-343.8},{17.04,-278.1}},
      color={127,0,0},
      thickness=0.5));
  connect(CO2_left1.port_b, pCO2_tissue.port_a) annotation (Line(points={{74,-292},
          {56,-292},{56,-334},{102,-334}}, color={158,66,200}));
  connect(resistor.q_out, elasticVessel1.q_in[3]) annotation (Line(
      points={{0,-90},{15.35,-90},{15.35,-61.9}},
      color={127,0,0},
      thickness=0.5));
  connect(resistor3.q_in, elasticVessel1.q_in[4]) annotation (Line(
      points={{30,-88},{18,-88},{18,-61.9},{14.05,-61.9}},
      color={127,0,0},
      thickness=0.5));
  connect(resistor1.q_out, elasticVessel.q_in[5]) annotation (Line(
      points={{32,-222},{18.08,-222},{18.08,-278.1}},
      color={127,0,0},
      thickness=0.5));
  annotation (
    uses(
      Modelica(version="4.0.0"),
      Physiolibrary(version="3.0.0-alpha8"),
      Chemical(version="1.4.0")),
    Diagram(coordinateSystem(extent={{-200,-400},{240,100}})),
    Icon(coordinateSystem(extent={{-200,-400},{240,100}})));
end spojeni;
