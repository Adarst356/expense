import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SpendingChartCard extends StatefulWidget {
  const SpendingChartCard({super.key});

  @override
  State<SpendingChartCard> createState() => _SpendingChartCardState();
}

class _SpendingChartCardState extends State<SpendingChartCard> {
  String _selectedPeriod = 'DAY';
  int _touchedIndex = 1;

  final Map<String, List<double>> _data = {
    'DAY': [15, 42.50, 20, 35, 28, 18, 22],
    'WEEK': [120, 85, 200, 150, 90, 175, 130],
    'MONTH': [800, 1200, 950, 1100, 750, 1050, 900],
  };

  final List<String> _dayLabels = ['12am', '4am', '8am', '12pm', '4pm', '8pm', '11pm'];

  @override
  Widget build(BuildContext context) {
    final data = _data[_selectedPeriod]!;
    final maxY = data.reduce((a, b) => a > b ? a : b) * 1.4;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Spending Chart',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(3),
                child: Row(
                  children: ['DAY', 'WEEK', 'MONTH'].map((period) {
                    final isSelected = _selectedPeriod == period;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedPeriod = period;
                          _touchedIndex = 1;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF2563EB)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          period,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF94A3B8),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          SizedBox(
            height: 160,
            child: BarChart(
              BarChartData(
                maxY: maxY,
                minY: 0,
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => const Color(0xFF1A1A2E),
                    tooltipPadding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 6),
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '\$${rod.toY.toStringAsFixed(2)}',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      );
                    },
                  ),
                  touchCallback: (event, response) {
                    if (response != null &&
                        response.spot != null &&
                        event is! FlPointerExitEvent) {
                      setState(() {
                        _touchedIndex =
                            response.spot!.touchedBarGroupIndex;
                      });
                    }
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index == 2) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              _dayLabels[index],
                              style: const TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 10,
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                      reservedSize: 24,
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: maxY / 4,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: const Color(0xFFF1F5F9),
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: List.generate(data.length, (index) {
                  final isTouched = index == _touchedIndex;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: data[index],
                        color: isTouched
                            ? const Color(0xFF2563EB)
                            : const Color(0xFFDBEAFE),
                        width: 28,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(6),
                        ),
                      ),
                    ],
                    showingTooltipIndicators: isTouched ? [0] : [],
                  );
                }),
                groupsSpace: 8,
                alignment: BarChartAlignment.spaceAround,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

