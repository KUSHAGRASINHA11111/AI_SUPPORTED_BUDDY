import 'package:chatgpt_flutter/APP/homepage.dart';
import 'package:chatgpt_flutter/CHATGPT/providers/chat_provider.dart';
import 'package:chatgpt_flutter/CHATGPT/providers/models_provider.dart';
import 'package:chatgpt_flutter/CHATGPT/screens/chat_screen.dart';
// import 'package:chatgpt_flutter/CHATBOT/screens/chat_screen.dart';
import 'package:chatgpt_flutter/LOGIN/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CHATGPT/constants/constants.dart';
// import 'CHATBOT/screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModelsProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'YOUR AI ASSISTANT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: scaffoldBackgroundColor,
            appBarTheme: AppBarTheme(
              color: cardColor,
            )),
        // home: LoginPage(),
        home: HomePage(),
      ),
    );
  }
}

//CODE WITH DRAWER
// import 'package:chatgpt_flutter/providers/chat_provider.dart';
// import 'package:chatgpt_flutter/providers/models_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'constants/constants.dart';
// import 'screens/chat_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int currentIndex = 0;

//   void onTabTapped(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => ModelsProvider()),
//         ChangeNotifierProvider(create: (_) => ChatProvider())
//       ],
//       child: MaterialApp(
//           title: 'YOUR AI ASSISTANT',
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//               scaffoldBackgroundColor: scaffoldBackgroundColor,
//               appBarTheme: AppBarTheme(
//                 color: cardColor,
//               )),
//           home: Scaffold(
//             body: const ChatScreen(),
//             bottomNavigationBar: BottomNavigationBar(
//               currentIndex: currentIndex,
//               onTap: onTabTapped,
//               backgroundColor: Colors.white, // Set the desired background color
//               selectedItemColor:
//                   Colors.orange, // Set the color of selected item text and icon
//               unselectedItemColor:
//                   Colors.black, // Set the color of unselected item text and icon
//               items: const [
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.message),
//                   label: 'ChatGpt',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.image),
//                   label: 'Dall-E-Image',
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }

//CODE WITH VIDEO

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';
// import 'constants/constants.dart';
// import 'providers/chat_provider.dart';
// import 'providers/models_provider.dart';
// import 'screens/chat_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => ModelsProvider()),
//         ChangeNotifierProvider(create: (_) => ChatProvider())
//       ],
//       child: MaterialApp(
//         title: 'YOUR AI ASSISTANT',
//         debugShowCheckedModeBanner: false,
//         home: const VideoBackgroundScreen(),
//       ),
//     );
//   }
// }

// class VideoBackgroundScreen extends StatefulWidget {
//   const VideoBackgroundScreen({Key? key}) : super(key: key);

//   @override
//   _VideoBackgroundScreenState createState() => _VideoBackgroundScreenState();
// }

// class _VideoBackgroundScreenState extends State<VideoBackgroundScreen> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset('assets/chatgpt_video.mp4')
//       ..initialize().then((_) {
//         _controller.play();
//         _controller.setLooping(true);
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           _controller.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//               : Container(),
//           const ChatScreen(), // Keeping ChatScreen as a constant widget
//         ],
//       ),
//       appBar: AppBar(
//         title: Text('YOUR AI ASSISTANT'),
//         backgroundColor: cardColor,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
