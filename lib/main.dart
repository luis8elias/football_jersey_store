import 'package:flutter/material.dart';
import 'package:football_jersey_store/presentation/wrapper/wrapper_page.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WrapperPage(pageIndex: 1),
    )
  );
}
