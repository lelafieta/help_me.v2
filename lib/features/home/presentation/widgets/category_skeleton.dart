import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategorySkeleton extends StatelessWidget {
  const CategorySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(5, (index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 4 ? 0 : 12),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  // Aqui seria o ícone real, mas como é skeleton, usamos um box vazio
                  child: const SizedBox(width: 25, height: 25),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 40,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
