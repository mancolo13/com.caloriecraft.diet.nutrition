import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab1Screen extends StatelessWidget {
  const Tab1Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final meals = [
      {'name': 'Breakfast', 'cal': '540 kcal', 'items': 'Oatmeal, Berries, Whey Protein', 'icon': Icons.breakfast_dining},
      {'name': 'Lunch', 'cal': '720 kcal', 'items': 'Grilled Chicken Breast, Quinoa, Greens', 'icon': Icons.lunch_dining},
      {'name': 'Dinner', 'cal': '580 kcal', 'items': 'Salmon Fillet, Asparagus, Sweet Potato', 'icon': Icons.dinner_dining},
      {'name': 'Snacks', 'cal': '210 kcal', 'items': 'Greek Yogurt, Almonds', 'icon': Icons.bakery_dining},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('CalorieCraft • Food Diary'), actions: [IconButton(icon: const Icon(Icons.add_circle, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(gradient: LinearGradient(colors: [AppTheme.card, AppTheme.surface]), borderRadius: BorderRadius.circular(20), border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(alignment: Alignment.center, children: const [
                  SizedBox(width: 90, height: 90, child: CircularProgressIndicator(value: 0.74, strokeWidth: 9, backgroundColor: Colors.white10, color: AppTheme.primary)),
                  Column(mainAxisSize: MainAxisSize.min, children: [Text('2,050', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text('kcal', style: TextStyle(fontSize: 11, color: AppTheme.textSecondary))]),
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Text('Daily Goal: 2,400 kcal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  SizedBox(height: 4),
                  Text('Remaining: 350 kcal', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text('Burned: 480 kcal (Active)', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text("Today's Meals", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          for (final m in meals) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
              child: Row(children: [
                CircleAvatar(backgroundColor: AppTheme.primary.withValues(alpha: 0.15), child: Icon(m['icon'] as IconData, color: AppTheme.primary)),
                const SizedBox(width: 14),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(m['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(m['items'] as String, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                ])),
                Text(m['cal'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.primary)),
              ]),
            ),
          ],
        ],
      ),
    );
  }
}
