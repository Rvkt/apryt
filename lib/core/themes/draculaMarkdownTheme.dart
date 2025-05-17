import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

final draculaMarkdownStyle = MarkdownStyleSheet(
  // General Text
  p: const TextStyle(
    color: Color(0xFFF8F8F2),
    fontSize: 16,
    fontFamily: 'monospace', // Monospace font
  ),

  // Headings (H1 - H6)
  h1: const TextStyle(
    color: Color(0xFFFF79C6),
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 2,
    fontFamily: 'monospace',
  ),
  h2: const TextStyle(
    color: Color(0xFFBD93F9),
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'monospace',
  ),
  h3: const TextStyle(
    color: Color(0xFF50FA7B),
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'monospace',
  ),
  h4: const TextStyle(
    color: Color(0xFFF1FA8C),
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'monospace',
  ),
  h5: const TextStyle(
    color: Color(0xFFFFB86C),
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'monospace',
  ),
  h6: const TextStyle(
    color: Color(0xFF8BE9FD),
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'monospace',
  ),

  // Inline Code
  code: const TextStyle(
    color: Color(0xFFF8F8F2),
    fontSize: 12,
    fontFamily: 'monospace',
    // backgroundColor: Color(0xFF282A36),
  ),

  // Code Block
  codeblockDecoration: BoxDecoration(
    color: Color(0xFF44475A),
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: Color(0xFF6272A4)),
  ),

  // Blockquote
  blockquoteDecoration: BoxDecoration(
    color: Color(0xFF44475A),
    borderRadius: BorderRadius.circular(8),
    border: const Border(left: BorderSide(color: Color(0xFFFF79C6), width: 4)),
  ),

  // Lists
  listBullet: const TextStyle(
    color: Color(0xFFF1FA8C),
    fontSize: 16,
    fontFamily: 'monospace',
  ),

  // Links
  a: const TextStyle(
    color: Color(0xFF8BE9FD),
    fontSize: 16,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold,
    fontFamily: 'monospace',
  ),

  // Table Styling (For markdown tables)
  tableBody: const TextStyle(
    color: Color(0xFFF8F8F2),
    fontFamily: 'monospace',
  ),
  tableHead: const TextStyle(
    color: Color(0xFFFF79C6),
    fontWeight: FontWeight.bold,
    fontFamily: 'monospace',
  ),
  tableCellsPadding: EdgeInsets.all(16),
  tableCellsDecoration: BoxDecoration(
    color: Color(0xFF44475A),
    border: Border.all(color: Color(0xFFBD93F9)),
  ),
);
