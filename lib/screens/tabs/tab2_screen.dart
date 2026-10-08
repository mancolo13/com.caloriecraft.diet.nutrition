import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final macros = [
      {'name': 'Protein', 'val': '142g / 160g', 'pct': 0.88, 'color': Colors.redAccent},
      {'name': 'Carbohydrates', 'val': '210g / 260g', 'pct': 0.80, 'color': Colors.amberAccent},
      {'name': 'Dietary Fats', 'val': '58g / 70g', 'pct': 0.82, 'color': Colors.blueAccent},
      {'name': 'Fiber', 'val': '32g / 35g', 'pct': 0.91, 'color': Colors.greenAccent},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Macronutrient Breakdown'), actions: [IconButton(icon: const Icon(Icons.bar_chart, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final m in macros) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 14), padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(m['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(m['val'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ]),
                const SizedBox(height: 10),
                LinearProgressIndicator(value: m['pct'] as double, color: m['color'] as Color, backgroundColor: Colors.white10, minHeight: 10, borderRadius: BorderRadius.circular(5)),
              ]),
            ),
          ],
        ],
      ),
    );
  }
}
