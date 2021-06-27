import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title: Text('Expert'),backgroundColor: Colors.amber,),
    body: Container(width: MediaQuery.of(context).size.width,
    child: WebView(
    initialUrl: Uri.dataFromString('<html><body><iframe width="98%" height="100%" src="https://console.dialogflow.com/api-client/demo/embedded/b243c424-5e3b-4f6b-9689-72eef2b14680"></iframe></body></html>', mimeType: 'text/html').toString(),
    javascriptMode: JavascriptMode.unrestricted,
    ))));
  }
}
