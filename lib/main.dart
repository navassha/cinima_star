import 'package:cinima_star/view/cinima_star_first.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: CinimaStarMain(),
    ),
  );
}

class CinimaStarMain extends StatelessWidget {
  const CinimaStarMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData.dark(),
      home: CinimaStarGetstarded(),
      debugShowCheckedModeBanner: false,
    );
  }
}
