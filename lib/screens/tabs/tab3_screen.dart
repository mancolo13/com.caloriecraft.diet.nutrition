import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab3Screen extends StatelessWidget {
  const Tab3Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final foods = [
      {'name': 'Avocado Hass', 'desc': '100g • 160 kcal • 15g Fat • 9g Carb', 'icon': Icons.eco},
      {'name': 'Wild Caught Salmon', 'desc': '150g • 280 kcal • 34g Protein', 'icon': Icons.set_meal},
      {'name': 'Organic Rolled Oats', 'desc': '80g • 300 kcal • 54g Carb • 10g Protein', 'icon': Icons.grain},
      {'name': 'Greek Yogurt 0%', 'desc': '200g • 120 kcal • 22g Protein', 'icon': Icons.egg_alt},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Nutritional Food Bank'), actions: [IconButton(icon: const Icon(Icons.search, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: AppTheme.primary),
              hintText: 'Search food database...',
              filled: true,
              fillColor: AppTheme.card,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 16),
          for (final f in foods) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(backgroundColor: AppTheme.primary.withValues(alpha: 0.15), child: Icon(f['icon'] as IconData, color: AppTheme.primary)),
                title: Text(f['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                subtitle: Text(f['desc'] as String, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                trailing: const Icon(Icons.add_circle_outline, color: AppTheme.primary),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
