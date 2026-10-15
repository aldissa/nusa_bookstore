import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../providers/cart_provider.dart';
import '../providers/theme_provider.dart';
import 'cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NusaBookstore'),
        actions: [
          // Tombol Light/Dark Mode
          Consumer<ThemeProvider>(
            builder: (context, theme, _) => IconButton(
              icon: Icon(theme.isDarkMode ? Icons.light_mode : Icons.dark_mode),
              tooltip: theme.isDarkMode ? 'Light Mode' : 'Dark Mode',
              onPressed: () => context.read<ThemeProvider>().toggleTheme(),
            ),
          ),
          // Ikon keranjang + badge
          Consumer<CartProvider>(
            builder: (context, cart, _) => Badge(
              isLabelVisible: cart.totalItems > 0,
              label: Text('${cart.totalItems}'),
              offset: const Offset(-4, 4),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                tooltip: 'Keranjang',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: dummyBooks.length,
        itemBuilder: (context, index) => _BookCard(book: dummyBooks[index]),
      ),
    );
  }
}

class _BookCard extends StatelessWidget {
  final Book book;

  const _BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: book.color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(book.icon, size: 36, color: book.color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 2),
                  Text(book.author),
                  const SizedBox(height: 6),
                  Text(
                    formatRupiah(book.price),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            FilledButton.icon(
              onPressed: () {
                context.read<CartProvider>().addItem(book);
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text('${book.title} ditambahkan'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
              },
              icon: const Icon(Icons.add_shopping_cart, size: 18),
              label: const Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}