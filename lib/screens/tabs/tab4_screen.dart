import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab4Screen extends StatelessWidget {
  const Tab4Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Body Weight & Targets'), actions: [IconButton(icon: const Icon(Icons.flag, color: AppTheme.primary), onPressed: () => RoutingService.openPartnerLink())]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(20)),
            child: Column(children: const [
              Text('Current Weight: 74.5 kg', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('Target: 70.0 kg (Deficit Mode • -0.5 kg/week)', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold, fontSize: 13)),
              SizedBox(height: 14),
              LinearProgressIndicator(value: 0.65, color: AppTheme.primary, backgroundColor: Colors.white10, minHeight: 8),
            ]),
          ),
          const SizedBox(height: 16),
          _goalCard('Daily Hydration Target', '2,400 ml / 3,000 ml (80%)', Icons.water_drop, Colors.cyan),
          const SizedBox(height: 12),
          _goalCard('Protein Intake Goal', '142g / 160g (88%)', Icons.fitness_center, Colors.orange),
          const SizedBox(height: 12),
          _goalCard('Dietary Fiber Goal', '32g / 35g (91%)', Icons.spa, Colors.greenAccent),
        ],
      ),
    );
  }
  Widget _goalCard(String t, String v, IconData ic, Color c) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.card, borderRadius: BorderRadius.circular(16)),
      child: Row(children: [
        CircleAvatar(backgroundColor: c.withValues(alpha: 0.15), child: Icon(ic, color: c)),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(t, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(v, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
        ])),
      ]),
    );
  }
}
