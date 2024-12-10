import 'package:flutter/material.dart';
import 'package:pure_ui_kit/pure_ui_kit.dart';
// ignore: implementation_imports
import 'package:pure_ui_kit/src/components/steps/step.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PureTheme(
      emptyStateTheme: const PureEmptyStateTheme(
        titleStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
        iconColor: Colors.indigo,
        dashedBorderColor: Colors.indigo,
      ),
      child: MaterialApp(
        title: 'Pure UI Kit Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        home: const DemoPage(),
      ),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pure UI Kit Demo'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Simple Empty State',
                style: TextStyle(
                  fontFamily: 'inter',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              PureEmptyState.simple(
                title: 'Aucun projet',
                description: 'Commencez par créer un nouveau projet.',
                buttonText: 'Nouveau Projet',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Création d\'un nouveau projet')),
                  );
                },
              ),
              const SizedBox(height: 48),
              const Text(
                'Empty State with Dashed Border',
                style: TextStyle(
                  fontFamily: 'inter',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              PureEmptyState.withDashedBorder(
                title: 'Créer une nouvelle base de données',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('Création d\'une nouvelle base de données')),
                  );
                },
              ),
              const SizedBox(height: 48),
              const Text(
                'Step Bullet',
                style: TextStyle(
                  fontFamily: 'inter',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              PureStep.bullet(
                currentStep: 2,
                totalSteps: 4,
                onStepTap: (step) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tapped on step $step')),
                  );
                },
              ),
              const SizedBox(height: 48),
              const Text(
                'Step Circle',
                style: TextStyle(
                  fontFamily: 'inter',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              PureStep.circle(
                currentStep: 4,
                totalSteps: 5,
                onStepTap: (step) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tapped on step $step')),
                  );
                },
              ),
              const SizedBox(height: 48),
              const Text(
                'Step Progress Bar',
                style: TextStyle(
                  fontFamily: 'inter',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              PureStep.progressBar(
                currentStep: 3,
                totalSteps: 4,
                progressLabel: 'Migrating MySQL database...',
                onStepTap: (step) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tapped on step $step')),
                  );
                },
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
