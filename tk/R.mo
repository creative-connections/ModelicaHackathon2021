within ;
package R
   model BasicCirculation4
    replaceable package Blood = Physiolibrary.Media.Water constrainedby
      Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
    //package Blood = Physiolibrary.Media.BloodBySiggaardAndersen
    Physiolibrary.Fluid.Components.ElasticVessel pulmonaryCapilaries(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00015,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0001,
      nPorts=1) annotation (Placement(transformation(extent={{-22,78},{-2,98}})));
    Circulation circulation(redeclare package Blood = Blood) annotation (
        Placement(transformation(rotation=0, extent={{-22,20},{-2,40}})));
   equation
    connect(pulmonaryCapilaries.q_in[1], circulation.pulmonaryCapys_out)
      annotation (Line(
        points={{-12.1,88},{-11.9,39.8182}},
        color={127,0,0},
        thickness=0.5));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,220}})),                                  Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              220}})));
   end BasicCirculation4;

   model BasicRespiration4
    parameter Physiolibrary.Types.Frequency RR=0.28333333333333
                                                    "Respiration rate";
    parameter Physiolibrary.Types.Volume DV=0.00015 "Dead space";
    parameter Physiolibrary.Types.Volume TV=0.0005
                                                "Tidal volume"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
    Physiolibrary.Fluid.Sources.PressureSource inspiredAir(redeclare package
        Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-96,56},{-76,76}})));
    Physiolibrary.Fluid.Components.VolumePump deadspace(redeclare package
        Medium =
          Physiolibrary.Media.Air,                      SolutionFlow=DV*RR)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=0,
          origin={18,86})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource totalRespiration(SolutionFlow=
         TV*RR, redeclare package Medium = Physiolibrary.Media.Air)
                annotation (Placement(transformation(extent={{80,58},{100,78}})));
    Physiolibrary.Fluid.Components.ElasticVessel alveoli(
      redeclare package Medium = Physiolibrary.Media.Air,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0016,
      Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
      ZeroPressureVolume(displayUnit="l") = 0.0013,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=5) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,18})));
    Physiolibrary.Fluid.Sensors.FlowMeasure alveolarVentilationPost(redeclare
        package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{22,14},{42,34}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure(redeclare
        package Medium =
                 Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-6,40},{14,60}})));
    Physiolibrary.Fluid.Components.Conductor conductor(
                                                     redeclare package Medium
        = Physiolibrary.Media.Air, Conductance(displayUnit="l/(cmH2O.s)") = 1.019716212977928e-05
        *(1/1.5))
      annotation (Placement(transformation(extent={{-62,54},{-42,74}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure alveolarVentilationPre(redeclare
        package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-50,26},{-30,46}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure totalVentilation(redeclare package
        Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{50,58},{70,78}})));
    Chemical.Components.GasSolubility gasSolubility(KC=1e-4)
      annotation (Placement(transformation(extent={{-22,-40},{-2,-20}})));
    Chemical.Components.GasSolubility gasSolubility1(KC=1e-4)
      annotation (Placement(transformation(extent={{10,-40},{30,-20}})));
     Chemical.Sources.SubstanceOutflow O2_left(SubstanceFlow(displayUnit="mmol/min")=
           0.00025666666666667)
       annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-62,-146})));
     Chemical.Sources.SubstanceInflowT CO2_left(
      SubstanceFlow(displayUnit="mmol/min") = 0.00020566666666667,
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas())
       annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={48,-154})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2_blood(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-88,-28},{-68,-8}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2_blood(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{48,-32},{68,-12}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2_alveoli(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-92,24},{-72,44}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2_alveoli(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{62,6},{82,26}})));
     Circulation circulation(redeclare package Blood =
           Physiolibrary.Media.BloodBySiggaardAndersen)       annotation (
         Placement(transformation(rotation=0, extent={{-14,-136},{6,-116}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonaryCapilaries(
       redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
       useSubstances=true,
       volume_start(displayUnit="l") = 0.00015,
       Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
       ZeroPressureVolume(displayUnit="l") = 0.0001,
      nPorts=4) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
           rotation=270,
           origin={-4,-88})));
     Physiolibrary.Fluid.Components.ElasticVessel systemicCapilary(
       redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
       useSubstances=true,
       volume_start(displayUnit="l") = 0.0003,
       Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
       ZeroPressureVolume(displayUnit="l") = 0.0002,
      nPorts=2)
       annotation (Placement(transformation(extent={{-14,-164},{6,-144}})));
     Physiolibrary.Fluid.Components.Resistor pulmonary1(redeclare package
        Medium = Physiolibrary.Media.BloodBySiggaardAndersen, Resistance=
          7999343.2449*(3*7/8))
       annotation (Placement(transformation(extent={{-44,-104},{-24,-84}})));
     Physiolibrary.Fluid.Components.Resistor systemic1(redeclare package Medium
        = Physiolibrary.Media.BloodBySiggaardAndersen, Resistance=7999343.2449*
          (20*7/8))
       annotation (Placement(transformation(extent={{30,-144},{50,-124}})));
   equation
    connect(alveolarVentilationPost.q_in, alveoli.q_in[1]) annotation (Line(
        points={{22,24},{14,24},{14,38},{-20,38},{-20,17.9},{-2.08,17.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasure.q_in, alveoli.q_in[2]) annotation (Line(
        points={{0,44},{0,38},{-20,38},{-20,17.9},{-1.04,17.9}},
        color={127,0,0},
        thickness=0.5));
    connect(inspiredAir.y, conductor.q_in) annotation (Line(
        points={{-76,66},{-76,64},{-62,64}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolarVentilationPre.q_out, alveoli.q_in[3]) annotation (Line(
        points={{-30,36},{-20,36},{-20,17.9},{1.11022e-16,17.9}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolarVentilationPre.q_in, conductor.q_out) annotation (Line(
        points={{-50,36},{-54,36},{-54,50},{-44,50},{-44,54},{-38,54},{-38,64},{
            -42,64}},
        color={127,0,0},
        thickness=0.5));
    connect(totalVentilation.q_out, totalRespiration.q_in) annotation (Line(
        points={{70,68},{80,68}},
        color={127,0,0},
        thickness=0.5));
    connect(totalVentilation.q_in, deadspace.q_out) annotation (Line(
        points={{50,68},{50,86},{28,86}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolarVentilationPost.q_out, totalVentilation.q_in) annotation (
        Line(
        points={{42,24},{46,24},{46,62},{44,62},{44,86},{50,86},{50,68}},
        color={127,0,0},
        thickness=0.5));
    connect(alveoli.substances[1], gasSolubility.gas_port) annotation (Line(
          points={{-8.88178e-16,8},{-8.88178e-16,-4},{-12,-4},{-12,-20}}, color=
           {158,66,200}));
    connect(gasSolubility.liquid_port, pulmonaryCapilaries.substances[2])
      annotation (Line(points={{-12,-40},{-12,-58},{-4,-58},{-4,-78}},
                                                                     color={158,
            66,200}));
    connect(gasSolubility1.gas_port, alveoli.substances[2]) annotation (Line(
          points={{20,-20},{20,-4},{-8.88178e-16,-4},{-8.88178e-16,8}}, color={158,
            66,200}));
    connect(gasSolubility1.liquid_port, pulmonaryCapilaries.substances[3])
      annotation (Line(points={{20,-40},{20,-72},{-4,-72},{-4,-78}},
                                                                   color={158,66,
            200}));
    connect(gasSolubility.liquid_port, pO2_blood.port_a) annotation (Line(
          points={{-12,-40},{-12,-54},{-26,-54},{-26,-18},{-68,-18}}, color={158,
            66,200}));

    connect(pO2_alveoli.port_a, gasSolubility.gas_port) annotation (Line(points=
           {{-72,34},{-42,34},{-42,-10},{-12,-10},{-12,-20}}, color={158,66,200}));
    connect(pO2_alveoli.referenceFluidPort, alveoli.q_in[4]) annotation (Line(
        points={{-82,24.2},{-96,24.2},{-96,-2},{-84,-2},{-84,-4},{-22,-4},{-22,17.9},
            {1.04,17.9}},
        color={127,0,0},
        thickness=0.5));
    connect(gasSolubility1.gas_port, pCO2_alveoli.port_a) annotation (Line(
          points={{20,-20},{20,-4},{52,-4},{52,16},{82,16}}, color={158,66,200}));
    connect(pCO2_alveoli.referenceFluidPort, alveoli.q_in[5]) annotation (Line(
        points={{72,6.2},{72,0},{14,0},{14,38},{-20,38},{-20,17.9},{2.08,17.9}},
        color={127,0,0},
        thickness=0.5));

    connect(deadspace.q_in, conductor.q_in) annotation (Line(
        points={{8,86},{-62,86},{-62,64}},
        color={127,0,0},
        thickness=0.5));
     connect(gasSolubility1.liquid_port, pCO2_blood.port_a)
       annotation (Line(points={{20,-40},{20,-22},{68,-22}}, color={158,66,200}));
     connect(CO2_left.port_b, systemicCapilary.substances[3]) annotation (Line(
           points={{38,-154},{10,-154},{10,-168},{-18,-168},{-18,-154},{-14,-154}},
           color={158,66,200}));
     connect(O2_left.port_a, systemicCapilary.substances[2]) annotation (Line(
           points={{-52,-146},{-20,-146},{-20,-154},{-14,-154}}, color={158,66,200}));
    connect(pulmonaryCapilaries.q_in[1], circulation.pulmonaryCapys_out)
      annotation (Line(
        points={{-2.05,-87.9},{8,-87.9},{8,-108},{-2,-108},{-2,-112},{-1.9,-112},
            {-1.9,-116}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryCapilaries.q_in[2], pCO2_blood.referenceFluidPort)
      annotation (Line(
        points={{-3.35,-87.9},{58,-87.9},{58,-31.8}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryCapilaries.q_in[3], pO2_blood.referenceFluidPort)
      annotation (Line(
        points={{-4.65,-87.9},{8,-87.9},{8,-108},{-78,-108},{-78,-27.8}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonary1.q_out, pulmonaryCapilaries.q_in[4]) annotation (Line(
        points={{-24,-94},{-5.95,-94},{-5.95,-87.9}},
        color={127,0,0},
        thickness=0.5));
    connect(circulation.pulmonaryCapys_in, pulmonary1.q_in) annotation (Line(
        points={{-6.4,-116.182},{-6.4,-106},{-48,-106},{-48,-94},{-44,-94}},
        color={127,0,0},
        thickness=0.5));
    connect(systemicCapilary.q_in[1], circulation.systemicCapys_out)
      annotation (Line(
        points={{-4.1,-152.7},{-4.1,-140},{-6.8,-140},{-6.8,-136.182}},
        color={127,0,0},
        thickness=0.5));
    connect(circulation.systemicCapys_in, systemic1.q_in) annotation (Line(
        points={{-0.8,-136.091},{-0.8,-140},{24,-140},{24,-134},{30,-134}},
        color={127,0,0},
        thickness=0.5));
    connect(systemic1.q_out, systemicCapilary.q_in[2]) annotation (Line(
        points={{50,-134},{90,-134},{90,-180},{-4.1,-180},{-4.1,-155.3}},
        color={127,0,0},
        thickness=0.5));
     annotation (Diagram(coordinateSystem(extent={{-100,-200},{120,100}})), Icon(
           coordinateSystem(extent={{-100,-200},{120,100}})));
   end BasicRespiration4;

   model BasicRespiration5
    parameter Physiolibrary.Types.Frequency RR=0.28333333333333
                                                    "Respiration rate";
    parameter Physiolibrary.Types.Volume DV=0.00015 "Dead space";
    parameter Physiolibrary.Types.Volume TV=0.0005
                                                "Tidal volume"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
    Physiolibrary.Fluid.Sources.PressureSource inspiredAir(redeclare package
        Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-98,56},{-78,76}})));
    Physiolibrary.Fluid.Components.VolumePump deadspace(redeclare package
        Medium =
          Physiolibrary.Media.Air,                      SolutionFlow=DV*RR)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=0,
          origin={18,86})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource totalRespiration(SolutionFlow=
         TV*RR, redeclare package Medium = Physiolibrary.Media.Air)
                annotation (Placement(transformation(extent={{80,58},{100,78}})));
    Physiolibrary.Fluid.Components.ElasticVessel alveoli(
      redeclare package Medium = Physiolibrary.Media.Air,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0016,
      Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
      ZeroPressureVolume(displayUnit="l") = 0.0013,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=5) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,18})));
    Physiolibrary.Fluid.Sensors.FlowMeasure alveolarVentilationPost(redeclare
        package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{22,14},{42,34}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure(redeclare
        package Medium =
                 Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-6,40},{14,60}})));
    Physiolibrary.Fluid.Components.Resistor resistor(redeclare package Medium =
          Physiolibrary.Media.Air,                   Resistance(displayUnit="(cmH2O.s)/l")=
           147099.75)
      annotation (Placement(transformation(extent={{-66,54},{-46,74}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure alveolarVentilationPre(redeclare
        package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-50,26},{-30,46}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure totalVentilation(redeclare package
        Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{50,58},{70,78}})));
    Chemical.Components.GasSolubility gasSolubility
      annotation (Placement(transformation(extent={{-22,-40},{-2,-20}})));
    Chemical.Components.GasSolubility gasSolubility1
      annotation (Placement(transformation(extent={{10,-40},{30,-20}})));
     Chemical.Sources.SubstanceOutflow O2_left(SubstanceFlow(displayUnit="mmol/min")=
           0.00025666666666667)
       annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-42,-54})));
     Chemical.Sources.SubstanceInflowT CO2_left(
      SubstanceFlow(displayUnit="mmol/min") = 0.00020566666666667,
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas())
       annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={54,-52})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-88,-28},{-68,-8}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{48,-32},{68,-12}})));
   equation
    connect(alveolarVentilationPost.q_in, alveoli.q_in[1]) annotation (Line(
        points={{22,24},{14,24},{14,38},{-20,38},{-20,17.9},{-2.08,17.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasure.q_in, alveoli.q_in[2]) annotation (Line(
        points={{0,44},{0,38},{-20,38},{-20,17.9},{-1.04,17.9}},
        color={127,0,0},
        thickness=0.5));
    connect(inspiredAir.y, resistor.q_in) annotation (Line(
        points={{-78,66},{-78,64},{-66,64}},
        color={127,0,0},
        thickness=0.5));
    connect(resistor.q_out, deadspace.q_in) annotation (Line(
        points={{-46,64},{-38,64},{-38,86},{8,86}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolarVentilationPre.q_out, alveoli.q_in[3]) annotation (Line(
        points={{-30,36},{-20,36},{-20,17.9},{1.11022e-16,17.9}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolarVentilationPre.q_in, resistor.q_out) annotation (Line(
        points={{-50,36},{-54,36},{-54,50},{-44,50},{-44,54},{-38,54},{-38,64},{-46,
            64}},
        color={127,0,0},
        thickness=0.5));
    connect(totalVentilation.q_out, totalRespiration.q_in) annotation (Line(
        points={{70,68},{80,68}},
        color={127,0,0},
        thickness=0.5));
    connect(totalVentilation.q_in, deadspace.q_out) annotation (Line(
        points={{50,68},{50,86},{28,86}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolarVentilationPost.q_out, totalVentilation.q_in) annotation (
        Line(
        points={{42,24},{46,24},{46,62},{44,62},{44,86},{50,86},{50,68}},
        color={127,0,0},
        thickness=0.5));
    connect(alveoli.substances[1], gasSolubility.gas_port) annotation (Line(
          points={{-8.88178e-16,8},{-8.88178e-16,-4},{-12,-4},{-12,-20}}, color=
           {158,66,200}));
    connect(gasSolubility1.gas_port, alveoli.substances[2]) annotation (Line(
          points={{20,-20},{20,-4},{-8.88178e-16,-4},{-8.88178e-16,8}}, color={158,
            66,200}));
    connect(gasSolubility.liquid_port, O2_left.port_a) annotation (Line(points={
            {-12,-40},{-12,-54},{-32,-54}}, color={158,66,200}));
    connect(gasSolubility1.liquid_port, CO2_left.port_b) annotation (Line(
          points={{20,-40},{20,-52},{44,-52}}, color={158,66,200}));
    connect(gasSolubility.liquid_port, pO2.port_a) annotation (Line(points={{-12,
            -40},{-12,-54},{-26,-54},{-26,-18},{-68,-18}}, color={158,66,200}));
    connect(pCO2.port_a, CO2_left.port_b) annotation (Line(points={{68,-22},{72,
            -22},{72,-8},{36,-8},{36,-52},{44,-52}}, color={158,66,200}));
    connect(pO2.referenceFluidPort, alveoli.q_in[4]) annotation (Line(
        points={{-78,-27.8},{-78,-32},{-96,-32},{-96,17.9},{1.04,17.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2.referenceFluidPort, alveoli.q_in[5]) annotation (Line(
        points={{58,-31.8},{58,-36},{76,-36},{76,8},{14,8},{14,38},{-20,38},{-20,
            17.9},{2.08,17.9}},
        color={127,0,0},
        thickness=0.5));
   end BasicRespiration5;

  model Circulation
    Physiolibrary.Fluid.Components.ElasticVessel arteries(
      redeclare package Medium = Blood,
      useSubstances=false,
      volume_start(displayUnit="l") = 0.00085,
      Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
      ZeroPressureVolume(displayUnit="l") = 0.00045,
      nPorts=3) annotation (Placement(transformation(extent={{24,-6},{44,14}})));
    Physiolibrary.Fluid.Components.ElasticVessel veins(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00325,
      Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
      ZeroPressureVolume(displayUnit="l") = 0.00275,
      ExternalPressure(displayUnit="bar"),
      nPorts=3) annotation (Placement(transformation(extent={{-66,-8},{-46,12}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonaryArteries(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00038,
      Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0003,
      nPorts=3)
      annotation (Placement(transformation(extent={{-82,82},{-62,102}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonaryVeins(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.0004,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0004,
      nPorts=3) annotation (Placement(transformation(extent={{30,74},{50,94}})));
    Physiolibrary.Fluid.Components.VolumePump leftHeart(
      redeclare package Medium = Blood,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={34,40})));
    Physiolibrary.Fluid.Components.VolumePump rightHeart(
      redeclare package Medium = Blood,
      useSolutionFlowInput=true,
      SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-54,38})));
    Physiolibrary.Fluid.Components.Resistor systemic2(redeclare package Medium
        = Blood, Resistance=7999343.2449*(20/8))
      annotation (Placement(transformation(extent={{-48,-50},{-28,-30}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure arteriesP(redeclare package
        Medium = Blood)
      annotation (Placement(transformation(extent={{64,0},{84,20}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure veinsP(redeclare package Medium
        = Blood)
      annotation (Placement(transformation(extent={{-112,0},{-92,20}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pulmonaryP(redeclare package
        Medium = Blood)
      annotation (Placement(transformation(extent={{-116,84},{-96,104}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pulmonaryVeinsP(redeclare
        package Medium =
                 Blood)
      annotation (Placement(transformation(extent={{66,86},{86,106}})));
    Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={68,42})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance(
        k=1.5001231516913e-07)
      annotation (Placement(transformation(extent={{100,26},{108,34}})));
    Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-90,40})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance1(
       k=1.5001231516913e-07)
      annotation (Placement(transformation(extent={{-118,44},{-110,52}})));
    Physiolibrary.Fluid.Components.Resistor pulmonary2(redeclare package Medium
        = Blood, Resistance=7999343.2449*(3/8))
      annotation (Placement(transformation(extent={{-6,86},{14,106}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pulmonaryCapilaryP(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-16,66},{4,86}})));
   replaceable package Blood = Physiolibrary.Media.Water constrainedby
      Physiolibrary.Media.Interfaces.PartialMedium
                                    annotation (choicesAllMatching=true);
    Physiolibrary.Fluid.Interfaces.FluidPort_b pulmonaryCapys_out(redeclare
        package Medium = Blood) annotation (Placement(transformation(rotation=0,
            extent={{12,110},{30,130}}), iconTransformation(extent={{12,110},{
              30,130}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a systemicCapys_in(redeclare
        package Medium = Blood) annotation (Placement(transformation(rotation=0,
            extent={{22,-112},{42,-90}}), iconTransformation(extent={{22,-112},
              {42,-90}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a pulmonaryCapys_in(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-34,108},{-14,128}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b systemicCapys_out(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-38,-112},{-18,-92}})));
  equation
   connect(pulmonaryVeins.q_in[1],leftHeart. q_in) annotation (Line(
       points={{39.9,85.7333},{20,85.7333},{20,54},{34,54},{34,50}},
       color={127,0,0},
       thickness=0.5));
   connect(leftHeart.q_out,arteries. q_in[1]) annotation (Line(
       points={{34,30},{34,18},{20,18},{20,5.73333},{33.9,5.73333}},
       color={127,0,0},
       thickness=0.5));
   connect(veins.q_in[1],rightHeart. q_in) annotation (Line(
       points={{-56.1,3.73333},{-56.1,6},{-54,6},{-54,28}},
       color={127,0,0},
       thickness=0.5));
   connect(pulmonaryArteries.q_in[1],rightHeart. q_out) annotation (Line(
       points={{-72.1,93.7333},{-72.1,78},{-54,78},{-54,48}},
       color={127,0,0},
       thickness=0.5));
   connect(systemic2.q_in,veins. q_in[2]) annotation (Line(
       points={{-48,-40},{-72,-40},{-72,16},{-54,16},{-54,6},{-56.1,6},{-56.1,2}},
       color={127,0,0},
       thickness=0.5));
   connect(arteriesP.q_in,arteries. q_in[2]) annotation (Line(
       points={{70,4},{70,-12},{20,-12},{20,4},{33.9,4}},
       color={127,0,0},
       thickness=0.5));
   connect(veinsP.q_in,veins. q_in[3]) annotation (Line(
       points={{-106,4},{-106,-4},{-72,-4},{-72,16},{-54,16},{-54,6},{-56.1,6},{-56.1,
            0.26667}},
       color={127,0,0},
       thickness=0.5));
   connect(pulmonaryP.q_in,pulmonaryArteries. q_in[2]) annotation (Line(
       points={{-110,88},{-110,76},{-72.1,76},{-72.1,92}},
       color={127,0,0},
       thickness=0.5));
   connect(pulmonaryVeinsP.q_in,pulmonaryVeins. q_in[2]) annotation (Line(
       points={{72,90},{72,70},{20,70},{20,84},{39.9,84}},
       color={127,0,0},
       thickness=0.5));
   connect(product1.y,leftHeart. solutionFlow)
     annotation (Line(points={{57,42},{50,42},{50,40},{41,40}},
                                                            color={0,0,127}));
   connect(product1.u2,pulmonaryVeinsP. pressure) annotation (Line(points={{80,48},
            {88,48},{88,92},{82,92}},color={0,0,127}));
   connect(hydraulicConductance.y,product1. u1) annotation (Line(points={{109,30},
            {116,30},{116,36},{80,36}},color={0,0,127}));
   connect(veinsP.pressure,product2. u2) annotation (Line(points={{-96,6},{-88,6},
            {-88,26},{-100,26},{-100,34},{-102,34}},       color={0,0,127}));
   connect(hydraulicConductance1.y,product2. u1) annotation (Line(points={{-109,48},
            {-100,48},{-100,46},{-102,46}},
                                         color={0,0,127}));
   connect(rightHeart.solutionFlow,product2. y)
     annotation (Line(points={{-61,38},{-61,40},{-79,40}},
                                                        color={0,0,127}));
   connect(pulmonary2.q_out,pulmonaryVeins. q_in[3]) annotation (Line(
       points={{14,96},{22,96},{22,82.2667},{39.9,82.2667}},
       color={127,0,0},
       thickness=0.5));
   connect(pulmonaryCapilaryP.q_in,pulmonary2. q_in) annotation (Line(
       points={{-10,70},{-12,70},{-12,96},{-6,96}},
       color={127,0,0},
       thickness=0.5));
    connect(pulmonary2.q_in, pulmonaryCapys_out) annotation (Line(
        points={{-6,96},{-8,96},{-8,108},{22,108},{22,114},{21,114},{21,120}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryArteries.q_in[3], pulmonaryCapys_in) annotation (Line(
        points={{-72.1,90.2667},{-24,90.2667},{-24,118}},
        color={127,0,0},
        thickness=0.5));
    connect(systemic2.q_out, systemicCapys_out) annotation (Line(
        points={{-28,-40},{-22,-40},{-22,-88},{-28,-88},{-28,-102}},
        color={127,0,0},
        thickness=0.5));
    connect(arteries.q_in[3], systemicCapys_in) annotation (Line(
        points={{33.9,2.26667},{20,2.26667},{20,-12},{32,-12},{32,-101}},
        color={127,0,0},
        thickness=0.5));
    annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,120}})), Icon(
          coordinateSystem(extent={{-100,-100},{100,120}})));
  end Circulation;
  annotation (uses(Physiolibrary(version="3.0.0-alpha7"), Chemical(version="1.4.0-alpha7"),
      Modelica(version="4.0.0")));
end R;
