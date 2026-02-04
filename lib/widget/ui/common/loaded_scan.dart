import 'package:flutter/material.dart';
import 'package:mobile_scan/data/models/product.dart';

class LoadedScan extends StatelessWidget {
  const LoadedScan({super.key, required this.barcode, required this.product});
  final String barcode;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(product.name, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        AspectRatio(
          aspectRatio: 1,
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
        ),
        const SizedBox(height: 12),
        const Text('Наличие по размерам:'),
        Expanded(
          child: ListView.separated(
            itemCount: product.sizes.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final s = product.sizes[i];
              return ListTile(
                title: Text('Размер ${s.size}'),
                subtitle: Text(
                  s.inStock ? 'В наличии: ${s.qty}' : 'Нет в наличии',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
