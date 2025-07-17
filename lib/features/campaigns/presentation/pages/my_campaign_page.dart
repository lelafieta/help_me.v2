import 'package:flutter/material.dart';

class MyCampaignPage extends StatelessWidget {
  const MyCampaignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Campanhas'),
      ),
      body: const Center(
        child: Text('Conteúdo da página Minhas Campanhas'),
      ),
    );
  }
}
