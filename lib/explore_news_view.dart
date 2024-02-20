import 'package:flutter/material.dart';
import 'package:news_short/Services/utilities/state_services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExploreNewsView extends StatefulWidget {
  String url,name;

  ExploreNewsView({super.key, required this.url, required this.name});

  @override
  State<ExploreNewsView> createState() => _ExploreNewsViewState();
}

class _ExploreNewsViewState extends State<ExploreNewsView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name,
        style: const TextStyle(
          fontWeight: FontWeight.w800
        ),),
      ),
      body: WebView(
        initialUrl:  Uri.encodeFull(widget.url),
      )
    );
  }
}
