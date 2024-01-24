import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Chatbot extends StatelessWidget {
  const Chatbot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            const url =
                'https://www.kommunicate.io/livechat-demo?appId=afa2473db1f4dd7b95bdbb459113da3e&botIds=aisupportedbuddy-hdmgt&assignee=aisupportedbuddy-hdmgt&languageCode=en'; // Replace with the URL you want to open
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Text('Launch Bot'),
        ),
      ),
    );
  }
}

