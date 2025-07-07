import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Expanded(
            child: Card(
              elevation: 0,
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  product.images![0],
                  fit: BoxFit.fitWidth,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.title!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text('₹ ${product.price!.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
