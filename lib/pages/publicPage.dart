
import 'package:flutter/material.dart';

class PublicPage extends StatefulWidget {
  const PublicPage({Key? key}) : super(key: key);

  @override
  State<PublicPage> createState() => _PublicPageState();
}

class _PublicPageState extends State<PublicPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('公众号页'),
    );
  }
}
