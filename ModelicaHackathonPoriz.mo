within ;
package ModelicaHackathonPoriz
  model ComplexGasExchangeSystem
    replaceable package CurrentlyChosenMedium =
        Physiolibrary.Media.BloodBySiggaardAndersen constrainedby
      Physiolibrary.Media.Interfaces.PartialMedium                                                             annotation(choicesAllMatching=true);

    replaceable package Currently_Chosen_Environment = Physiolibrary.Media.Air;

    parameter Physiolibrary.Types.Volume RR=15
                                            "Tidal volume";

    parameter Physiolibrary.Types.Volume TV=0.0005
                                            "Tidal volume";
    parameter Physiolibrary.Types.Volume DV=0.00015
                                            "Deadspace volume";
    parameter Physiolibrary.Types.HydraulicConductance C_totalVentilation(displayUnit="l/(cmH2O.s)")=1.019716212977928e-05*(1/1.5)
                                                         "Total lung conductance";

    parameter Physiolibrary.Types.HydraulicConductance C_totalPerfusion(displayUnit="l/(mmHg.min)")=1.250102626409427e-07*(1/3*(1 - 0.02))
                                                         "Total conductance of pulmonary ventilated blood vessels";

     parameter Physiolibrary.Types.HydraulicConductance C_shunt(displayUnit="l/(mmHg.min)")=1.250102626409427e-07*(1/3*(0.02))
                                                     "Hydraulic conductance of pulmonary circulation shunt";

    parameter Integer NumberOfAlveolarUnits=2 "Number of alveolus";
    Physiolibrary.Fluid.Components.VolumePump left_heart(
      redeclare package Medium = CurrentlyChosenMedium,  useSolutionFlowInput=true,
        SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{10,10},{-10,-10}},
          rotation=90,
          origin={18,-36})));
    Physiolibrary.Fluid.Components.VolumePump right_heart(
      redeclare package Medium = CurrentlyChosenMedium,   useSolutionFlowInput=true,
        SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-106,-36})));
    Physiolibrary.Fluid.Components.ElasticVessel arteries(
      redeclare package Medium = CurrentlyChosenMedium,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.00085,
      Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
      ZeroPressureVolume(displayUnit="l") = 0.00045,
      nPorts=5) annotation (Placement(transformation(extent={{28,-114},{8,-94}})));
    Physiolibrary.Fluid.Components.ElasticVessel veins(
      redeclare package Medium = CurrentlyChosenMedium,
      volume_start(displayUnit="l") = 0.00325,
      Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
      ZeroPressureVolume(displayUnit="l") = 0.00295,
      nPorts=3)
      annotation (Placement(transformation(extent={{-114,-114},{-94,-94}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonary_arteries(
      redeclare package Medium = CurrentlyChosenMedium,
      volume_start(displayUnit="l") = 0.00038,
      Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0003,
      nPorts=4) annotation (Placement(transformation(extent={{-114,26},{-94,46}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonary_veins(
      redeclare package Medium = CurrentlyChosenMedium,
      volume_start(displayUnit="l") = 0.0004,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0004,
      nPorts=4) annotation (Placement(transformation(extent={{6,24},{26,44}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressure_arteries(redeclare
        package Medium = CurrentlyChosenMedium)
      annotation (Placement(transformation(extent={{36,-134},{56,-114}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure(redeclare package
        Medium =
          CurrentlyChosenMedium)                        annotation (Placement(
          transformation(
          extent={{10,-10},{-10,10}},
          rotation=90,
          origin={18,-68})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressure_pulmonary_veins(
        redeclare package Medium = CurrentlyChosenMedium)
      annotation (Placement(transformation(extent={{34,32},{54,52}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressure_veins(redeclare
        package Medium =
                 CurrentlyChosenMedium)
      annotation (Placement(transformation(extent={{-134,-102},{-114,-82}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressure_pulmonary_arteries(
        redeclare package Medium = CurrentlyChosenMedium)
      annotation (Placement(transformation(extent={{-120,34},{-140,54}})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance(
        k=1.250102626409427e-07*(5/4)) annotation (Placement(transformation(
          extent={{4,-4},{-4,4}},
          rotation=90,
          origin={30,8})));
    Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={36,-20})));
    Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=-90,
          origin={-140,-52})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance1(
       k=1.250102626409427e-07*(5/4)) annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={-146,-84})));
    Physiolibrary.Fluid.Components.ElasticVessel systemic_capillaries(
      redeclare package Medium = CurrentlyChosenMedium,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0003,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0002,
      nPorts=2) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-44,-140})));
    Physiolibrary.Fluid.Components.Resistor systemic_resitance1(redeclare
        package Medium =
                 CurrentlyChosenMedium, Resistance=7999343.2449*(20*1/8))
      annotation (Placement(transformation(extent={{-72,-114},{-52,-94}})));
    Physiolibrary.Fluid.Components.Resistor systemic_resitance2(redeclare
        package Medium =
                 CurrentlyChosenMedium, Resistance=7999343.2449*(20*7/8))
      annotation (Placement(transformation(extent={{-34,-114},{-14,-94}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressure_systemic_capillaries(
        redeclare package Medium = CurrentlyChosenMedium)
      annotation (Placement(transformation(extent={{-38,-98},{-18,-78}})));
    Physiolibrary.Fluid.Sources.PressureSource inspiredAir(redeclare package
        Medium = Physiolibrary.Media.Air, P(displayUnit="bar"))
      annotation (Placement(transformation(extent={{-138,226},{-118,246}})));
    Physiolibrary.Fluid.Components.VolumePump deadspace(redeclare package
        Medium =
          Physiolibrary.Media.Air,
      useSolutionFlowInput=true,   SolutionFlow=DV*RR)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-46,256})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource totalRespiration(
      useSolutionFlowInput=true,                                     SolutionFlow=
         TV*RR, redeclare package Medium = Physiolibrary.Media.Air)
                annotation (Placement(transformation(extent={{52,228},{72,248}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure totalRespiration_flow(redeclare
        package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{12,228},{32,248}})));
    Chemical.Sources.SubstanceOutflow O2_left(SubstanceFlow(displayUnit=
            "mmol/min") = 0.00025666666666667) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-94,-160})));
    Chemical.Sources.SubstanceInflowT CO2_left(
      SubstanceFlow(displayUnit="mmol/min") = 0.00020566666666667,
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas()) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={8,-160})));
    AlveolarUnit alveolarUnit[NumberOfAlveolarUnits](
      redeclare package CurrentlyChosenMedium = CurrentlyChosenMedium,
      C_ventilation=ones(NumberOfAlveolarUnits)*(C_totalVentilation/
          NumberOfAlveolarUnits),
      C_circulation=ones(NumberOfAlveolarUnits)*(C_totalPerfusion/
          NumberOfAlveolarUnits))                   annotation (Placement(
          transformation(rotation=0, extent={{-54,194},{-34,214}})));
    Physiolibrary.Fluid.Components.Conductor shunt(redeclare package Medium =
          Physiolibrary.Media.BloodBySiggaardAndersen,
                                                   Conductance=C_shunt)
      annotation (Placement(transformation(extent={{-48,126},{-28,146}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2_arterial_pressure(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{56,-90},{36,-110}})));
    Modelica.Blocks.Math.Add add annotation (Placement(transformation(
          extent={{-7,-7},{7,7}},
          rotation=90,
          origin={103,189})));
    Physiolibrary.Types.Constants.PressureConst pressure(k(displayUnit="kPa") = -4800)
      annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={106,164})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance2(
       k(displayUnit="ml/(kPa.min)") = 2.5e-07) annotation (Placement(
          transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={94,126})));
    Modelica.Blocks.Math.Product product3 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={110,214})));
    Modelica.Blocks.Math.Max ventilation annotation (Placement(transformation(
          extent={{-7,-7},{7,7}},
          rotation=90,
          origin={95,243})));
    Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(
          transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={90,226})));
    Modelica.Blocks.Math.Add add1(k2=+1) annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=90,
          origin={182,240})));
    Physiolibrary.Types.Constants.VolumeConst deadspace_c(k(displayUnit="l") = 0.00035)
      annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={200,204})));
    Modelica.Blocks.Math.Division respirationRate annotation (Placement(
          transformation(
          extent={{-6,-6},{6,6}},
          rotation=90,
          origin={180,284})));
    Modelica.Blocks.Math.Product RR_multiply annotation (Placement(transformation(
          extent={{-7,-7},{7,7}},
          rotation=180,
          origin={169,305})));
    Physiolibrary.Types.Constants.VolumeConst base_deadspace_volume(k=DV)
      annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={200,306})));
    Physiolibrary.Types.Constants.VolumeConst volume(k(displayUnit="l") = 0.0023)
      annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={198,240})));
    Modelica.Blocks.Math.Min tidalVolume annotation (Placement(transformation(
          extent={{-5,-5},{5,5}},
          rotation=90,
          origin={185,263})));
    Physiolibrary.Fluid.Sensors.PartialPressure pO2_arterial_pressure(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.Oxygen_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{88,-98},{68,-118}})));
    Modelica.Blocks.Math.Division slope annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=90,
          origin={132,174})));
    Modelica.Blocks.Math.Min minpO2Delta annotation (Placement(transformation(
          extent={{-5,-5},{5,5}},
          rotation=90,
          origin={135,145})));
    Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=90,
          origin={122,116})));
    Modelica.Blocks.Sources.Constant const2(k=5000 - 4300) annotation (
        Placement(transformation(
          extent={{-5,-5},{5,5}},
          rotation=90,
          origin={139,111})));
    Modelica.Blocks.Math.Product product4 annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=90,
          origin={166,204})));
    Modelica.Blocks.Sources.Constant const3(k=4300) annotation (Placement(
          transformation(
          extent={{-6,-6},{6,6}},
          rotation=90,
          origin={126,86})));
    Modelica.Blocks.Math.Gain W(k=1e-3*60*(90*(101325/760) - 4.3*1000))
      annotation (Placement(transformation(
          extent={{-5,-5},{5,5}},
          rotation=90,
          origin={103,143})));
    Physiolibrary.Types.Constants.FrequencyConst m(k=0.505) annotation (
        Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=180,
          origin={200,172})));
  equation
    connect(left_heart.q_in, pulmonary_veins.q_in[1]) annotation (Line(
        points={{18,-26},{18,35.95},{15.9,35.95}},
        color={127,0,0},
        thickness=0.5));
    connect(right_heart.q_in, veins.q_in[1]) annotation (Line(
        points={{-106,-46},{-106,-98},{-104.1,-98},{-104.1,-102.267}},
        color={127,0,0},
        thickness=0.5));
    connect(right_heart.q_out, pulmonary_arteries.q_in[1]) annotation (Line(
        points={{-106,-26},{-104.1,-26},{-104.1,37.95}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasure.q_in, left_heart.q_out) annotation (Line(
        points={{18,-58},{18,-46}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasure.q_out, arteries.q_in[1]) annotation (Line(
        points={{18,-78},{18,-90},{16,-90},{16,-100},{18.1,-100},{18.1,-101.92}},
        color={127,0,0},
        thickness=0.5));
    connect(pressure_pulmonary_veins.q_in, pulmonary_veins.q_in[2]) annotation (
        Line(
        points={{40,36},{40,20},{18,20},{18,34.65},{15.9,34.65}},
        color={127,0,0},
        thickness=0.5));
    connect(pressure_veins.q_in, veins.q_in[2]) annotation (Line(
        points={{-128,-98},{-118,-98},{-118,-104},{-104.1,-104}},
        color={127,0,0},
        thickness=0.5));
    connect(pressure_pulmonary_arteries.q_in, pulmonary_arteries.q_in[2])
      annotation (Line(
        points={{-126,38},{-126,22},{-104.1,22},{-104.1,36.65}},
        color={127,0,0},
        thickness=0.5));
    connect(product1.u2, hydraulicConductance.y)
      annotation (Line(points={{30,-8},{30,3}},  color={0,0,127}));
    connect(product1.y, left_heart.solutionFlow) annotation (Line(points={{36,-31},
            {34,-31},{34,-36},{25,-36}},
                                      color={0,0,127}));
    connect(product1.u1, pressure_pulmonary_veins.pressure) annotation (Line(
          points={{42,-8},{42,16},{52,16},{52,38},{50,38}}, color={0,0,127}));
    connect(product2.y, right_heart.solutionFlow)
      annotation (Line(points={{-140,-41},{-140,-36},{-113,-36}},
                                                             color={0,0,127}));
    connect(product2.u2, hydraulicConductance1.y)
      annotation (Line(points={{-146,-64},{-146,-79}}, color={0,0,127}));
    connect(pressure_veins.pressure, product2.u1) annotation (Line(points={{-118,
            -96},{-120,-96},{-120,-74},{-134,-74},{-134,-64}},
                                                      color={0,0,127}));
    connect(systemic_resitance2.q_out, arteries.q_in[2]) annotation (Line(
        points={{-14,-104},{4,-104},{4,-90},{16,-90},{16,-100},{18.1,-100},{
            18.1,-102.96}},
        color={127,0,0},
        thickness=0.5));

    connect(systemic_resitance1.q_in, veins.q_in[3]) annotation (Line(
        points={{-72,-104},{-90,-104},{-90,-90},{-106,-90},{-106,-98},{-104.1,
            -98},{-104.1,-105.733}},
        color={127,0,0},
        thickness=0.5));
    connect(systemic_capillaries.q_in[1], systemic_resitance1.q_out) annotation (
        Line(
        points={{-45.3,-140.1},{-45.3,-104},{-52,-104}},
        color={127,0,0},
        thickness=0.5));
    connect(pressure_systemic_capillaries.q_in, systemic_resitance1.q_out)
      annotation (Line(
        points={{-32,-94},{-46,-94},{-46,-104},{-52,-104}},
        color={127,0,0},
        thickness=0.5));
    connect(totalRespiration_flow.q_out, totalRespiration.q_in) annotation (Line(
        points={{32,238},{52,238}},
        color={127,0,0},
        thickness=0.5));
    connect(totalRespiration_flow.q_in, deadspace.q_out) annotation (Line(
        points={{12,238},{12,256},{-36,256}},
        color={127,0,0},
        thickness=0.5));
    connect(O2_left.port_a, systemic_capillaries.substances[2]) annotation (
        Line(points={{-84,-160},{-44,-160},{-44,-150}},                   color=
           {158,66,200}));
    connect(CO2_left.port_b, systemic_capillaries.substances[3]) annotation (
        Line(points={{-2,-160},{-44,-160},{-44,-150}},                   color=
            {158,66,200}));
    connect(deadspace.q_in, inspiredAir.y) annotation (Line(
        points={{-56,256},{-106,256},{-106,236},{-118,236}},
        color={127,0,0},
        thickness=0.5));
    connect(systemic_resitance2.q_in, systemic_capillaries.q_in[2]) annotation (
       Line(
        points={{-34,-104},{-42.7,-104},{-42.7,-140.1}},
        color={127,0,0},
        thickness=0.5));
    connect(shunt.q_in, pulmonary_arteries.q_in[3]) annotation (Line(
        points={{-48,136},{-62,136},{-62,22},{-104.1,22},{-104.1,35.35}},
        color={127,0,0},
        thickness=0.5));
    connect(shunt.q_out, pulmonary_veins.q_in[3]) annotation (Line(
        points={{-28,136},{-24,136},{-24,32},{6,32},{6,33.35},{15.9,33.35}},
        color={127,0,0},
        thickness=0.5));

    for i in 1:NumberOfAlveolarUnits loop
    connect(alveolarUnit[i].q_in2, inspiredAir.y) annotation (Line(
        points={{-52,214},{-52,236},{-118,236}},
        color={127,0,0},
        thickness=0.5));
      connect(alveolarUnit[i].q_out, totalRespiration_flow.q_in) annotation (Line(
          points={{-38,214},{-38,238},{12,238}},
          color={127,0,0},
          thickness=0.5));
    connect(alveolarUnit[i].q_in, pulmonary_arteries.q_in[4]) annotation (Line(
        points={{-48,194},{-48,176},{-70,176},{-70,156},{-104,156},{-104,82},{
              -104.1,82},{-104.1,34.05}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolarUnit[i].q_out1, pulmonary_veins.q_in[4]) annotation (Line(
        points={{-40,194},{-40,174},{-14,174},{-14,152},{16,152},{16,32},{15.9,
              32},{15.9,32.05}},
        color={127,0,0},
        thickness=0.5));
    end for;


    connect(pressure_arteries.q_in, arteries.q_in[3]) annotation (Line(
        points={{42,-130},{4,-130},{4,-90},{16,-90},{16,-100},{18.1,-100},{18.1,
            -104}},
        color={127,0,0},
        thickness=0.5));

    connect(pCO2_arterial_pressure.port_a, arteries.substances[3]) annotation (
        Line(points={{36,-100},{32,-100},{32,-104},{28,-104}},
                                                           color={158,66,200}));
    connect(pCO2_arterial_pressure.referenceFluidPort, arteries.q_in[4])
      annotation (Line(
        points={{46,-90.2},{46,-86},{18,-86},{18,-90},{16,-90},{16,-100},{18.1,
            -100},{18.1,-105.04}},
        color={127,0,0},
        thickness=0.5));
    connect(pressure.y, add.u2) annotation (Line(points={{106,169},{116,169},{
            116,180.6},{107.2,180.6}},
                           color={0,0,127}));
    connect(add.y, product3.u1) annotation (Line(points={{103,196.7},{90,196.7},
            {90,202},{104,202}},
                            color={0,0,127}));
    connect(add.u1, pCO2_arterial_pressure.partialPressure) annotation (Line(
          points={{98.8,180.6},{86,180.6},{86,-58},{88,-58},{88,-100},{56,-100}},
          color={0,0,127}));
    connect(ventilation.y, totalRespiration.solutionFlow) annotation (Line(
          points={{95,250.7},{94,250.7},{94,254},{62,254},{62,245}}, color={0,0,
            127}));
    connect(ventilation.u2, product3.y) annotation (Line(points={{99.2,234.6},{
            110,234.6},{110,225}},
                                 color={0,0,127}));
    connect(const.y, ventilation.u1)
      annotation (Line(points={{90,230.4},{90.8,234.6}}, color={0,0,127}));
    connect(deadspace_c.y, add1.u2) annotation (Line(points={{200,209},{200,216},
            {185.6,216},{185.6,232.8}},color={0,0,127}));
    connect(base_deadspace_volume.y, RR_multiply.u2) annotation (Line(points={{195,306},
            {195,309.2},{177.4,309.2}},      color={0,0,127}));
    connect(respirationRate.y, RR_multiply.u1) annotation (Line(points={{180,
            290.6},{192,290.6},{192,298},{184,298},{184,300.8},{177.4,300.8}},
          color={0,0,127}));
    connect(RR_multiply.y, deadspace.solutionFlow) annotation (Line(points={{161.3,
            305},{-46,305},{-46,263}}, color={0,0,127}));
    connect(tidalVolume.u1, add1.y)
      annotation (Line(points={{182,257},{182,246.6}}, color={0,0,127}));
    connect(tidalVolume.y, respirationRate.u2) annotation (Line(points={{185,
            268.5},{183.6,268.5},{183.6,276.8}}, color={0,0,127}));
    connect(volume.y, tidalVolume.u2) annotation (Line(points={{198,245},{198,
            257},{188,257}}, color={0,0,127}));
    connect(ventilation.y, respirationRate.u1) annotation (Line(points={{95,
            250.7},{95,268},{176.4,268},{176.4,276.8}}, color={0,0,127}));
    connect(pO2_arterial_pressure.referenceFluidPort, arteries.q_in[5])
      annotation (Line(
        points={{78,-98.2},{78,-86},{60,-86},{60,-80},{34,-80},{34,-86},{18,-86},
            {18,-90},{16,-90},{16,-100},{18.1,-100},{18.1,-106.08}},
        color={127,0,0},
        thickness=0.5));
    connect(pO2_arterial_pressure.port_a, arteries.substances[2]) annotation (
        Line(points={{68,-108},{58,-108},{58,-112},{32,-112},{32,-104},{28,-104}},
          color={158,66,200}));
    connect(const2.y, minpO2Delta.u2) annotation (Line(points={{139,116.5},{136,
            116.5},{136,132},{138,132},{138,139}}, color={0,0,127}));
    connect(add2.y, minpO2Delta.u1) annotation (Line(points={{122,122.6},{132,
            122.6},{132,139}}, color={0,0,127}));
    connect(minpO2Delta.y, slope.u2) annotation (Line(points={{135,150.5},{136,
            150.5},{136,166.8},{135.6,166.8}}, color={0,0,127}));
    connect(product4.u1, ventilation.y) annotation (Line(points={{162.4,196.8},
            {162.4,196},{162,196},{162,190},{152,190},{152,264},{98,264},{98,
            256},{95,256},{95,250.7}}, color={0,0,127}));
    connect(const3.y, add2.u2) annotation (Line(points={{126,92.6},{130,92.6},{
            130,96},{126,96},{126,108.8},{125.6,108.8}},    color={0,0,127}));
    connect(pO2_arterial_pressure.partialPressure, add2.u1) annotation (Line(
          points={{88,-108},{106,-108},{106,108.8},{118.4,108.8}}, color={0,0,
            127}));
    connect(product4.y, add1.u1) annotation (Line(points={{166,210.6},{166,
            232.8},{178.4,232.8}}, color={0,0,127}));
    connect(slope.y, product3.u2) annotation (Line(points={{132,180.6},{132,192},
            {116,192},{116,202}}, color={0,0,127}));
    connect(hydraulicConductance2.y, W.u)
      annotation (Line(points={{94,131},{94,137},{103,137}}, color={0,0,127}));
    connect(W.y, slope.u1) annotation (Line(points={{103,148.5},{103,156},{
            128.4,156},{128.4,166.8}}, color={0,0,127}));
    connect(m.y, product4.u2) annotation (Line(points={{195,172},{178,172},{178,
            178},{169.6,178},{169.6,196.8}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(extent={{-240,-200},{300,360}}),
          graphics={
          Rectangle(
            extent={{-160,320},{300,72}},
            lineColor={35,233,243},
            lineThickness=1),
          Rectangle(
            extent={{-164,66},{182,-140}},
            lineColor={255,170,0},
            lineThickness=1),
          Text(
            extent={{-156,318},{-76,304}},
            textColor={0,0,0},
            textString="Respiratory system"),
          Text(
            extent={{-160,66},{-104,52}},
            textColor={0,0,0},
            textString="Cardio system"),
          Rectangle(
            extent={{-164,-146},{182,-170}},
            lineColor={255,51,157},
            lineThickness=1),
          Text(
            extent={{-162,-148},{-106,-158}},
            textColor={0,0,0},
            textString="Cellular exchange"),
          Rectangle(
            extent={{140,260},{82,96}},
            lineColor={28,108,200},
            lineThickness=0.5),
          Rectangle(
            extent={{240,314},{146,98}},
            lineColor={28,108,200},
            lineThickness=0.5),
          Text(
            extent={{136,166},{164,158}},
            textColor={28,108,200},
            textString="Calculation of slope")}),                          Icon(
          coordinateSystem(extent={{-240,-200},{300,360}})),
      experiment(StopTime=600, __Dymola_Algorithm="Dassl"));
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
    Physiolibrary.Fluid.Components.Conductor conductor(redeclare package Medium =
          Currently_Chosen_Environment,                Conductance=C/N)
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
    Physiolibrary.Fluid.Components.Resistor resistor(redeclare package Medium =
          Currently_Chosen_Environment, Resistance(displayUnit="(cmH2O.s)/l")=
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
      nPorts=4) annotation (Placement(transformation(
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
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
      annotation (Placement(transformation(extent={{-90,136},{-70,156}})));
    Physiolibrary.Fluid.Sensors.PartialPressure pCO2(
      redeclare package stateOfMatter = Chemical.Interfaces.IdealGas,
      substanceData=Chemical.Substances.CarbonDioxide_gas(),
      redeclare package Medium = Physiolibrary.Media.BloodBySiggaardAndersen)
                                                          annotation (Placement(
          transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={76,142})));
    Physiolibrary.Fluid.Components.Resistor pulmonary_resistance1(redeclare
        package Medium = CurrentlyChosenMedium, Resistance=(1/C_circulation)*(7/8))
      annotation (Placement(transformation(extent={{-32,50},{-12,70}})));
    Physiolibrary.Fluid.Components.Resistor pulmonary_resistance2(redeclare
        package Medium = CurrentlyChosenMedium, Resistance=(1/C_circulation)*(1/8))
      annotation (Placement(transformation(extent={{10,50},{30,70}})));
    replaceable package CurrentlyChosenMedium =
        Physiolibrary.Media.BloodBySiggaardAndersen constrainedby
      Physiolibrary.Media.Interfaces.PartialMedium                                                             annotation(choicesAllMatching=true);
      parameter Physiolibrary.Types.HydraulicConductance C_ventilation(displayUnit="l/(cmH2O.s)")=1.019716212977928e-05*(1/1.5);
      parameter Physiolibrary.Types.HydraulicConductance C_circulation=1.250102626409427e-10*(1/3*(1 - 0.02));

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
    Physiolibrary.Fluid.Sensors.FlowMeasure flowMeasure1(redeclare package
        Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{30,158},{50,178}})));
    Physiolibrary.Fluid.Components.Resistor resistor(redeclare package Medium
        = Physiolibrary.Media.Air,                                                                       Resistance=1/C_ventilation)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-80,212})));
    Physiolibrary.Fluid.Components.Resistor resistor1(redeclare package Medium
        = Physiolibrary.Media.Air,                                                                        Resistance=1/C_ventilation)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={60,214})));
  equation
    connect(pulmonary_capillaries.q_in[1], pulmonary_resistance2.q_in)
      annotation (Line(
        points={{0.05,104.1},{0.05,60},{10,60}},
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
      annotation (Line(points={{2,114},{2,122},{-6,122},{-6,120},{-18,120},{-18,
            128},{-14,128}},
                        color={158,66,200}));
    connect(pulmonary_capillaries.substances[3],gasSolubilityCO2. liquid_port)
      annotation (Line(points={{2,114},{2,122},{12,122},{12,120},{20,120},{20,
            128}},
          color={158,66,200}));
    connect(q_in, pulmonary_resistance1.q_in) annotation (Line(points={{-40,40},
            {-36,40},{-36,60},{-32,60}}, color={127,0,0}));
    connect(q_out1, pulmonary_resistance2.q_out) annotation (Line(points={{40,
            40},{36,40},{36,60},{30,60}}, color={127,0,0}));
    connect(pO2.referenceFluidPort, pulmonary_capillaries.q_in[2]) annotation (
        Line(
        points={{-80,136.2},{-80,88},{0,88},{0,100},{1.35,100},{1.35,104.1}},
        color={127,0,0},
        thickness=0.5));
    connect(pCO2.referenceFluidPort, pulmonary_capillaries.q_in[3]) annotation (
       Line(
        points={{76,132.2},{76,88},{0,88},{0,100},{2.65,100},{2.65,104.1}},
        color={127,0,0},
        thickness=0.5));

    connect(pulmonary_resistance1.q_out, pulmonary_capillaries.q_in[4])
      annotation (Line(
        points={{-12,60},{-4,60},{-4,102},{3.95,102},{3.95,104.1}},
        color={127,0,0},
        thickness=0.5));
    connect(q_out, resistor1.q_in) annotation (Line(
        points={{60,240},{60,224}},
        color={127,0,0},
        thickness=0.5));
    connect(resistor1.q_out, flowMeasure1.q_out) annotation (Line(
        points={{60,204},{60,168},{50,168}},
        color={127,0,0},
        thickness=0.5));
    connect(q_in2, resistor.q_in) annotation (Line(
        points={{-80,240},{-80,222}},
        color={127,0,0},
        thickness=0.5));
    connect(resistor.q_out, alveolar.q_in[1]) annotation (Line(
        points={{-80,202},{-80,167.9},{0.266667,167.9}},
        color={127,0,0},
        thickness=0.5));
    connect(flowMeasure1.q_in, alveolar.q_in[2]) annotation (Line(
        points={{30,168},{2,168},{2,167.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasure.q_in, alveolar.q_in[3]) annotation (Line(
        points={{2,194},{2,167.9},{3.73333,167.9}},
        color={127,0,0},
        thickness=0.5));
    annotation (Diagram(coordinateSystem(extent={{-100,40},{100,240}})), Icon(
          coordinateSystem(extent={{-100,40},{100,240}})));
  end AlveolarUnit;
  annotation (uses(
      Modelica(version="4.0.0"),
      Physiolibrary(version="3.0.0-alpha8"),
      Chemical(version="1.4.0")),
    version="1",
    conversion(noneFromVersion=""));
end ModelicaHackathonPoriz;
