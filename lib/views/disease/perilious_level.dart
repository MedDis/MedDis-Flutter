import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PeriliousLevel extends StatelessWidget {
  const PeriliousLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 2,
      child: Container(
        color: Colors.white,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Perilious Level :",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "Severe",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      startAngle: 160,
                      endAngle: 20,
                      minimum: 0,
                      maximum: 150,
                      showLabels: false,
                      showAxisLine: false,
                      showTicks: false,
                      ranges: <GaugeRange>[
                        GaugeRange(
                          startValue: 0,
                          endValue: 48,
                          color: Colors.green,
                          startWidth: 5,
                          endWidth: 5,
                        ),
                        GaugeRange(
                          startValue: 52,
                          endValue: 98,
                          color: Colors.orange,
                          startWidth: 5,
                          endWidth: 5,
                        ),
                        GaugeRange(
                          startValue: 102,
                          endValue: 150,
                          color: Colors.red,
                          startWidth: 5,
                          endWidth: 5,
                        )
                      ],
                      interval: 20,
                      canScaleToFit: true,
                      pointers: const <GaugePointer>[
                        NeedlePointer(
                          value: 125,
                          needleStartWidth: 0.2,
                          needleEndWidth: 1.6,
                          needleLength: 0.6,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
