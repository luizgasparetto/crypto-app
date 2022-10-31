import 'package:design_system_module/design_system_module.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';

class CryptoHorizontalCard extends StatelessWidget {
  const CryptoHorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 60,
      child: Row(
        children: [
          Container(
            width: 55,
            decoration: const BoxDecoration(
              color: Color(0xFF1f2124),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.network(
                'https://cryptologos.cc/logos/cardano-ada-logo.svg?v=023',
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Cardano', style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'R\$ 2.12',
                    style: TextStyle(color: CryptoColors.lightGrey),
                  ),
                  const SizedBox(width: 15),
                  const Icon(
                    IconlyBold.arrow_up_2,
                    color: Color(0xFF25a75c),
                    size: 14,
                  ),
                  const Text(
                    '10.85%',
                    style: TextStyle(color: Color(0xFF25a75c), fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SizedBox(
              width: 100,
              child: AspectRatio(
                aspectRatio: 7,
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 11,
                    minY: 0,
                    maxY: 6,
                    gridData: FlGridData(
                      show: false,
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    titlesData: FlTitlesData(
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 3),
                          const FlSpot(2, 6),
                          const FlSpot(4, 4),
                          const FlSpot(5, 5),
                          const FlSpot(6, 2),
                          const FlSpot(8, 8),
                          const FlSpot(10, 12),
                        ],
                        isCurved: true,
                        color: const Color(0xFF25a75c),
                        belowBarData: BarAreaData(show: true, color: const Color(0xFF25a75c).withOpacity(0.1)),
                        dotData: FlDotData(
                          show: false,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '0.1164',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                '\$39.34',
                style: TextStyle(color: CryptoColors.lightGrey, fontSize: 14),
              )
            ],
          )
        ],
      ),
    );
  }
}
