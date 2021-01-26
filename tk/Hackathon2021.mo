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
  end BasicCirculation4;
  annotation (uses(Physiolibrary(version="3.0.0-alpha7"), Modelica(version=
            "4.0.0")));
end Hackathon2021;
