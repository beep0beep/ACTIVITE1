import 'dart:math';
import '../models/emission.dart';
import '../models/diffusion.dart';

class EmissionController {
  // ── Private emissions list ───────────────────────────────
  final List<Emission> _emissions = [
    const Emission(
      id: '1',
      nom: 'Only News',
      chaineRadio: '4th Radio',
      imagePath: 'assets/images/news.jpeg',
    ),
    const Emission(
      id: '2',
      nom: 'Trending Mode',
      chaineRadio: '3rd Radio',
      imagePath: 'assets/images/mode.jpeg',
    ),
    const Emission(
      id: '3',
      nom: 'Criminal Cases',
      chaineRadio: '2nd Radio',
      imagePath: 'assets/images/crimescene.jpeg',
    ),
    const Emission(
      id: '4',
      nom: 'Live Matches',
      chaineRadio: '1st Radio',
      imagePath: 'assets/images/foot.jpeg',
    ),
  ];

  // ── Get all emissions ────────────────────────────────────
  List<Emission> getEmissions() {
    return List.unmodifiable(_emissions);
  }

  // ── Load emissions (mock) ────────────────────────────────
  void loadEmissions() {
    // Could fetch from API or database in the future
  }

  // ── On emission selected ─────────────────────────────────
  Emission onEmissionSelected(Emission emission) {
    return emission;
  }

  // ── Generate random diffusions for an emission ───────────
  List<Diffusion> getDiffusions(Emission emission) {
    final random = Random();
    final months = [
      'Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Jun',
      'Jul', 'Aoû', 'Sep', 'Oct', 'Nov', 'Déc'
    ];

    return List.generate(6, (index) {
      final day = random.nextInt(28) + 1;
      final month = months[random.nextInt(12)];
      final year = 2024 + random.nextInt(2);
      final hour = random.nextInt(12) + 8;
      final duration = random.nextInt(60) + 20;

      return Diffusion(
        titre: '${emission.nom} - Épisode ${index + 1}',
        date: '$day $month $year',
        heure: '${hour}h00',
        duree: '$duration min',
      );
    });
  }
}