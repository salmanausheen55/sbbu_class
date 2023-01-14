import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key});

  @override
  State<WebviewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebviewScreen> {
  late final WebViewController controller;
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlateformDetails();
    // print('Android Info = ${deviceInfoPlugin.androidInfo}');
    
    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(
      Uri.parse('https://hackmd.io/@kuzmapetrovich/S1x90jWGP#Exercise-4'));
  }

  Future<void> initPlateformDetails() async{
    var deviceData = <String, dynamic>{
      
    };
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Example'),
      ),
      body: WebViewWidget ( controller: controller),
    );
  }
}