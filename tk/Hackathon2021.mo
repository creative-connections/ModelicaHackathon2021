within ;
package Hackathon2021
  model BasicCirculation
    Physiolibrary.Fluid.Components.ElasticVessel arteries(
      volume_start(displayUnit="l") = 0.00085,
      Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
      ZeroPressureVolume(displayUnit="l") = 0.00045,
      nPorts=3)
      annotation (Placement(transformation(extent={{24,-44},{44,-24}})));
    Physiolibrary.Fluid.Components.ElasticVessel veins(
      volume_start(displayUnit="l") = 0.00325,
      Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
      ZeroPressureVolume(displayUnit="l") = 0.00275,
      ExternalPressure(displayUnit="bar"),
      nPorts=3)
      annotation (Placement(transformation(extent={{-46,-46},{-26,-26}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonaryArteries(
      volume_start(displayUnit="l") = 0.00038,
      Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0003,
      nPorts=3)
      annotation (Placement(transformation(extent={{-62,44},{-42,64}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonaryVeins(
      volume_start(displayUnit="l") = 0.0004,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0004,
      nPorts=3) annotation (Placement(transformation(extent={{30,36},{50,56}})));
    Physiolibrary.Fluid.Components.VolumePump leftHeart(useSolutionFlowInput=
          false, SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={34,2})));
    Physiolibrary.Fluid.Components.VolumePump rightHeart(SolutionFlow(
          displayUnit="l/min") = 8.3333333333333e-05) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-34,0})));
    Physiolibrary.Fluid.Components.Resistor systemic(Resistance=159986864.898)
      annotation (Placement(transformation(extent={{-14,-46},{6,-26}})));
    Physiolibrary.Fluid.Components.Resistor pulmonary(Resistance=23998029.7347)
      annotation (Placement(transformation(extent={{-18,48},{2,68}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure arteriesP
      annotation (Placement(transformation(extent={{64,-38},{84,-18}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure veinsP
      annotation (Placement(transformation(extent={{-92,-38},{-72,-18}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pulmonaryP
      annotation (Placement(transformation(extent={{-96,46},{-76,66}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pulmonaryVeinsP
      annotation (Placement(transformation(extent={{66,48},{86,68}})));
  equation
    connect(pulmonaryVeins.q_in[1], leftHeart.q_in) annotation (Line(
        points={{39.9,47.7333},{20,47.7333},{20,16},{34,16},{34,12}},
        color={127,0,0},
        thickness=0.5));
    connect(leftHeart.q_out, arteries.q_in[1]) annotation (Line(
        points={{34,-8},{34,-20},{20,-20},{20,-32.2667},{33.9,-32.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(veins.q_in[1], rightHeart.q_in) annotation (Line(
        points={{-36.1,-34.2667},{-36.1,-32},{-34,-32},{-34,-10}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryArteries.q_in[1], rightHeart.q_out) annotation (Line(
        points={{-52.1,55.7333},{-52.1,40},{-34,40},{-34,10}},
        color={127,0,0},
        thickness=0.5));
    connect(systemic.q_out, arteries.q_in[2]) annotation (Line(
        points={{6,-36},{20,-36},{20,-34},{33.9,-34}},
        color={127,0,0},
        thickness=0.5));
    connect(systemic.q_in, veins.q_in[2]) annotation (Line(
        points={{-14,-36},{-22,-36},{-22,-22},{-34,-22},{-34,-32},{-36.1,-32},{
            -36.1,-36}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryArteries.q_in[2], pulmonary.q_in) annotation (Line(
        points={{-52.1,54},{-52.1,40},{-24,40},{-24,58},{-18,58}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonary.q_out, pulmonaryVeins.q_in[2]) annotation (Line(
        points={{2,58},{20,58},{20,46},{39.9,46}},
        color={127,0,0},
        thickness=0.5));
    connect(arteriesP.q_in, arteries.q_in[3]) annotation (Line(
        points={{70,-34},{70,-50},{20,-50},{20,-35.7333},{33.9,-35.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(veinsP.q_in, veins.q_in[3]) annotation (Line(
        points={{-86,-34},{-86,-42},{-52,-42},{-52,-22},{-34,-22},{-34,-32},{
            -36.1,-32},{-36.1,-37.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryP.q_in, pulmonaryArteries.q_in[3]) annotation (Line(
        points={{-90,50},{-90,38},{-52.1,38},{-52.1,52.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryVeinsP.q_in, pulmonaryVeins.q_in[3]) annotation (Line(
        points={{72,52},{72,32},{20,32},{20,44.2667},{39.9,44.2667}},
        color={127,0,0},
        thickness=0.5));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end BasicCirculation;

  model BasicCirculation2
    Physiolibrary.Fluid.Components.ElasticVessel arteries(
      volume_start(displayUnit="l") = 0.00085,
      Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
      ZeroPressureVolume(displayUnit="l") = 0.00045,
      nPorts=3)
      annotation (Placement(transformation(extent={{24,-44},{44,-24}})));
    Physiolibrary.Fluid.Components.ElasticVessel veins(
      volume_start(displayUnit="l") = 0.00325,
      Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
      ZeroPressureVolume(displayUnit="l") = 0.00275,
      ExternalPressure(displayUnit="bar"),
      nPorts=3)
      annotation (Placement(transformation(extent={{-46,-46},{-26,-26}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonaryArteries(
      volume_start(displayUnit="l") = 0.00038,
      Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0003,
      nPorts=3)
      annotation (Placement(transformation(extent={{-62,44},{-42,64}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonaryVeins(
      volume_start(displayUnit="l") = 0.0004,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0004,
      nPorts=3) annotation (Placement(transformation(extent={{30,36},{50,56}})));
    Physiolibrary.Fluid.Components.VolumePump leftHeart(useSolutionFlowInput=
          true, SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={34,2})));
    Physiolibrary.Fluid.Components.VolumePump rightHeart(useSolutionFlowInput=
          true, SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-34,0})));
    Physiolibrary.Fluid.Components.Resistor systemic(Resistance=159986864.898)
      annotation (Placement(transformation(extent={{-14,-46},{6,-26}})));
    Physiolibrary.Fluid.Components.Resistor pulmonary(Resistance=23998029.7347)
      annotation (Placement(transformation(extent={{-18,48},{2,68}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure arteriesP
      annotation (Placement(transformation(extent={{64,-38},{84,-18}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure veinsP
      annotation (Placement(transformation(extent={{-92,-38},{-72,-18}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pulmonaryP
      annotation (Placement(transformation(extent={{-96,46},{-76,66}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pulmonaryVeinsP
      annotation (Placement(transformation(extent={{66,48},{86,68}})));
    Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={68,4})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst
      hydraulicConductance(k=1.5001231516913e-07)
      annotation (Placement(transformation(extent={{100,-12},{108,-4}})));
    Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-70,2})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst
      hydraulicConductance1(k=1.5001231516913e-07)
      annotation (Placement(transformation(extent={{-98,6},{-90,14}})));
  equation
    connect(pulmonaryVeins.q_in[1], leftHeart.q_in) annotation (Line(
        points={{39.9,47.7333},{20,47.7333},{20,16},{34,16},{34,12}},
        color={127,0,0},
        thickness=0.5));
    connect(leftHeart.q_out, arteries.q_in[1]) annotation (Line(
        points={{34,-8},{34,-20},{20,-20},{20,-32.2667},{33.9,-32.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(veins.q_in[1], rightHeart.q_in) annotation (Line(
        points={{-36.1,-34.2667},{-36.1,-32},{-34,-32},{-34,-10}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryArteries.q_in[1], rightHeart.q_out) annotation (Line(
        points={{-52.1,55.7333},{-52.1,40},{-34,40},{-34,10}},
        color={127,0,0},
        thickness=0.5));
    connect(systemic.q_out, arteries.q_in[2]) annotation (Line(
        points={{6,-36},{20,-36},{20,-34},{33.9,-34}},
        color={127,0,0},
        thickness=0.5));
    connect(systemic.q_in, veins.q_in[2]) annotation (Line(
        points={{-14,-36},{-22,-36},{-22,-22},{-34,-22},{-34,-32},{-36.1,-32},{
            -36.1,-36}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryArteries.q_in[2], pulmonary.q_in) annotation (Line(
        points={{-52.1,54},{-52.1,40},{-24,40},{-24,58},{-18,58}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonary.q_out, pulmonaryVeins.q_in[2]) annotation (Line(
        points={{2,58},{20,58},{20,46},{39.9,46}},
        color={127,0,0},
        thickness=0.5));
    connect(arteriesP.q_in, arteries.q_in[3]) annotation (Line(
        points={{70,-34},{70,-50},{20,-50},{20,-35.7333},{33.9,-35.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(veinsP.q_in, veins.q_in[3]) annotation (Line(
        points={{-86,-34},{-86,-42},{-52,-42},{-52,-22},{-34,-22},{-34,-32},{
            -36.1,-32},{-36.1,-37.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryP.q_in, pulmonaryArteries.q_in[3]) annotation (Line(
        points={{-90,50},{-90,38},{-52.1,38},{-52.1,52.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryVeinsP.q_in, pulmonaryVeins.q_in[3]) annotation (Line(
        points={{72,52},{72,32},{20,32},{20,44.2667},{39.9,44.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(product1.y, leftHeart.solutionFlow)
      annotation (Line(points={{57,4},{50,4},{50,2},{41,2}}, color={0,0,127}));
    connect(product1.u2, pulmonaryVeinsP.pressure) annotation (Line(points={{80,
            10},{88,10},{88,54},{82,54}}, color={0,0,127}));
    connect(hydraulicConductance.y, product1.u1) annotation (Line(points={{109,
            -8},{116,-8},{116,-2},{80,-2}}, color={0,0,127}));
    connect(veinsP.pressure, product2.u2) annotation (Line(points={{-76,-32},{
            -68,-32},{-68,-12},{-80,-12},{-80,-4},{-82,-4}}, color={0,0,127}));
    connect(hydraulicConductance1.y, product2.u1) annotation (Line(points={{-89,
            10},{-80,10},{-80,8},{-82,8}}, color={0,0,127}));
    connect(rightHeart.solutionFlow, product2.y) annotation (Line(points={{-41,
            3.33067e-16},{-41,2},{-59,2}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end BasicCirculation2;

  model BasicCirculation3
    Physiolibrary.Fluid.Components.ElasticVessel arteries(
      volume_start(displayUnit="l") = 0.00085,
      Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
      ZeroPressureVolume(displayUnit="l") = 0.00045,
      nPorts=3)
      annotation (Placement(transformation(extent={{24,-44},{44,-24}})));
    Physiolibrary.Fluid.Components.ElasticVessel veins(
      volume_start(displayUnit="l") = 0.00325,
      Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
      ZeroPressureVolume(displayUnit="l") = 0.00275,
      ExternalPressure(displayUnit="bar"),
      nPorts=3)
      annotation (Placement(transformation(extent={{-66,-46},{-46,-26}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonaryArteries(
      volume_start(displayUnit="l") = 0.00038,
      Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0003,
      nPorts=3)
      annotation (Placement(transformation(extent={{-82,44},{-62,64}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonaryVeins(
      volume_start(displayUnit="l") = 0.0004,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0004,
      nPorts=3) annotation (Placement(transformation(extent={{30,36},{50,56}})));
    Physiolibrary.Fluid.Components.VolumePump leftHeart(useSolutionFlowInput=
          true, SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={34,2})));
    Physiolibrary.Fluid.Components.VolumePump rightHeart(useSolutionFlowInput=
          true, SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-54,0})));
    Physiolibrary.Fluid.Components.Resistor systemic2(Resistance=7999343.2449*(
          20/8))
      annotation (Placement(transformation(extent={{-34,-46},{-14,-26}})));
    Physiolibrary.Fluid.Components.Resistor pulmonary1(Resistance=7999343.2449*
          (3*7/8))
      annotation (Placement(transformation(extent={{-38,48},{-18,68}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure arteriesP
      annotation (Placement(transformation(extent={{64,-38},{84,-18}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure veinsP
      annotation (Placement(transformation(extent={{-112,-38},{-92,-18}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pulmonaryP
      annotation (Placement(transformation(extent={{-116,46},{-96,66}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pulmonaryVeinsP
      annotation (Placement(transformation(extent={{66,48},{86,68}})));
    Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={68,4})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst
      hydraulicConductance(k=1.5001231516913e-07)
      annotation (Placement(transformation(extent={{100,-12},{108,-4}})));
    Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-90,2})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst
      hydraulicConductance1(k=1.5001231516913e-07)
      annotation (Placement(transformation(extent={{-118,6},{-110,14}})));
    Physiolibrary.Fluid.Components.Resistor systemic1(Resistance=7999343.2449*(
          20*7/8))
      annotation (Placement(transformation(extent={{-6,-46},{14,-26}})));
    Physiolibrary.Fluid.Components.Resistor pulmonary2(Resistance=7999343.2449*
          (3/8))
      annotation (Placement(transformation(extent={{-8,48},{12,68}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonaryCapilaries(
      volume_start(displayUnit="l") = 0.00015,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0001,
      nPorts=1)
      annotation (Placement(transformation(extent={{-22,78},{-2,98}})));
    Physiolibrary.Fluid.Components.ElasticVessel systemicCapilary(
      volume_start(displayUnit="l") = 0.0003,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0002,
      nPorts=1)
      annotation (Placement(transformation(extent={{-20,-86},{0,-66}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pulmonaryCapilaryP
      annotation (Placement(transformation(extent={{-16,28},{4,48}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure systemicCapilaryP
      annotation (Placement(transformation(extent={{-18,-26},{2,-6}})));
  equation
    connect(pulmonaryVeins.q_in[1], leftHeart.q_in) annotation (Line(
        points={{39.9,47.7333},{20,47.7333},{20,16},{34,16},{34,12}},
        color={127,0,0},
        thickness=0.5));
    connect(leftHeart.q_out, arteries.q_in[1]) annotation (Line(
        points={{34,-8},{34,-20},{20,-20},{20,-32.2667},{33.9,-32.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(veins.q_in[1], rightHeart.q_in) annotation (Line(
        points={{-56.1,-34.2667},{-56.1,-32},{-54,-32},{-54,-10}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryArteries.q_in[1], rightHeart.q_out) annotation (Line(
        points={{-72.1,55.7333},{-72.1,40},{-54,40},{-54,10}},
        color={127,0,0},
        thickness=0.5));
    connect(systemic2.q_in, veins.q_in[2]) annotation (Line(
        points={{-34,-36},{-42,-36},{-42,-22},{-54,-22},{-54,-32},{-56.1,-32},{
            -56.1,-36}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryArteries.q_in[2], pulmonary1.q_in) annotation (Line(
        points={{-72.1,54},{-72.1,40},{-44,40},{-44,58},{-38,58}},
        color={127,0,0},
        thickness=0.5));
    connect(arteriesP.q_in, arteries.q_in[2]) annotation (Line(
        points={{70,-34},{70,-50},{20,-50},{20,-34},{33.9,-34}},
        color={127,0,0},
        thickness=0.5));
    connect(veinsP.q_in, veins.q_in[3]) annotation (Line(
        points={{-106,-34},{-106,-42},{-72,-42},{-72,-22},{-54,-22},{-54,-32},{
            -56.1,-32},{-56.1,-37.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryP.q_in, pulmonaryArteries.q_in[3]) annotation (Line(
        points={{-110,50},{-110,38},{-72.1,38},{-72.1,52.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryVeinsP.q_in, pulmonaryVeins.q_in[2]) annotation (Line(
        points={{72,52},{72,32},{20,32},{20,46},{39.9,46}},
        color={127,0,0},
        thickness=0.5));
    connect(product1.y, leftHeart.solutionFlow)
      annotation (Line(points={{57,4},{50,4},{50,2},{41,2}}, color={0,0,127}));
    connect(product1.u2, pulmonaryVeinsP.pressure) annotation (Line(points={{80,
            10},{88,10},{88,54},{82,54}}, color={0,0,127}));
    connect(hydraulicConductance.y, product1.u1) annotation (Line(points={{109,
            -8},{116,-8},{116,-2},{80,-2}}, color={0,0,127}));
    connect(veinsP.pressure, product2.u2) annotation (Line(points={{-96,-32},{
            -88,-32},{-88,-12},{-100,-12},{-100,-4},{-102,-4}}, color={0,0,127}));
    connect(hydraulicConductance1.y, product2.u1) annotation (Line(points={{
            -109,10},{-100,10},{-100,8},{-102,8}}, color={0,0,127}));
    connect(rightHeart.solutionFlow, product2.y)
      annotation (Line(points={{-61,0},{-61,2},{-79,2}}, color={0,0,127}));
    connect(systemic1.q_out, arteries.q_in[3]) annotation (Line(
        points={{14,-36},{20,-36},{20,-35.7333},{33.9,-35.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(systemic1.q_in, systemic2.q_out) annotation (Line(
        points={{-6,-36},{-14,-36}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonary2.q_out, pulmonaryVeins.q_in[3]) annotation (Line(
        points={{12,58},{22,58},{22,44.2667},{39.9,44.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonary1.q_out, pulmonary2.q_in) annotation (Line(
        points={{-18,58},{-8,58}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryCapilaries.q_in[1], pulmonary2.q_in) annotation (Line(
        points={{-12.1,88},{-12,88},{-12,58},{-8,58}},
        color={127,0,0},
        thickness=0.5));
    connect(systemicCapilary.q_in[1], systemic2.q_out) annotation (Line(
        points={{-10.1,-76},{-10,-76},{-10,-36},{-14,-36}},
        color={127,0,0},
        thickness=0.5));
    connect(systemicCapilaryP.q_in, systemic2.q_out) annotation (Line(
        points={{-12,-22},{-12,-36},{-14,-36}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryCapilaryP.q_in, pulmonary2.q_in) annotation (Line(
        points={{-10,32},{-12,32},{-12,58},{-8,58}},
        color={127,0,0},
        thickness=0.5));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end BasicCirculation3;

  model BasicCirculation4
    replaceable package Blood = Physiolibrary.Media.Water constrainedby
      Media.Interfaces.PartialMedium annotation (choicesAllMatching=true);
    //package Blood = Physiolibrary.Media.BloodBySiggaardAndersen
    Physiolibrary.Fluid.Components.ElasticVessel arteries(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00085,
      Compliance(displayUnit="ml/mmHg") = 2.6627185942521e-08,
      ZeroPressureVolume(displayUnit="l") = 0.00045,
      nPorts=3) annotation (Placement(transformation(extent={{24,-44},{44,-24}})));
    Physiolibrary.Fluid.Components.ElasticVessel veins(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00325,
      Compliance(displayUnit="ml/mmHg") = 6.1880080007267e-07,
      ZeroPressureVolume(displayUnit="l") = 0.00275,
      ExternalPressure(displayUnit="bar"),
      nPorts=3)
      annotation (Placement(transformation(extent={{-66,-46},{-46,-26}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonaryArteries(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00038,
      Compliance(displayUnit="ml/mmHg") = 3.6002955640592e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0003,
      nPorts=3) annotation (Placement(transformation(extent={{-82,44},{-62,64}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonaryVeins(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.0004,
      Compliance(displayUnit="ml/mmHg") = 7.5006157584566e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0004,
      nPorts=3) annotation (Placement(transformation(extent={{30,36},{50,56}})));
    Physiolibrary.Fluid.Components.VolumePump leftHeart(
      redeclare package Medium = Blood,                 useSolutionFlowInput=true,
        SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={34,2})));
    Physiolibrary.Fluid.Components.VolumePump rightHeart(
      redeclare package Medium = Blood,                  useSolutionFlowInput=true,
        SolutionFlow(displayUnit="l/min") = 8.3333333333333e-05) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-54,0})));
    Physiolibrary.Fluid.Components.Resistor systemic2(redeclare package Medium =
          Blood, Resistance=7999343.2449*(20/8))
              annotation (Placement(transformation(extent={{-34,-46},{-14,-26}})));
    Physiolibrary.Fluid.Components.Resistor pulmonary1(redeclare package Medium =
          Blood, Resistance=7999343.2449*(3*7/8))
                annotation (Placement(transformation(extent={{-38,48},{-18,68}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure arteriesP(redeclare package
        Medium = Blood)
      annotation (Placement(transformation(extent={{64,-38},{84,-18}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure veinsP(redeclare package Medium =
          Blood)
      annotation (Placement(transformation(extent={{-112,-38},{-92,-18}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pulmonaryP(redeclare package
        Medium = Blood)
      annotation (Placement(transformation(extent={{-116,46},{-96,66}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pulmonaryVeinsP(redeclare
        package
        Medium = Blood)
      annotation (Placement(transformation(extent={{66,48},{86,68}})));
    Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={68,4})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance(
        k=1.5001231516913e-07)
      annotation (Placement(transformation(extent={{100,-12},{108,-4}})));
    Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-90,2})));
    Physiolibrary.Types.Constants.HydraulicConductanceConst hydraulicConductance1(
       k=1.5001231516913e-07)
      annotation (Placement(transformation(extent={{-118,6},{-110,14}})));
    Physiolibrary.Fluid.Components.Resistor systemic1(redeclare package Medium =
          Blood, Resistance=7999343.2449*(20*7/8))
                annotation (Placement(transformation(extent={{-6,-46},{14,-26}})));
    Physiolibrary.Fluid.Components.Resistor pulmonary2(redeclare package Medium =
          Blood, Resistance=7999343.2449*(3/8))
              annotation (Placement(transformation(extent={{-8,48},{12,68}})));
    Physiolibrary.Fluid.Components.ElasticVessel pulmonaryCapilaries(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.00015,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0001,
      nPorts=1) annotation (Placement(transformation(extent={{-22,78},{-2,98}})));
    Physiolibrary.Fluid.Components.ElasticVessel systemicCapilary(
      redeclare package Medium = Blood,
      volume_start(displayUnit="l") = 0.0003,
      Compliance(displayUnit="ml/mmHg") = 3.0002463033826e-08,
      ZeroPressureVolume(displayUnit="l") = 0.0002,
      nPorts=1) annotation (Placement(transformation(extent={{-20,-86},{0,-66}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pulmonaryCapilaryP(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-16,28},{4,48}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure systemicCapilaryP(redeclare
        package Medium = Blood)
      annotation (Placement(transformation(extent={{-18,-26},{2,-6}})));
  equation
    connect(pulmonaryVeins.q_in[1], leftHeart.q_in) annotation (Line(
        points={{39.9,47.7333},{20,47.7333},{20,16},{34,16},{34,12}},
        color={127,0,0},
        thickness=0.5));
    connect(leftHeart.q_out, arteries.q_in[1]) annotation (Line(
        points={{34,-8},{34,-20},{20,-20},{20,-32.2667},{33.9,-32.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(veins.q_in[1], rightHeart.q_in) annotation (Line(
        points={{-56.1,-34.2667},{-56.1,-32},{-54,-32},{-54,-10}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryArteries.q_in[1], rightHeart.q_out) annotation (Line(
        points={{-72.1,55.7333},{-72.1,40},{-54,40},{-54,10}},
        color={127,0,0},
        thickness=0.5));
    connect(systemic2.q_in, veins.q_in[2]) annotation (Line(
        points={{-34,-36},{-42,-36},{-42,-22},{-54,-22},{-54,-32},{-56.1,-32},{-56.1,
            -36}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryArteries.q_in[2], pulmonary1.q_in) annotation (Line(
        points={{-72.1,54},{-72.1,40},{-44,40},{-44,58},{-38,58}},
        color={127,0,0},
        thickness=0.5));
    connect(arteriesP.q_in, arteries.q_in[2]) annotation (Line(
        points={{70,-34},{70,-50},{20,-50},{20,-34},{33.9,-34}},
        color={127,0,0},
        thickness=0.5));
    connect(veinsP.q_in, veins.q_in[3]) annotation (Line(
        points={{-106,-34},{-106,-42},{-72,-42},{-72,-22},{-54,-22},{-54,-32},{
            -56.1,-32},{-56.1,-37.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryP.q_in, pulmonaryArteries.q_in[3]) annotation (Line(
        points={{-110,50},{-110,38},{-72.1,38},{-72.1,52.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryVeinsP.q_in, pulmonaryVeins.q_in[2]) annotation (Line(
        points={{72,52},{72,32},{20,32},{20,46},{39.9,46}},
        color={127,0,0},
        thickness=0.5));
    connect(product1.y, leftHeart.solutionFlow)
      annotation (Line(points={{57,4},{50,4},{50,2},{41,2}}, color={0,0,127}));
    connect(product1.u2, pulmonaryVeinsP.pressure) annotation (Line(points={{80,10},
            {88,10},{88,54},{82,54}}, color={0,0,127}));
    connect(hydraulicConductance.y, product1.u1) annotation (Line(points={{109,-8},
            {116,-8},{116,-2},{80,-2}}, color={0,0,127}));
    connect(veinsP.pressure, product2.u2) annotation (Line(points={{-96,-32},{-88,
            -32},{-88,-12},{-100,-12},{-100,-4},{-102,-4}}, color={0,0,127}));
    connect(hydraulicConductance1.y, product2.u1) annotation (Line(points={{-109,10},
            {-100,10},{-100,8},{-102,8}}, color={0,0,127}));
    connect(rightHeart.solutionFlow, product2.y)
      annotation (Line(points={{-61,0},{-61,2},{-79,2}}, color={0,0,127}));
    connect(systemic1.q_out, arteries.q_in[3]) annotation (Line(
        points={{14,-36},{20,-36},{20,-35.7333},{33.9,-35.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(systemic1.q_in, systemic2.q_out) annotation (Line(
        points={{-6,-36},{-14,-36}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonary2.q_out, pulmonaryVeins.q_in[3]) annotation (Line(
        points={{12,58},{22,58},{22,44.2667},{39.9,44.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonary1.q_out, pulmonary2.q_in) annotation (Line(
        points={{-18,58},{-8,58}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryCapilaries.q_in[1], pulmonary2.q_in) annotation (Line(
        points={{-12.1,88},{-12,88},{-12,58},{-8,58}},
        color={127,0,0},
        thickness=0.5));
    connect(systemicCapilary.q_in[1], systemic2.q_out) annotation (Line(
        points={{-10.1,-76},{-10,-76},{-10,-36},{-14,-36}},
        color={127,0,0},
        thickness=0.5));
    connect(systemicCapilaryP.q_in, systemic2.q_out) annotation (Line(
        points={{-12,-22},{-12,-36},{-14,-36}},
        color={127,0,0},
        thickness=0.5));
    connect(pulmonaryCapilaryP.q_in, pulmonary2.q_in) annotation (Line(
        points={{-10,32},{-12,32},{-12,58},{-8,58}},
        color={127,0,0},
        thickness=0.5));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end BasicCirculation4;

  model BasicRespiration
    parameter Physiolibrary.Types.Frequency RR=0.28333333333333
                                                    "Respiration rate";
    parameter Physiolibrary.Types.Volume DV=0.00015 "Dead space";
    parameter Physiolibrary.Types.Volume TV=0.0005
                                                "Tidal volume"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
    Physiolibrary.Fluid.Sources.PressureSource inspiredAir
      annotation (Placement(transformation(extent={{-98,56},{-78,76}})));
    Physiolibrary.Fluid.Components.VolumePump deadspace(SolutionFlow=DV*RR)
      annotation (Placement(transformation(extent={{8,76},{28,96}})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource totalRespiration(
        SolutionFlow=TV*RR)
      annotation (Placement(transformation(extent={{80,58},{100,78}})));
    Physiolibrary.Fluid.Components.ElasticVessel alveolar(
      volume_start(displayUnit="l") = 0.0016,
      Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
      ZeroPressureVolume(displayUnit="l") = 0.0013,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=3)
      annotation (Placement(transformation(extent={{-10,14},{10,34}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure alveolarVentilationPost
      annotation (Placement(transformation(extent={{22,14},{42,34}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure
      annotation (Placement(transformation(extent={{0,-16},{20,4}})));
    Physiolibrary.Fluid.Components.Resistor resistor(Resistance(displayUnit=
            "(cmH2O.s)/l") = 147099.75)
      annotation (Placement(transformation(extent={{-66,54},{-46,74}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure alveolarVentilationPre
      annotation (Placement(transformation(extent={{-50,26},{-30,46}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure totalVentilation
      annotation (Placement(transformation(extent={{50,58},{70,78}})));
  equation
    connect(alveolarVentilationPost.q_in, alveolar.q_in[1]) annotation (Line(
        points={{22,24},{14,24},{14,38},{-20,38},{-20,25.7333},{-0.1,25.7333}},

        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasure.q_in, alveolar.q_in[2]) annotation (Line(
        points={{6,-12},{6,-20},{-16,-20},{-16,24},{-0.1,24}},
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
    connect(alveolarVentilationPre.q_out, alveolar.q_in[3]) annotation (Line(
        points={{-30,36},{-20,36},{-20,22.2667},{-0.1,22.2667}},
        color={127,0,0},
        thickness=0.5));
    connect(alveolarVentilationPre.q_in, resistor.q_out) annotation (Line(
        points={{-50,36},{-54,36},{-54,50},{-44,50},{-44,54},{-38,54},{-38,64},
            {-46,64}},
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
  end BasicRespiration;

  model BasicRespiration2
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
      annotation (Placement(transformation(extent={{8,76},{28,96}})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource totalRespiration(SolutionFlow=
         TV*RR, redeclare package Medium = Physiolibrary.Media.Air)
                annotation (Placement(transformation(extent={{80,58},{100,78}})));
    Physiolibrary.Fluid.Components.ElasticVessel alveolar(
      redeclare package Medium = Physiolibrary.Media.Air,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0016,
      Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
      ZeroPressureVolume(displayUnit="l") = 0.0013,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=3) annotation (Placement(transformation(extent={{-10,8},{10,28}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure alveolarVentilationPost(redeclare
        package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{22,14},{42,34}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure(redeclare
        package Medium =
                 Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-6,40},{14,60}})));
    Physiolibrary.Fluid.Components.Resistor resistor(redeclare package Medium
        = Physiolibrary.Media.Air,                   Resistance(displayUnit="(cmH2O.s)/l")=
           147099.75)
      annotation (Placement(transformation(extent={{-66,54},{-46,74}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure alveolarVentilationPre(redeclare
        package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-50,26},{-30,46}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure totalVentilation(redeclare package
        Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{50,58},{70,78}})));
    Physiolibrary.Fluid.Components.ElasticVessel elasticVessel
      annotation (Placement(transformation(extent={{-12,-54},{8,-34}})));
  equation
    connect(alveolarVentilationPost.q_in, alveolar.q_in[1]) annotation (Line(
        points={{22,24},{14,24},{14,38},{-20,38},{-20,19.7333},{-0.1,19.7333}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasure.q_in, alveolar.q_in[2]) annotation (Line(
        points={{0,44},{0,38},{-20,38},{-20,18},{-0.1,18}},
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
    connect(alveolarVentilationPre.q_out, alveolar.q_in[3]) annotation (Line(
        points={{-30,36},{-20,36},{-20,16.2667},{-0.1,16.2667}},
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
  end BasicRespiration2;

  model BasicRespiration3
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
      annotation (Placement(transformation(extent={{8,76},{28,96}})));
    Physiolibrary.Fluid.Sources.VolumeOutflowSource totalRespiration(SolutionFlow=
         TV*RR, redeclare package Medium = Physiolibrary.Media.Air)
                annotation (Placement(transformation(extent={{80,58},{100,78}})));
    Physiolibrary.Fluid.Components.ElasticVessel alveolar(
      redeclare package Medium = Physiolibrary.Media.Air,
      volume_start(displayUnit="l") = 0.0016,
      Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
      ZeroPressureVolume(displayUnit="l") = 0.0013,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=2) annotation (Placement(transformation(extent={{-10,14},{10,34}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure alveolarVentilationPost(redeclare
        package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{22,14},{42,34}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure(redeclare
        package Medium =
                 Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{0,-16},{20,4}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure totalVentilation(redeclare package
        Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{50,58},{70,78}})));
    Physiolibrary.Fluid.Components.Conductor conductor(Conductance=
          1.250102626409427e-07*(1/1.5/3))
      annotation (Placement(transformation(extent={{-54,14},{-34,34}})));
  equation
    connect(alveolarVentilationPost.q_in, alveolar.q_in[1]) annotation (Line(
        points={{22,24},{14,24},{14,38},{-20,38},{-20,25.3},{-0.1,25.3}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasure.q_in, alveolar.q_in[2]) annotation (Line(
        points={{6,-12},{6,-20},{-16,-20},{-16,22.7},{-0.1,22.7}},
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
  end BasicRespiration3;

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
    Physiolibrary.Fluid.Components.ElasticVessel alveolar(
      redeclare package Medium = Physiolibrary.Media.Air,
      useSubstances=true,
      volume_start(displayUnit="l") = 0.0016,
      Compliance(displayUnit="ml/mmHg") = 6.0004926067653e-07,
      ZeroPressureVolume(displayUnit="l") = 0.0013,
      ExternalPressure(displayUnit="mmHg") = 100791.72488574,
      nPorts=3) annotation (Placement(transformation(extent={{-10,-10},{10,10}},

          rotation=90,
          origin={0,18})));
    Physiolibrary.Fluid.Sensors.FlowMeasure alveolarVentilationPost(redeclare
        package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{22,14},{42,34}})));
    Physiolibrary.Fluid.Sensors.PressureMeasure pressureMeasure(redeclare
        package Medium =
                 Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-6,40},{14,60}})));
    Physiolibrary.Fluid.Components.Resistor resistor(redeclare package Medium
        = Physiolibrary.Media.Air,                   Resistance(displayUnit="(cmH2O.s)/l")=
           147099.75)
      annotation (Placement(transformation(extent={{-66,54},{-46,74}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure alveolarVentilationPre(redeclare
        package Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{-50,26},{-30,46}})));
    Physiolibrary.Fluid.Sensors.FlowMeasure totalVentilation(redeclare package
        Medium = Physiolibrary.Media.Air)
      annotation (Placement(transformation(extent={{50,58},{70,78}})));
    Physiolibrary.Fluid.Components.ElasticVessel elasticVessel(redeclare
        package Medium = Physiolibrary.Media.BloodBySiggaardAndersen,
        useSubstances=true) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-2,-44})));
    Chemical.Components.GasSolubility gasSolubilityO2
      annotation (Placement(transformation(extent={{-26,-22},{-6,-2}})));
    Chemical.Components.GasSolubility gasSolubilityCO2
      annotation (Placement(transformation(extent={{8,-22},{28,-2}})));
  equation
    connect(alveolarVentilationPost.q_in, alveolar.q_in[1]) annotation (Line(
        points={{22,24},{14,24},{14,38},{-20,38},{-20,17.9},{-1.73333,17.9}},
        color={127,0,0},
        thickness=0.5));
    connect(pressureMeasure.q_in, alveolar.q_in[2]) annotation (Line(
        points={{0,44},{0,38},{-20,38},{-20,17.9},{-1.66533e-16,17.9}},
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
    connect(alveolarVentilationPre.q_out, alveolar.q_in[3]) annotation (Line(
        points={{-30,36},{-20,36},{-20,17.9},{1.73333,17.9}},
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
    connect(alveolar.substances[1], gasSolubilityO2.gas_port) annotation (Line(
          points={{-8.88178e-16,8},{-8.88178e-16,2},{-10,2},{-10,4},{-16,4},{
            -16,-2}}, color={158,66,200}));
    connect(gasSolubilityO2.liquid_port, elasticVessel.substances[2])
      annotation (Line(points={{-16,-22},{-16,-26},{0,-26},{0,-30},{-2,-30},{-2,
            -34}}, color={158,66,200}));
    connect(gasSolubilityCO2.gas_port, alveolar.substances[2]) annotation (Line(
          points={{18,-2},{18,4},{6,4},{6,2},{-8.88178e-16,2},{-8.88178e-16,8}},
          color={158,66,200}));
    connect(gasSolubilityCO2.liquid_port, elasticVessel.substances[3])
      annotation (Line(points={{18,-22},{18,-28},{0,-28},{0,-30},{-2,-30},{-2,
            -34}}, color={158,66,200}));
  end BasicRespiration4;
  annotation (uses(Physiolibrary(version="3.0.0-alpha7"), Modelica(version=
            "4.0.0"),
      Chemical(version="1.4.0-alpha7")));
end Hackathon2021;
