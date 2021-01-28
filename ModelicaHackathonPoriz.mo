within ;
package ModelicaHackathonPoriz
  model ComplexGasExchangeSystem
    replaceable package CurrentlyChosenMedium =
        Physiolibrary.Media.BloodBySiggaardAndersen constrainedby
      Physiolibrary.Media.Interfaces.PartialMedium                                                             annotation(choicesAllMatching=true);

    replaceable package Currently_Chosen_Environment = Physiolibrary.Media.Air;

    parameter Physiolibrary.Types.Frequency RR=0.286
                                  "Respiration rate";
    parameter Physiolibrary.Types.Volume TV=0.0005
                                            "Tidal volume";
    parameter Physiolibrary.Types.Volume DV=0.00015
                                            "Deadspace volume";
    parameter Physiolibrary.Types.HydraulicConductance C(displayUnit="l/(cmH2O.s)")=
       1.019716212977928e-05*(1/1.5)                     "Total lung conductance";
    parameter Integer N=1
                        "Number of alveolus";
    parameter Integer NumberOfAlveolarUnits=1;
    Physiolibrary.Fluid.Components.VolumePump left_heart(
      redeclare package Medium = CurrentlyChosenMedium,  useSolutionFlowInput=true,
        SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{10,10},{-10,-10}},
          rotation=90,
          origin={62,-6})));
    Physiolibrary.Fluid.Components.VolumePump right_heart(
      redeclare package Medium = CurrentlyChosenMedium,   useSolutionFlowInput=true,
        SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-62,-6})));
    Physiolibrary.Fluid.Components.ElasticVessel arteries(
      redeclare package Medium = CurrentlyChosenMedium,
      volume_start(displayUnit="l") = 0.00085,
      Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
      ZeroPressureVolume(displayUnit="l") = 0.00045,
      nPorts=3) annotation (Placement(transformation(extent={{52,-84},{72,-64}})));
    Physiolibrary.Fluid.Components.ElasticVessel veins(
      redeclare package Medium = CurrentlyChosenMedium,
      volume_start(displayUnit="l") = 0.00325,
      Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
      ZeroPressureVolume(displayUnit="l") = 0.00295,
      nPorts=3)
      annotation (Placement(transformation(extent={{-70,-84},{-50,-64}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonary_arteries(
      redeclare package Medium = CurrentlyChosenMedium,
      volume_start(displayUnit="l") = 0.00038,
      Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0003,
      nPorts=3) annotation (Placement(transformation(extent={{-70,56},{-50,76}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonary_veins(
      redeclare package Medium = CurrentlyChosenMedium,
      volume_start(displayUnit="l") = 0.0004,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0004,
      nPorts=3) annotation (Placement(transformation(extent={{50,54},{70,74}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressure_arteries(redeclare
        package Medium = CurrentlyChosenMedium)
      annotation (Placement(transformation(extent={{80,-72},{100,-52}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure(redeclare package
        Medium =
          CurrentlyChosenMedium)                        annotation (Placement(
          transformation(
          extent={{10,-10},{-10,10}},
          rotation=90,
          origin={62,-38})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressure_pulmonary_veins(
        redeclare package Medium = CurrentlyChosenMedium)
      annotation (Placement(transformation(extent={{78,62},{98,82}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressure_veins(redeclare
        package Medium =
                 CurrentlyChosenMedium)
      annotation (Placement(transformation(extent={{-90,-72},{-70,-52}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressure_pulmonary_arteries(
        redeclare package Medium = CurrentlyChosenMedium)
      annotation (Placement(transformation(extent={{-76,64},{-96,84}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance(
        k=1.250102626409427e-07*(5/4)) annotation (Placement(transformation(
          extent={{4,-4},{-4,4}},
          rotation=90,
          origin={74,38})));
    Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={80,10})));
    Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=-90,
          origin={-96,-22})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance1(
       k=1.250102626409427e-07*(5/4)) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={-102,-54})));
    Physiolibrary.Fluid.Components.ElasticVessel systemic_capillaries(
      redeclare package Medium = CurrentlyChosenMedium,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0003,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0002,
      nPorts=1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-110})));
    Physiolibrary.Fluid.Components.Resistor systemic_resitance1(redeclare
        package Medium =
                 CurrentlyChosenMedium, Resistance=7999343.2449*(20*1/8))
      annotation (Placement(transformation(extent={{-28,-84},{-8,-64}})));
    Physiolibrary.Fluid.Components.Resistor systemic_resitance2(redeclare
        package Medium =
                 CurrentlyChosenMedium, Resistance=7999343.2449*(20*7/8))
      annotation (Placement(transformation(extent={{10,-84},{30,-64}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressure_systemic_capillaries(
        redeclare package Medium = CurrentlyChosenMedium)
      annotation (Placement(transformation(extent={{6,-68},{26,-48}})));
    Physiolibrary.Fluid.Sources.PressureSource inspiredAir(redeclare package
        Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-98,206},{-78,226}})));
    Physiolibrary.Fluid.Components.VolumePump deadspace(redeclare package
        Medium =
          Physiolibrary.Media.Air, SolutionFlow=DV*RR)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=0,
          origin={2,236})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource totalRespiration(SolutionFlow=
         TV*RR, redeclare package Medium = Physiolibrary.Media.Air)
                annotation (Placement(transformation(extent={{82,208},{102,228}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure totalVentilation(redeclare package
        Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{52,208},{72,228}})));
    Chemical.Sources.SubstanceOutflow O2_left(SubstanceFlow(displayUnit=
            "mmol/min") = 0.00025666666666667) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-50,-130})));
    Chemical.Sources.SubstanceInflowT CO2_left(
      SubstanceFlow(displayUnit="mmol/min") = 0.00020566666666667,
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas()) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={52,-130})));
    AlveolarUnit alveolarUnit[NumberOfAlveolarUnits](redeclare package
        CurrentlyChosenMedium = CurrentlyChosenMedium) annotation (Placement(
          transformation(rotation=0, extent={{-14,174},{6,194}})));
  equation
    connect(left_heart.q_in, pulmonary_veins.q_in[1]) annotation (Line(
        points={{62,4},{62,65.7333},{59.9,65.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(right_heart.q_in, veins.q_in[1]) annotation (Line(
        points={{-62,-16},{-62,-68},{-60.1,-68},{-60.1,-72.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(right_heart.q_out, pulmonary_arteries.q_in[1]) annotation (Line(
        points={{-62,4},{-60.1,4},{-60.1,67.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(pressure_arteries.q_in, arteries.q_in[1]) annotation (Line(
        points={{86,-68},{86,-76},{76,-76},{76,-60},{60,-60},{60,-70},{61.9,-70},
            {61.9,-72.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasure.q_in, left_heart.q_out) annotation (Line(
        points={{62,-28},{62,-16}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasure.q_out, arteries.q_in[2]) annotation (Line(
        points={{62,-48},{62,-60},{60,-60},{60,-70},{61.9,-70},{61.9,-74}},
        color={127,0,0},
        thickness=0.5));
    connect(pressure_pulmonary_veins.q_in, pulmonary_veins.q_in[2]) annotation (
        Line(
        points={{84,66},{84,50},{62,50},{62,64},{59.9,64}},
        color={127,0,0},
        thickness=0.5));
    connect(pressure_veins.q_in, veins.q_in[2]) annotation (Line(
        points={{-84,-68},{-74,-68},{-74,-74},{-60.1,-74},{-60.1,-74}},
        color={127,0,0},
        thickness=0.5));
    connect(pressure_pulmonary_arteries.q_in, pulmonary_arteries.q_in[2])
      annotation (Line(
        points={{-82,68},{-82,52},{-60.1,52},{-60.1,66}},
        color={127,0,0},
        thickness=0.5));
    connect(product1.u2, hydraulicConductance.y)
      annotation (Line(points={{74,22},{74,33}}, color={0,0,127}));
    connect(product1.y, left_heart.solutionFlow) annotation (Line(points={{80,-1},
            {78,-1},{78,-6},{69,-6}}, color={0,0,127}));
    connect(product1.u1, pressure_pulmonary_veins.pressure) annotation (Line(
          points={{86,22},{86,46},{96,46},{96,68},{94,68}}, color={0,0,127}));
    connect(product2.y, right_heart.solutionFlow)
      annotation (Line(points={{-96,-11},{-96,-6},{-69,-6}}, color={0,0,127}));
    connect(product2.u2, hydraulicConductance1.y)
      annotation (Line(points={{-102,-34},{-102,-49}}, color={0,0,127}));
    connect(pressure_veins.pressure, product2.u1) annotation (Line(points={{-74,-66},
            {-76,-66},{-76,-44},{-90,-44},{-90,-34}}, color={0,0,127}));
    connect(systemic_resitance2.q_out, arteries.q_in[3]) annotation (Line(
        points={{30,-74},{48,-74},{48,-60},{60,-60},{60,-70},{61.9,-70},{61.9,
            -75.7333}},
        color={127,0,0},
        thickness=0.5));

    connect(systemic_resitance1.q_in, veins.q_in[3]) annotation (Line(
        points={{-28,-74},{-46,-74},{-46,-60},{-62,-60},{-62,-68},{-60.1,-68},{
            -60.1,-75.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolarUnit.q_out1,         pulmonary_veins.q_in[3]) annotation (
        Line(
        points={{0,174},{0,48},{62,48},{62,62.2667},{59.9,62.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolarUnit.q_in,          pulmonary_arteries.q_in[3]) annotation (
        Line(
        points={{-8,174},{-8,50},{-60.1,50},{-60.1,64.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(systemic_resitance2.q_in, systemic_resitance1.q_out) annotation (Line(
        points={{10,-74},{-8,-74}},
        color={127,0,0},
        thickness=0.5));
    connect(systemic_capillaries.q_in[1], systemic_resitance1.q_out) annotation (
        Line(
        points={{0,-110.1},{0,-74},{-8,-74}},
        color={127,0,0},
        thickness=0.5));
    connect(pressure_systemic_capillaries.q_in, systemic_resitance1.q_out)
      annotation (Line(
        points={{12,-64},{0,-64},{0,-74},{-8,-74}},
        color={127,0,0},
        thickness=0.5));
    connect(totalVentilation.q_out,totalRespiration. q_in) annotation (Line(
        points={{72,218},{82,218}},
        color={127,0,0},
        thickness=0.5));
    connect(totalVentilation.q_in,deadspace. q_out) annotation (Line(
        points={{52,218},{52,236},{12,236}},
        color={127,0,0},
        thickness=0.5));
    connect(O2_left.port_a, systemic_capillaries.substances[2]) annotation (
        Line(points={{-40,-130},{-8.88178e-16,-130},{-8.88178e-16,-120}}, color=
           {158,66,200}));
    connect(CO2_left.port_b, systemic_capillaries.substances[3]) annotation (
        Line(points={{42,-130},{-8.88178e-16,-130},{-8.88178e-16,-120}}, color=
            {158,66,200}));
    connect(deadspace.q_in, inspiredAir.y) annotation (Line(
        points={{-8,236},{-66,236},{-66,216},{-78,216}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolarUnit[1].q_out, totalVentilation.q_in) annotation (Line(
        points={{2,194},{2,218},{44,218},{44,236},{52,236},{52,218}},
        color={127,0,0},
        thickness=0.5));
    annotation (Diagram(coordinateSystem(extent={{-240,-200},{220,340}}),
          graphics={
          Rectangle(
            extent={{-120,260},{118,100}},
            lineColor={35,233,243},
            lineThickness=1),
          Rectangle(
            extent={{-120,96},{118,-112}},
            lineColor={255,170,0},
            lineThickness=1),
          Text(
            extent={{-118,262},{-38,248}},
            textColor={0,0,0},
            textString="Respiratory system"),
          Text(
            extent={{-116,96},{-60,82}},
            textColor={0,0,0},
            textString="Cardio system"),
          Rectangle(
            extent={{-120,-116},{118,-136}},
            lineColor={255,51,157},
            lineThickness=1),
          Text(
            extent={{-118,-118},{-62,-128}},
            textColor={0,0,0},
            textString="Cellular exchange")}),                             Icon(
          coordinateSystem(extent={{-240,-200},{220,340}})));
  end ComplexGasExchangeSystem;

  model SimpleRespirationSystem
    replaceable package Currently_Chosen_Environment = Physiolibrary.Media.Air;

    parameter Physiolibrary.Types.Frequency RR=0.286
                                  "Respiration rate";
    parameter Physiolibrary.Types.Volume TV=0.0005
                                            "Tidal volume";
    parameter Physiolibrary.Types.Volume DV=0.00015
                                            "Deadspace volume";
    parameter Physiolibrary.Types.HydraulicConductance C(displayUnit=
          "l/(cmH2O.s)")=1.019716212977928e-05*(1/1.5)   "Total lung conductance";
    parameter Integer N=1
                        "Number of alveolus";

    Physiolibrary.Fluid.Sources.PressureSource environment(redeclare package
        Medium = Currently_Chosen_Environment)
      annotation (Placement(transformation(extent={{-92,28},{-72,48}})));
    Physiolibrary.Fluid.Components.VolumePump Deadspace_volume_flow(redeclare
        package Medium = Currently_Chosen_Environment,              SolutionFlow=
          DV*RR) annotation (Placement(transformation(extent={{-2,72},{18,92}})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource outflow(SolutionFlow=TV*RR,
        redeclare package Medium = Currently_Chosen_Environment)
      annotation (Placement(transformation(extent={{68,30},{88,50}})));
    Physiolibrary.Fluid.Components.ElasticVessel alveolus(
      redeclare package Medium = Currently_Chosen_Environment,
      useSubstances=true,
      use_mass_start=false,
      volume_start(displayUnit="l") = 0.0016,
      mass_start=2.3,
      Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
      ZeroPressureVolume(displayUnit="l") = 0.0013,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=4) annotation (Placement(transformation(extent={{-10,10},{10,-10}},
          rotation=90,
          origin={12,8})));
    Physiolibrary.Fluid.Sensors.PressureMeasure alveolus_pressure(redeclare
        package Medium = Currently_Chosen_Environment)
      annotation (Placement(transformation(extent={{62,-2},{82,18}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure post_alveolus_volume_flow(redeclare
        package Medium = Currently_Chosen_Environment)
      annotation (Placement(transformation(extent={{32,8},{52,28}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure pre_alveolus_volume_flow(redeclare
        package Medium = Currently_Chosen_Environment)
      annotation (Placement(transformation(extent={{-26,8},{-6,28}})));
    Physiolibrary.Fluid.Components.Conductor conductor(redeclare package Medium
        = Currently_Chosen_Environment,                Conductance=C/N)
      annotation (Placement(transformation(extent={{-54,8},{-34,28}})));
    Chemical.Components.GasSolubility O2(KC=1e-5)
      annotation (Placement(transformation(extent={{-16,-34},{4,-14}})));
    Chemical.Components.GasSolubility CO2(KC=1e-5)
      annotation (Placement(transformation(extent={{14,-34},{34,-14}})));
    Chemical.Sources.SubstanceInflowT CO2_in(
      SubstanceFlow(displayUnit="mmol/min") = 1.666666666666667e-05*(2*6.17),
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas())
      annotation (Placement(transformation(extent={{72,-54},{52,-34}})));
    Chemical.Sources.SubstanceOutflow O2_left(SubstanceFlow(displayUnit=
            "mmol/min") = 1.666666666666667e-05*(2*7.7))
      annotation (Placement(transformation(extent={{-28,-54},{-48,-34}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Currently_Chosen_Environment)
      annotation (Placement(transformation(extent={{72,-6},{52,-26}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Currently_Chosen_Environment)
      annotation (Placement(transformation(extent={{-48,-6},{-28,-26}})));
  equation
    connect(Deadspace_volume_flow.q_out, outflow.q_in) annotation (Line(
        points={{18,82},{56,82},{56,40},{68,40}},
        color={127,0,0},
        thickness=0.5));

    connect(post_alveolus_volume_flow.q_out, outflow.q_in) annotation (Line(
        points={{52,18},{56,18},{56,40},{68,40}},
        color={127,0,0},
        thickness=0.5));
    connect(environment.y, Deadspace_volume_flow.q_in) annotation (Line(
        points={{-72,38},{-60,38},{-60,82},{-2,82}},
        color={127,0,0},
        thickness=0.5));

    connect(O2.gas_port, alveolus.substances[1]) annotation (Line(points={{-6,-14},
            {-6,-8},{24,-8},{24,2},{12,2},{12,-2}},
                                 color={158,66,200}));
    connect(CO2.gas_port, alveolus.substances[2]) annotation (Line(points={{24,-14},
            {24,2},{12,2},{12,-2}},
                                 color={158,66,200}));
    connect(O2.liquid_port, O2_left.port_a) annotation (Line(points={{-6,-34},{-6,
            -44},{-28,-44}}, color={158,66,200}));
    connect(CO2.liquid_port, CO2_in.port_b)
      annotation (Line(points={{24,-34},{24,-44},{52,-44}}, color={158,66,200}));
    connect(alveolus_pressure.q_in, alveolus.q_in[1]) annotation (Line(
        points={{68,2},{64,2},{64,8},{13.95,8},{13.95,7.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2.port_a, CO2_in.port_b) annotation (Line(points={{52,-16},{48,
            -16},{48,-44},{52,-44}}, color={158,66,200}));
    connect(pO2.port_a, O2_left.port_a) annotation (Line(points={{-28,-16},{-22,
            -16},{-22,-44},{-28,-44}}, color={158,66,200}));
    connect(conductor.q_in, environment.y) annotation (Line(
        points={{-54,18},{-60,18},{-60,38},{-72,38}},
        color={127,0,0},
        thickness=0.5));
    connect(conductor.q_out, pre_alveolus_volume_flow.q_in) annotation (Line(
        points={{-34,18},{-26,18}},
        color={127,0,0},
        thickness=0.5));
    connect(pre_alveolus_volume_flow.q_out, post_alveolus_volume_flow.q_in)
      annotation (Line(
        points={{-6,18},{32,18}},
        color={127,0,0},
        thickness=0.5));
    connect(pre_alveolus_volume_flow.q_out, alveolus.q_in[2]) annotation (Line(
        points={{-6,18},{12.65,18},{12.65,7.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2.referenceFluidPort, alveolus.q_in[3]) annotation (Line(
        points={{62,-6.2},{46,-6.2},{46,8},{13.7333,8},{13.7333,7.9},{11.35,7.9}},
        color={127,0,0},
        thickness=0.5));

    connect(pO2.referenceFluidPort, alveolus.q_in[4]) annotation (Line(
        points={{-38,-6.2},{-38,4},{10.05,4},{10.05,7.9}},
        color={127,0,0},
        thickness=0.5));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end SimpleRespirationSystem;

  model SimpleRespirationSystem2
    replaceable package Currently_Chosen_Environment = Physiolibrary.Media.Air;

    parameter Physiolibrary.Types.Frequency RR=0.286
                                  "Respiration rate";
    parameter Physiolibrary.Types.Volume TV=0.0005
                                            "Tidal volume";
    parameter Physiolibrary.Types.Volume DV=0.00015
                                            "Deadspace volume";
    parameter Physiolibrary.Types.HydraulicConductance C(displayUnit=
          "l/(cmH2O.s)")=1.019716212977928e-05*(1/1.5)   "Total lung conductance";
    parameter Integer N=1
                        "Number of alveolus";

    Physiolibrary.Fluid.Sources.PressureSource environment(redeclare package
        Medium = Currently_Chosen_Environment)
      annotation (Placement(transformation(extent={{-94,30},{-74,50}})));
    Physiolibrary.Fluid.Components.VolumePump Deadspace_volume_flow(redeclare
        package Medium = Currently_Chosen_Environment,              SolutionFlow=
          DV*RR) annotation (Placement(transformation(extent={{-2,72},{18,92}})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource outflow(SolutionFlow=TV*RR,
        redeclare package Medium = Currently_Chosen_Environment)
      annotation (Placement(transformation(extent={{68,30},{88,50}})));
    Physiolibrary.Fluid.Components.ElasticVessel alveolus(
      redeclare package Medium = Currently_Chosen_Environment,
      useSubstances=true,
      use_mass_start=false,
      volume_start(displayUnit="l") = 0.001676,
      mass_start=2.3,
      Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
      ZeroPressureVolume(displayUnit="l") = 0.0013,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=2) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={14,-2})));
    Physiolibrary.Fluid.Sensors.FlowMeasure post_alveolus_volume_flow(redeclare
        package Medium = Currently_Chosen_Environment)
      annotation (Placement(transformation(extent={{32,8},{52,28}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure pre_alveolus_volume_flow(redeclare
        package Medium = Currently_Chosen_Environment)
      annotation (Placement(transformation(extent={{-24,8},{-4,28}})));
    Physiolibrary.Fluid.Components.Resistor resistor(redeclare package Medium
        = Currently_Chosen_Environment, Resistance(displayUnit="(cmH2O.s)/l")=
           147099.75)
      annotation (Placement(transformation(extent={{-52,8},{-32,28}})));
  equation
    connect(Deadspace_volume_flow.q_out, outflow.q_in) annotation (Line(
        points={{18,82},{56,82},{56,40},{68,40}},
        color={127,0,0},
        thickness=0.5));

    connect(post_alveolus_volume_flow.q_out, outflow.q_in) annotation (Line(
        points={{52,18},{56,18},{56,40},{68,40}},
        color={127,0,0},
        thickness=0.5));
    connect(environment.y, Deadspace_volume_flow.q_in) annotation (Line(
        points={{-74,40},{-60,40},{-60,82},{-2,82}},
        color={127,0,0},
        thickness=0.5));

    connect(alveolus.q_in[1], pre_alveolus_volume_flow.q_out) annotation (Line(
        points={{12.7,-2.1},{12.7,18},{-4,18}},
        color={127,0,0},
        thickness=0.5));
    connect(post_alveolus_volume_flow.q_in, alveolus.q_in[2]) annotation (Line(
        points={{32,18},{15.3,18},{15.3,-2.1}},
        color={127,0,0},
        thickness=0.5));
    connect(resistor.q_in, environment.y) annotation (Line(
        points={{-52,18},{-60,18},{-60,40},{-74,40}},
        color={127,0,0},
        thickness=0.5));
    connect(resistor.q_out, pre_alveolus_volume_flow.q_in) annotation (Line(
        points={{-32,18},{-24,18}},
        color={127,0,0},
        thickness=0.5));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end SimpleRespirationSystem2;

  model AlveolarUnit
    Physiolibrary.Fluid.Components.ElasticVessel pulmonary_capillaries(
      redeclare package Medium = CurrentlyChosenMedium,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.00015,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0001,
      nPorts=3) annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=90,
          origin={2,104})));
    Physiolibrary.Fluid.Components.ElasticVessel alveolar(
      redeclare package Medium = Physiolibrary.Media.Air,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0023,
      Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
      ZeroPressureVolume(displayUnit="l") = 0.0013,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=3) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={2,168})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure(redeclare
        package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-4,190},{16,210}})));
    Chemical.Components.GasSolubility gasSolubilityO2(KC=1e-4)
      annotation (Placement(transformation(extent={{-24,128},{-4,148}})));
    Chemical.Components.GasSolubility gasSolubilityCO2(KC=1e-4)
      annotation (Placement(transformation(extent={{10,128},{30,148}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-90,136},{-70,156}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.Air) annotation (Placement(
          transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={76,142})));
    Physiolibrary.Fluid.Components.Resistor resistor(redeclare package Medium
        = Physiolibrary.Media.Air, Resistance(displayUnit="(cmH2O.s)/l") =
        98066.5*(1/1.5))
      annotation (Placement(transformation(extent={{-70,176},{-50,196}})));
    Physiolibrary.Fluid.Components.Resistor pulmonary_resistance1(redeclare
        package Medium = CurrentlyChosenMedium, Resistance=7999343.2449*(3*7/8))
      annotation (Placement(transformation(extent={{-32,50},{-12,70}})));
    Physiolibrary.Fluid.Components.Resistor pulmonary_resistance2(redeclare
        package Medium = CurrentlyChosenMedium, Resistance=7999343.2449*(3*1/8))
      annotation (Placement(transformation(extent={{10,50},{30,70}})));
    replaceable package CurrentlyChosenMedium =
        Physiolibrary.Media.BloodBySiggaardAndersen constrainedby
      Physiolibrary.Media.Interfaces.PartialMedium                                                             annotation(choicesAllMatching=true);
    Physiolibrary.Fluid.Interfaces.FluidPort_b q_out(redeclare package Medium
        = Physiolibrary.Media.Air) annotation (Placement(transformation(
            rotation=0, extent={{50,230},{70,250}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in(redeclare package Medium =
          CurrentlyChosenMedium) annotation (Placement(transformation(rotation=
              0, extent={{-50,30},{-30,50}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_b q_out1(redeclare package Medium
        = CurrentlyChosenMedium) annotation (Placement(transformation(rotation=
              0, extent={{30,30},{50,50}})));
    Physiolibrary.Fluid.Interfaces.FluidPort_a q_in2(redeclare package Medium
        = Physiolibrary.Media.Air) annotation (Placement(transformation(
            rotation=0, extent={{-90,230},{-70,250}})));
  equation
    connect(pulmonary_resistance1.q_out, pulmonary_resistance2.q_in) annotation (
        Line(
        points={{-12,60},{10,60}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonary_capillaries.q_in[1], pulmonary_resistance2.q_in)
      annotation (Line(
        points={{0.266667,104.1},{0.266667,60},{10,60}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolar.substances[1],gasSolubilityO2. gas_port) annotation (Line(
          points={{2,158},{2,152},{-8,152},{-8,154},{-14,154},{-14,148}},
                      color={158,66,200}));
    connect(gasSolubilityCO2.gas_port,alveolar. substances[2]) annotation (Line(
          points={{20,148},{20,154},{8,154},{8,152},{2,152},{2,158}},
          color={158,66,200}));
    connect(gasSolubilityO2.liquid_port,pO2. port_a) annotation (Line(points={{-14,128},
            {-14,126},{-46,126},{-46,146},{-70,146}},        color={158,66,200}));
    connect(pCO2.port_a,gasSolubilityCO2. liquid_port) annotation (Line(points={{66,142},
            {36,142},{36,122},{34,122},{34,120},{20,120},{20,128}},
          color={158,66,200}));
    connect(pulmonary_capillaries.substances[2],gasSolubilityO2. liquid_port)
      annotation (Line(points={{2,114},{2,122},{-6,122},{-6,120},{-18,120},{-18,128},
            {-14,128}}, color={158,66,200}));
    connect(pulmonary_capillaries.substances[3],gasSolubilityCO2. liquid_port)
      annotation (Line(points={{2,114},{2,122},{12,122},{12,120},{20,120},{20,128}},
          color={158,66,200}));
    connect(q_in, pulmonary_resistance1.q_in) annotation (Line(points={{-40,40},
            {-36,40},{-36,60},{-32,60}}, color={127,0,0}));
    connect(q_out1, pulmonary_resistance2.q_out) annotation (Line(points={{40,
            40},{36,40},{36,60},{30,60}}, color={127,0,0}));
    connect(q_in2, resistor.q_in) annotation (Line(
        points={{-80,240},{-80,186},{-70,186}},
        color={127,0,0},
        thickness=0.5));
    connect(resistor.q_out, alveolar.q_in[1]) annotation (Line(
        points={{-50,186},{-24,186},{-24,167.9},{0.266667,167.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasure.q_in, alveolar.q_in[2]) annotation (Line(
        points={{2,194},{2,180},{2,167.9},{2,167.9}},
        color={127,0,0},
        thickness=0.5));
    connect(q_out, alveolar.q_in[3]) annotation (Line(
        points={{60,240},{60,184},{3.73333,184},{3.73333,167.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pO2.referenceFluidPort, pulmonary_capillaries.q_in[2]) annotation (
        Line(
        points={{-80,136.2},{-80,88},{0,88},{0,100},{2,100},{2,104.1}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2.referenceFluidPort, pulmonary_capillaries.q_in[3]) annotation
      (Line(
        points={{76,132.2},{76,88},{0,88},{0,100},{2,100},{2,104.1}},
        color={127,0,0},
        thickness=0.5));
    annotation (Diagram(coordinateSystem(extent={{-100,40},{100,240}})), Icon(
          coordinateSystem(extent={{-100,40},{100,240}})));
  end AlveolarUnit;
  annotation (uses(
      Physiolibrary(version="3.0.0-alpha7"),
      Modelica(version="4.0.0"),
      Chemical(version="1.4.0-alpha7")));
end ModelicaHackathonPoriz;
