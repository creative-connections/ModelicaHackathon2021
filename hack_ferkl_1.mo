within ;
package hack_ferkl_1

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
      //parameter Physiolibrary.Types.Fraction FlungShunt(start=0.02);
      parameter Physiolibrary.Types.HydraulicConductance C_shunt=
        1.250102626409427e-07*((0.02*(1/3)));
     // parameter Physiolibrary.Types.HydraulicConductance C_perf=1.250102626409427e-07
        //*((1 - 0.02)*(1/3));
      parameter Integer NA = 10 "pocet alveolarnich jednotek";
      parameter Physiolibrary.Types.HydraulicConductance C_totalVentilace=
        1.019716212977928e-05*((1/1.5));
      parameter Physiolibrary.Types.HydraulicConductance C_totalCirkulace=
        1.250102626409427e-07*(1/3*(1 - 0.02));
    Physiolibrary.Fluid.Sources.PressureSource pressureSource(redeclare package
        Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-138,-30},{-118,-10}})));
    Physiolibrary.Fluid.Components.VolumePump DeadSpace(
      redeclare package Medium = Physiolibrary.Media.Air,
      useSolutionFlowInput=true,
      SolutionFlow=DV*RR)
      annotation (Placement(transformation(extent={{-2,-30},{18,-10}})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource volumeOutflowSource(
      useSolutionFlowInput=true,
        SolutionFlow=TV*RR, redeclare package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=0,
          origin={116,-20})));
    Physiolibrary.Fluid.Components.VolumePump srdceP(
      redeclare package Medium = Blood,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-62,-184})));
    Physiolibrary.Fluid.Components.VolumePump SrdceL(
      redeclare package Medium = Blood,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={78,-156})));
    Physiolibrary.Fluid.Components.Resistor resistor1(redeclare package Medium
        = Blood, Resistance=7999343.2449*((7*20)/8))
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={36,-250})));
    Physiolibrary.Fluid.Components.ElasticVessel PlicArterie(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00038,
      Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0003,
      nPorts=3) annotation (Placement(transformation(extent={{-80,-114},{-60,-94}})));
    Physiolibrary.Fluid.Components.ElasticVessel PlicVena(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.0004,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0004,
      nPorts=3) annotation (Placement(transformation(extent={{48,-124},{68,-104}})));
    Physiolibrary.Fluid.Components.ElasticVessel Arterie(
      redeclare package Medium = Blood,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.00085,
      Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
      ZeroPressureVolume(displayUnit="l") = 0.00045,
      nPorts=5) annotation (Placement(transformation(extent={{66,-258},{86,-236}})));
    Physiolibrary.Fluid.Components.ElasticVessel Veny(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00325,
      Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
      ZeroPressureVolume(displayUnit="l") = 0.00295,
      nPorts=3)
      annotation (Placement(transformation(extent={{-70,-260},{-50,-240}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure2(redeclare package
        Medium =
          Blood)                     annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={56,-188})));
    Physiolibrary.Fluid.Sensors.PressureMeasure TlakPlicVeny(redeclare package
        Medium = Blood)
      annotation (Placement(transformation(extent={{92,-124},{112,-104}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure TlakPlicArterie(redeclare
        package Medium =
                 Blood)
      annotation (Placement(transformation(extent={{-136,-168},{-116,-148}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure TlakVeny(redeclare package
        Medium =
          Blood)
      annotation (Placement(transformation(extent={{-142,-254},{-122,-234}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure TlakArterie(redeclare package
        Medium = Blood)
      annotation (Placement(transformation(extent={{96,-248},{116,-228}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance(k=
          1.250102626409427e-07*(5/4))
      annotation (Placement(transformation(extent={{132,-114},{140,-106}})));
    Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={120,-140})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance1(k=
          1.250102626409427e-07*(5/4))
      annotation (Placement(transformation(extent={{-152,-204},{-144,-196}})));
    Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-116,-206})));
    Physiolibrary.Fluid.Components.Resistor resistor2(redeclare package Medium
        = Blood, Resistance=7999343.2449*(20/8))                     annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-14,-250})));
    Physiolibrary.Fluid.Components.ElasticVessel elasticVessel(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0003,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0002,
      nPorts=5) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={10,-306})));
    Physiolibrary.Fluid.Sensors.PressureMeasure TlakKapilaryTelo(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-28,-292},{-8,-272}})));
    Chemical.Sources.SubstanceInflowT CO2_left1(
      SubstanceFlow(displayUnit="mmol/min") = 0.00020566666666667,
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas()) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={82,-314})));
    Chemical.Sources.SubstanceOutflow O2_left1(useSubstanceFlowInput=false,
        SubstanceFlow(displayUnit="mmol/min") = 0.00025666666666667) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-70,-308})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2_tissue(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-70,-360},{-50,-340}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2_tissue(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={86,-362})));
    Physiolibrary.Fluid.Components.Conductor shunt(redeclare package Medium =
          Blood, Conductance(displayUnit="l/(cmH2O.s)") = C_shunt)
               annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={12,-146})));
    AlveolarniJednotka alveolarniJednotka[NA](
      redeclare package Blood = Blood,
      C_ventilace=ones(NA)*(C_totalVentilace/NA),
      C_cirkulace=ones(NA)*(C_totalCirkulace/NA))
                                   annotation (Placement(transformation(rotation=0,
            extent={{-10,-74},{10,-54}})));
    Physiolibrary.Types.Constants.PressureConst pressure(k(displayUnit="kPa")
         = 4800)
      annotation (Placement(transformation(extent={{148,-272},{156,-264}})));
    Modelica.Blocks.Math.Add add(k1=-1)
      annotation (Placement(transformation(extent={{176,-284},{196,-264}})));
    Modelica.Blocks.Math.Product product3 annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={208,-212})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2Arterie(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={68,-284})));
    Modelica.Blocks.Math.Max max1 annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={184,-128})));
    Modelica.Blocks.Sources.Constant const(k=0)
      annotation (Placement(transformation(extent={{150,-178},{170,-158}})));
    Physiolibrary.Types.Constants.VolumeConst volume(k(displayUnit="l") =
        0.00035) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={110,40})));
    Physiolibrary.Types.Constants.FrequencyConst frequency(k=
          0.01666666666666667*(50/(2 - 0.35))) annotation (Placement(
          transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={168,30})));
    Modelica.Blocks.Math.Division division annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={138,24})));
    Modelica.Blocks.Math.Add TidalVolume annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={80,34})));
    Modelica.Blocks.Math.Product RespirationRate annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={42,40})));
    Physiolibrary.Types.Constants.VolumeConst DeadSpaceVolume(k=DV)
      annotation (Placement(transformation(extent={{-26,36},{-18,44}})));
    Modelica.Blocks.Math.Product product5 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={10,16})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2Arterie(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={126,-300})));
    Physiolibrary.Types.Constants.PressureConst CC(k(displayUnit="kPa") = 4300)
      annotation (Placement(transformation(extent={{122,-330},{130,-322}})));
    Modelica.Blocks.Math.Add scitani(k1=-1) annotation (Placement(
          transformation(
          extent={{10,-10},{-10,10}},
          rotation=180,
          origin={164,-310})));
    Physiolibrary.Types.Constants.VolumeFlowRateConst volumeFlowRate(k(
          displayUnit="l/min") = 0.0019247533333333)
      annotation (Placement(transformation(extent={{216,-290},{224,-282}})));
    Modelica.Blocks.Math.Division Slope annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={248,-264})));
    Modelica.Blocks.Math.Min min1
      annotation (Placement(transformation(extent={{192,-326},{212,-306}})));
    Physiolibrary.Types.Constants.PressureConst pressure1(k(displayUnit="kPa")
         = 700)
      annotation (Placement(transformation(extent={{160,-340},{168,-332}})));
  equation
    connect(DeadSpace.q_out, volumeOutflowSource.q_in) annotation (Line(
        points={{18,-20},{106,-20}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureSource.y, DeadSpace.q_in) annotation (Line(
        points={{-118,-20},{-2,-20}},
        color={127,0,0},
        thickness=0.5));
    connect(srdceP.q_out,PlicArterie. q_in[1]) annotation (Line(
        points={{-62,-174},{-62,-102.267},{-70.1,-102.267}},
        color={127,0,0},
        thickness=0.5));
    connect(SrdceL.q_in,PlicVena. q_in[1]) annotation (Line(
        points={{78,-146},{78,-138},{42,-138},{42,-112.267},{57.9,-112.267}},
        color={127,0,0},
        thickness=0.5));
    connect(srdceP.q_in,Veny. q_in[1]) annotation (Line(
        points={{-62,-194},{-62,-248.267},{-60.1,-248.267}},
        color={127,0,0},
        thickness=0.5));
    connect(SrdceL.q_out, flowMeasure2.q_in) annotation (Line(
        points={{78,-166},{78,-172},{56,-172},{56,-178}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasure2.q_out, Arterie.q_in[1]) annotation (Line(
        points={{56,-198},{50,-198},{50,-212},{75.9,-212},{75.9,-244.712}},
        color={127,0,0},
        thickness=0.5));
    connect(TlakPlicVeny.q_in,PlicVena. q_in[2]) annotation (Line(
        points={{98,-120},{98,-136},{74,-136},{74,-138},{34,-138},{34,-114},{
            57.9,-114}},
        color={127,0,0},
        thickness=0.5));
    connect(TlakArterie.q_in,Arterie. q_in[2]) annotation (Line(
        points={{102,-244},{92,-244},{92,-248},{75.9,-248},{75.9,-245.856}},
        color={127,0,0},
        thickness=0.5));
    connect(TlakVeny.q_in,Veny. q_in[2]) annotation (Line(
        points={{-136,-250},{-74,-250},{-74,-236},{-62,-236},{-62,-246},{-60.1,
            -246},{-60.1,-250}},
        color={127,0,0},
        thickness=0.5));
    connect(TlakPlicArterie.q_in,PlicArterie. q_in[2]) annotation (Line(
        points={{-130,-164},{-130,-174},{-78,-174},{-78,-120},{-62,-120},{-62,
            -104},{-70.1,-104}},
        color={127,0,0},
        thickness=0.5));
    connect(TlakPlicVeny.pressure,product1. u2)
      annotation (Line(points={{108,-118},{120,-118},{120,-128},{114,-128}},
                                                           color={0,0,127}));
    connect(hydraulicConductance.y,product1. u1) annotation (Line(points={{141,-110},
            {148,-110},{148,-122},{134,-122},{134,-120},{126,-120},{126,-128}},
                                          color={0,0,127}));
    connect(product1.y,SrdceL. solutionFlow) annotation (Line(points={{120,-151},{
            120,-162},{85,-162},{85,-156}},
                                  color={0,0,127}));
    connect(hydraulicConductance1.y,product2. u1) annotation (Line(points={{-143,-200},
            {-128,-200}},                     color={0,0,127}));
    connect(TlakVeny.pressure,product2. u2) annotation (Line(points={{-126,-248},{
            -122,-248},{-122,-212},{-128,-212}},
                                         color={0,0,127}));
    connect(product2.y,srdceP. solutionFlow) annotation (Line(points={{-105,-206},
            {-94,-206},{-94,-202},{-69,-202},{-69,-184}},      color={0,0,127}));
    connect(Veny.q_in[3],resistor2. q_out) annotation (Line(
        points={{-60.1,-251.733},{-50,-251.733},{-50,-252},{-24,-252},{-24,-250}},
        color={127,0,0},
        thickness=0.5));
    connect(resistor1.q_in,Arterie. q_in[3]) annotation (Line(
        points={{46,-250},{75.9,-250},{75.9,-247}},
        color={127,0,0},
        thickness=0.5));
    connect(elasticVessel.q_in[1],resistor2. q_in) annotation (Line(
        points={{7.92,-306.1},{7.92,-250},{-4,-250}},
        color={127,0,0},
        thickness=0.5));
    connect(TlakKapilaryTelo.q_in,elasticVessel. q_in[2]) annotation (Line(
        points={{-22,-288},{-22,-294},{8.96,-294},{8.96,-306.1}},
        color={127,0,0},
        thickness=0.5));
    connect(CO2_left1.port_b, elasticVessel.substances[3]) annotation (Line(
          points={{72,-314},{10,-314},{10,-316}},                     color={158,
            66,200}));
    connect(O2_left1.port_a, elasticVessel.substances[2]) annotation (Line(points={{-60,
            -308},{10,-308},{10,-316}},      color={158,66,200}));
    connect(O2_left1.port_a, pO2_tissue.port_a) annotation (Line(points={{-60,
            -308},{-52,-308},{-52,-350},{-50,-350}},
                                               color={158,66,200}));
    connect(pO2_tissue.referenceFluidPort, elasticVessel.q_in[3]) annotation (
        Line(
        points={{-60,-359.8},{-60,-366},{10,-366},{10,-306.1}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2_tissue.referenceFluidPort, elasticVessel.q_in[4]) annotation (
        Line(
        points={{86,-371.8},{11.04,-371.8},{11.04,-306.1}},
        color={127,0,0},
        thickness=0.5));
    connect(CO2_left1.port_b, pCO2_tissue.port_a) annotation (Line(points={{72,-314},
            {68,-314},{68,-362},{76,-362}},  color={158,66,200}));
    connect(resistor1.q_out, elasticVessel.q_in[5]) annotation (Line(
        points={{26,-250},{12.08,-250},{12.08,-306.1}},
        color={127,0,0},
        thickness=0.5));
    connect(shunt.q_in, PlicArterie.q_in[3]) annotation (Line(
        points={{2,-146},{-48,-146},{-48,-105.733},{-70.1,-105.733}},
        color={127,0,0},
        thickness=0.5));
    connect(shunt.q_out, PlicVena.q_in[3]) annotation (Line(
        points={{22,-146},{28,-146},{28,-115.733},{57.9,-115.733}},
        color={127,0,0},
        thickness=0.5));

          for i in 1:NA loop
    connect(alveolarniJednotka[i].q_out,
                              volumeOutflowSource. q_in) annotation (Line(
        points={{8,-54},{8,-44},{86,-44},{86,-20},{106,-20}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureSource.y,alveolarniJednotka[i].q_in)
                                              annotation (Line(
        points={{-118,-20},{-50,-20},{-50,-56},{-10,-56}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolarniJednotka[i].q_out1,
                            PlicVena. q_in[3]) annotation (Line(
        points={{6,-74},{6,-115.733},{57.9,-115.733}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolarniJednotka[i].q_in1,
                          PlicArterie. q_in[3]) annotation (Line(
        points={{-6,-74},{-6,-88},{-86,-88},{-86,-120},{-62,-120},{-62,-105.733},
              {-70.1,-105.733}},
        color={127,0,0},
        thickness=0.5));
          end for;
    connect(pCO2Arterie.partialPressure, add.u2) annotation (Line(points={{78,
            -284},{164,-284},{164,-280},{174,-280}}, color={0,0,127}));
    connect(pressure.y, add.u1)
      annotation (Line(points={{157,-268},{174,-268}}, color={0,0,127}));
    connect(add.y, product3.u2) annotation (Line(points={{197,-274},{202,-274},
            {202,-224}}, color={0,0,127}));
    connect(pCO2Arterie.referenceFluidPort, Arterie.q_in[4]) annotation (Line(
        points={{68,-274.2},{68,-270},{122,-270},{122,-226},{70,-226},{70,-246},
            {75.9,-246},{75.9,-248.144}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2Arterie.port_a, Arterie.substances[3]) annotation (Line(points=
            {{58,-284},{56,-284},{56,-247},{66,-247}}, color={158,66,200}));
    connect(const.y, max1.u2) annotation (Line(points={{171,-168},{178,-168},{
            178,-140}}, color={0,0,127}));
    connect(product3.y, max1.u1) annotation (Line(points={{208,-201},{208,-148},
            {190,-148},{190,-140}}, color={0,0,127}));
    connect(max1.y, volumeOutflowSource.solutionFlow) annotation (Line(points={
            {184,-117},{184,-2},{116,-2},{116,-13}}, color={0,0,127}));
    connect(frequency.y, division.u2) annotation (Line(points={{163,30},{162,30},
            {162,40},{150,40},{150,30}}, color={0,0,127}));
    connect(volume.y, TidalVolume.u2)
      annotation (Line(points={{105,40},{92,40}}, color={0,0,127}));
    connect(division.y, TidalVolume.u1)
      annotation (Line(points={{127,24},{92,24},{92,28}}, color={0,0,127}));
    connect(TidalVolume.y, RespirationRate.u1)
      annotation (Line(points={{69,34},{54,34}}, color={0,0,127}));
    connect(RespirationRate.y, product5.u1)
      annotation (Line(points={{31,40},{16,40},{16,28}}, color={0,0,127}));
    connect(DeadSpaceVolume.y, product5.u2)
      annotation (Line(points={{-17,40},{4,40},{4,28}}, color={0,0,127}));
    connect(product5.y, DeadSpace.solutionFlow) annotation (Line(points={{10,5},
            {10,-4},{10,-13},{8,-13}}, color={0,0,127}));
    connect(max1.y, division.u1) annotation (Line(points={{184,-117},{184,18},{
            150,18}}, color={0,0,127}));
    connect(RespirationRate.u2, division.u1) annotation (Line(points={{54,46},{
            66,46},{66,54},{184,54},{184,18},{150,18}}, color={0,0,127}));
    connect(pO2Arterie.port_a, Arterie.substances[2]) annotation (Line(points={
            {116,-300},{114,-300},{114,-266},{66,-266},{66,-247}}, color={158,
            66,200}));
    connect(pO2Arterie.referenceFluidPort, Arterie.q_in[5]) annotation (Line(
        points={{126,-290.2},{126,-282},{75.9,-282},{75.9,-249.288}},
        color={127,0,0},
        thickness=0.5));
    connect(CC.y, scitani.u1) annotation (Line(points={{131,-326},{146,-326},{
            146,-316},{152,-316}}, color={0,0,127}));
    connect(pO2Arterie.partialPressure, scitani.u2) annotation (Line(points={{
            136,-300},{142,-300},{142,-304},{152,-304}}, color={0,0,127}));
    connect(Slope.y, product3.u1) annotation (Line(points={{248,-253},{248,-232},
            {214,-232},{214,-224}}, color={0,0,127}));
    connect(scitani.y, min1.u1)
      annotation (Line(points={{175,-310},{190,-310}}, color={0,0,127}));
    connect(pressure1.y, min1.u2) annotation (Line(points={{169,-336},{182,-336},
            {182,-322},{190,-322}}, color={0,0,127}));
    connect(volumeFlowRate.y, Slope.u1) annotation (Line(points={{225,-286},{
            242,-286},{242,-276}}, color={0,0,127}));
    connect(min1.y, Slope.u2) annotation (Line(points={{213,-316},{254,-316},{
            254,-276}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(extent={{-200,-400},{380,200}})),
      Icon(coordinateSystem(extent={{-200,-400},{380,200}})));
  end spojeni;

  model AlveolarniJednotka
    Physiolibrary.Fluid.Components.ElasticVessel Alveoly(
      redeclare package Medium = Physiolibrary.Media.Air,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0016,
      Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
      ZeroPressureVolume(displayUnit="l") = 0.0013,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=3) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-6,90})));
    Physiolibrary.Fluid.Sensors.PressureMeasure TlakAlveoly(redeclare package
        Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{122,56},{142,76}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure(redeclare package
        Medium =
          Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{38,100},{58,120}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure1(redeclare package
        Medium =
          Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-46,100},{-26,120}})));
    Physiolibrary.Fluid.Components.Conductor conductor(redeclare package Medium
        = Physiolibrary.Media.Air, Conductance(displayUnit="l/(cmH2O.s)")=
        C_ventilace)
                  annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-80,112})));
    Chemical.Components.GasSolubility O2(KC=1e-4)
      annotation (Placement(transformation(extent={{-34,30},{-14,50}})));
    Chemical.Components.GasSolubility CO2(KC=1e-4)
      annotation (Placement(transformation(extent={{0,28},{20,48}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-88,36},{-68,56}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={70,38})));
    Physiolibrary.Fluid.Components.Conductor conductor1(
                                                     redeclare package Medium
        = Blood, Conductance=C_cirkulace*(8/7))
      annotation (Placement(transformation(extent={{-24,-98},{-4,-78}})));
    Physiolibrary.Fluid.Components.Conductor conductor2(
                                                      redeclare package Medium
        = Blood, Conductance=C_cirkulace*8)
      annotation (Placement(transformation(extent={{26,-96},{46,-76}})));
    Physiolibrary.Fluid.Components.ElasticVessel elasticVessel1(
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.00015,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0001,
      nPorts=4) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={8,-40})));
    Physiolibrary.Fluid.Sensors.PressureMeasure TlakKapilaryPlice(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{42,-44},{62,-24}})));
    replaceable package Blood =
          Physiolibrary.Media.BloodBySiggaardAndersen annotation(choicesAllMatching=True);
      //parameter Physiolibrary.Types.HydraulicConductance C_perf=1.250102626409427e-07
       // *((1 - 0.02)*(1/3));
      parameter Physiolibrary.Types.HydraulicConductance C_ventilace(
        displayUnit="l/(cmH2O.s)")=1.019716212977928e-05*((1/1.5));
      parameter Physiolibrary.Types.HydraulicConductance C_cirkulace=
        1.250102626409427e-07*(1/3);
    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package Medium =
          Physiolibrary.Media.Air) annotation (Placement(transformation(rotation=0,
            extent={{-112.5,95.5},{-87.5,118.5}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b q_out(redeclare package Medium
        = Physiolibrary.Media.Air) annotation (Placement(transformation(rotation=0,
            extent={{112.5,118.5},{137.5,141.5}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in1(redeclare package Medium
        = Blood) annotation (Placement(transformation(rotation=0, extent={{-62.5,-111.5},
              {-37.5,-88.5}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b q_out1(redeclare package Medium
        = Blood) annotation (Placement(transformation(rotation=0, extent={{87.5,-111.5},
              {112.5,-88.5}})));
    Physiolibrary.Fluid.Components.Resistor resistor1(redeclare package Medium
        = Physiolibrary.Media.Air, Resistance=1/C_ventilace)
      annotation (Placement(transformation(extent={{84,100},{104,120}})));
  equation
    connect(TlakAlveoly.q_in,Alveoly. q_in[1]) annotation (Line(
        points={{128,60},{128,50},{86,50},{86,89.9},{-7.73333,89.9}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasure.q_in,Alveoly. q_in[2]) annotation (Line(
        points={{38,110},{6,110},{6,89.9},{-6,89.9}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasure1.q_out,Alveoly. q_in[3]) annotation (Line(
        points={{-26,110},{6,110},{6,89.9},{-4.26667,89.9}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasure1.q_in,conductor. q_out) annotation (Line(
        points={{-46,110},{-62,110},{-62,112},{-70,112}},
        color={127,0,0},
        thickness=0.5));
    connect(Alveoly.substances[1],O2. gas_port) annotation (Line(points={{-6,80},{
            -6,56},{-24,56},{-24,50}},       color={158,66,200}));
    connect(Alveoly.substances[2],CO2. gas_port) annotation (Line(points={{-6,80},
            {-6,58},{10,58},{10,48}},      color={158,66,200}));
    connect(TlakKapilaryPlice.q_in,elasticVessel1. q_in[1]) annotation (Line(
        points={{48,-40},{48,-58},{12,-58},{12,-39.9},{9.95,-39.9}},
        color={127,0,0},
        thickness=0.5));
    connect(O2.liquid_port,elasticVessel1. substances[2])
      annotation (Line(points={{-24,30},{-24,-30},{8,-30}}, color={158,66,200}));
    connect(CO2.liquid_port,elasticVessel1. substances[3])
      annotation (Line(points={{10,28},{8,28},{8,-30}}, color={158,66,200}));
    connect(pO2.referenceFluidPort,elasticVessel1. q_in[2]) annotation (Line(
        points={{-78,36.2},{-80,36.2},{-80,46},{-78,46},{-78,-8},{-80,-8},{-80,-39.9},
            {8.65,-39.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2.referenceFluidPort,elasticVessel1. q_in[2]) annotation (Line(
        points={{70,28.2},{70,-18},{26,-18},{26,-39.9},{8.65,-39.9}},
        color={127,0,0},
        thickness=0.5));
    connect(O2.liquid_port,pO2. port_a) annotation (Line(points={{-24,30},{-24,8},
            {-46,8},{-46,46},{-68,46}},   color={158,66,200}));
    connect(CO2.liquid_port,pCO2. port_a) annotation (Line(points={{10,28},{8,28},
            {8,10},{44,10},{44,38},{80,38}},   color={158,66,200}));
    connect(conductor1.q_out, elasticVessel1.q_in[3]) annotation (Line(
        points={{-4,-88},{14,-88},{14,-39.9},{7.35,-39.9}},
        color={127,0,0},
        thickness=0.5));
    connect(conductor2.q_in, elasticVessel1.q_in[4]) annotation (Line(
        points={{26,-86},{14,-86},{14,-39.9},{6.05,-39.9}},
        color={127,0,0},
        thickness=0.5));
    connect(q_in, conductor.q_in) annotation (Line(points={{-100,107},{-96,107},{-96,
            112},{-90,112}}, color={127,0,0}));
    connect(q_in1, conductor1.q_in) annotation (Line(points={{-50,-100},{-50,-88},
            {-24,-88}}, color={127,0,0}));
    connect(q_out1, conductor2.q_out) annotation (Line(points={{100,-100},{100,
            -86},{46,-86}}, color={127,0,0}));
    connect(flowMeasure.q_out, resistor1.q_in) annotation (Line(
        points={{58,110},{84,110}},
        color={127,0,0},
        thickness=0.5));
    connect(resistor1.q_out, q_out) annotation (Line(
        points={{104,110},{114,110},{114,112},{125,112},{125,130}},
        color={127,0,0},
        thickness=0.5));
    annotation (
      Diagram(coordinateSystem(extent={{-100,-100},{150,130}})),
      Icon(coordinateSystem(extent={{-100,-100},{150,130}})));
  end AlveolarniJednotka;
  annotation (uses(
      Physiolibrary(version="3.0.0-alpha8"),
      Modelica(version="4.0.0"),
      Chemical(version="1.4.0")));
end hack_ferkl_1;
