import 'package:flutter/material.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final int price;
  final IconData icon;
  final Color color;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    this.icon = Icons.menu_book,
    this.color = Colors.indigo,
  });
}

const List<Book> dummyBooks = [
  Book(
    id: 'b1',
    title: 'Laskar Pelangi',
    author: 'Andrea Hirata',
    price: 85000,
    icon: Icons.auto_stories,
    color: Colors.orange,
  ),
  Book(
    id: 'b2',
    title: 'Bumi Manusia',
    author: 'Pramoedya Ananta Toer',
    price: 110000,
    icon: Icons.menu_book,
    color: Colors.teal,
  ),
  Book(
    id: 'b3',
    title: 'Filosofi Teras',
    author: 'Henry Manampiring',
    price: 98000,
    icon: Icons.psychology,
    color: Colors.indigo,
  ),
  Book(
    id: 'b4',
    title: 'Atomic Habits',
    author: 'James Clear',
    price: 120000,
    icon: Icons.bolt,
    color: Colors.red,
  ),
  Book(
    id: 'b5',
    title: 'Dilan 1990',
    author: 'Pidi Baiq',
    price: 75000,
    icon: Icons.favorite,
    color: Colors.pink,
  ),
];