import 'dart:developer';
import 'package:chatgpt_flutter/CHATGPT/constants/constants.dart';
// import 'package:chatgpt_flutter/models/chat_model.dart';
import 'package:chatgpt_flutter/CHATGPT/providers/chat_provider.dart';
import 'package:chatgpt_flutter/CHATGPT/providers/models_provider.dart';
// import 'package:chatgpt_flutter/services/api_service.dart';
import 'package:chatgpt_flutter/CHATGPT/services/services.dart';
import 'package:chatgpt_flutter/CHATGPT/widgets/chat_widget.dart';
import 'package:chatgpt_flutter/CHATGPT/widgets/text_widget.dart';
// import 'package:chatgpt_flutter/LOGIN/loginpage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../services/assets_manager.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isTyping = false;
  late TextEditingController textEditingController;
  // List<ChatModel> chatList = [];
  late FocusNode focusNode;
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    textEditingController = TextEditingController();
    _scrollController = ScrollController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    _scrollController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context, listen: false);
    final chatListProvider = Provider.of<ChatProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AssetsManager.aiBuddy)),
          IconButton(
              onPressed: () async {
                await Services.showBottomModalSheet(context: context);
              },
              icon: const Icon(Icons.more_vert_rounded, color: Colors.white)),
        ],
        elevation: 2,
        // leading:
        // Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Image.asset(AssetsManager.aiBuddy)),
        title: const Text('AISupportedBuddy'),
      ),
      // drawer: Drawer(
      //   child: Container(
      //     color: Colors.black,
      //     child: ListView(
      //       padding: EdgeInsets.zero,
      //       children: <Widget>[
      //         Container(
      //           height: 80, // Adjust this height as needed
      //           child: const UserAccountsDrawerHeader(
      //             decoration: BoxDecoration(
      //              color: Colors.white,
      //             ),
      //             accountName: Text(
      //               'AISupportedBuddY',
      //               style: TextStyle(
      //                 color: Color.fromARGB(255, 0, 0, 0),
      //                 fontSize: 20,
      //               ),
      //             ),
      //             accountEmail: null, // You can omit this or add an email
      //           ),
      //         ),


      //            Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      //             child: ListTile(
      //             leading: const Icon(Icons.home_max, color: Colors.white,),
      //             title: const Text ('Google Bard',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 15,
      //             ),
      //             ),
      //             onTap: () {
      //               // Handle drawer item 1 tap
      //             },
      //                         ),
      //           ),

      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      //             child: ListTile(
      //             leading: const Icon(Icons.settings, color: Colors.white,),
      //             title: const Text ('Settings',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 15,
      //             ),
      //             ),
      //             onTap: () {
      //               // Handle drawer item 1 tap
      //             },
      //                         ),
      //           ),

      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      //             child: ListTile(
      //             leading: const Icon(Icons.book, color: Colors.white,),
      //             title: const Text ('AboutUs',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 15,
      //             ),
      //             ),
      //             onTap: () {
      //               // Handle drawer item 2 tap
      //             },
      //                         ),
      //           ),

      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      //             child: ListTile(
      //             leading: const Icon(Icons.help, color: Colors.white,),
      //             title: const Text ('Help',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 15,
      //             ),
      //             ),
      //             onTap: () {
      //               // Handle drawer item 3 tap
      //             },
      //                         ),
      //           ),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      //           child: ListTile(
      //             leading: const Icon(Icons.logout, color: Colors.white,),
      //             title: const Text ('Logout',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 15,
      //             ),
      //             ),
      //             onTap: () {
      //               Navigator.push(context,
      //                MaterialPageRoute(builder: (context) => LoginPage())
      //                );
      //             },
      //           ),
      //         ),
            
      //         // Add more ListTile widgets as needed
      //       ],
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount:
                      chatListProvider.getChatList.length, //chatList.length,
                  itemBuilder: (context, index) {
                    return ChatWidget(
                        msg: chatListProvider
                            .getChatList[index].msg, //chatList[index].msg,
                        chatIndex: chatListProvider.getChatList[index]
                            .chatIndex //chatList[index].chatIndex,
                        );
                  }),
            ),
            if (isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18.0,
              ),
            ],
            const SizedBox(
              height: 15.0,
            ),
            Material(
              color: cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      focusNode: focusNode,
                      style: const TextStyle(color: Colors.white),
                      controller: textEditingController,
                      onSubmitted: (value) async {
                        await sendMessageFCT(modelsProvider, chatListProvider);
                      },
                      decoration: const InputDecoration.collapsed(
                          hintText: 'How can I help you',
                          hintStyle: TextStyle(color: Colors.grey)),
                    )),
                    IconButton(
                      onPressed: () async {
                        await sendMessageFCT(modelsProvider, chatListProvider);
                      },
                      icon: const Icon(Icons.send),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void scrollListToEnd() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2), curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT(
      ModelsProvider modelsProvider, ChatProvider chatListProvider) async {
    if (isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: TextWidget(
            label:
                "You couldn't send multiple messages at a time, please wait."),
        backgroundColor: Colors.red,
      ));
      return;
    }
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: TextWidget(label: "Please type a message."),
        backgroundColor: Colors.red,
      ));
      return;
    }
    try {
      String msg = textEditingController.text;
      print("text: ${textEditingController.text}");
      setState(() {
        isTyping = true;
        chatListProvider.addUserMessage(msg: msg);
        // chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
        textEditingController.clear();
        focusNode.unfocus();
      });
      await chatListProvider.sendMessageAndGetAnswers(
          chosenModelId: modelsProvider.getCurrentModel, msg: msg);
      // chatList.addAll(await ApiService.sendMessageGPT(
      //     message: textEditingController.text,
      //     modelId: modelsProvider.getCurrentModel));
      print("after");
      setState(() {});
    } catch (e) {
      log('$e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(label: e.toString()),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        isTyping = false;
        scrollListToEnd();
      });
    }
  }
}

// import 'dart:developer';
// import 'package:chatgpt_flutter/CHATBOT/constants/constants.dart';
// // import 'package:chatgpt_flutter/models/chat_model.dart';
// import 'package:chatgpt_flutter/CHATBOT/providers/chat_provider.dart';
// import 'package:chatgpt_flutter/CHATBOT/providers/models_provider.dart';
// // import 'package:chatgpt_flutter/services/api_service.dart';
// import 'package:chatgpt_flutter/CHATBOT/services/services.dart';
// import 'package:chatgpt_flutter/CHATBOT/widgets/chat_widget.dart';
// import 'package:chatgpt_flutter/CHATBOT/widgets/text_widget.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';

// import '../services/assets_manager.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   bool isTyping = false;
//   late TextEditingController textEditingController;
//   // List<ChatModel> chatList = [];
//   late FocusNode focusNode;
//   late ScrollController _scrollController;

//   @override
//   void initState() {
//     // TODO: implement initState
//     textEditingController = TextEditingController();
//     _scrollController = ScrollController();
//     focusNode = FocusNode();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     textEditingController.dispose();
//     _scrollController.dispose();
//     focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final modelsProvider = Provider.of<ModelsProvider>(context, listen: false);
//     final chatListProvider = Provider.of<ChatProvider>(context, listen: false);
//     return Scaffold(

//       appBar: AppBar(
//   elevation: 2,
//   leading: Container(
//   padding: const EdgeInsets.fromLTRB(12.0, 8.0, 0.0, 8.0), // Adjust padding as needed
//   child: Row(
//     children: [
//       IconButton(
//         onPressed: () async {
//           // Handle back button press here
//          // Example navigation action
//         },
//         icon: const Icon(Icons.arrow_back, color: Colors.white),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 100),
//         child: Image.asset(
//           AssetsManager.aiBuddy,
//           width: 24.0, // Adjust the width as needed
//           height: 24.0, // Adjust the height as needed
//         ),
//       ),
//     ],
//   ),
// ),

//   actions: [
//     IconButton(
//       onPressed: () async {
//         await Services.showBottomModalSheet(context: context);
//       },
//       icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
//     ),
//   ],
//   title: const Padding(
//     padding: EdgeInsets.only(left: 50.0),
//     child: Text("AIsupportedBuddy"),
//     ),
// ),

//       // appBar: AppBar(
//       //   actions: [
//       //     IconButton(
//       //         onPressed: () async {
//       //           await Services.showBottomModalSheet(context: context);
//       //         },
//       //         icon: const Icon(Icons.more_vert_rounded, color: Colors.white)),
//       //   ],
//       //   elevation: 2,
//       //   leading:
//       //   Padding(
//       //       padding: const EdgeInsets.all(8.0),
//       //       child: Image.asset(AssetsManager.aiBuddy)),
//       //   title: const Text('AISupportedBuddy'),
//       // ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Flexible(
//               child: ListView.builder(
//                   controller: _scrollController,
//                   itemCount:
//                       chatListProvider.getChatList.length, //chatList.length,
//                   itemBuilder: (context, index) {
//                     return ChatWidget(
//                         msg: chatListProvider
//                             .getChatList[index].msg, //chatList[index].msg,
//                         chatIndex: chatListProvider.getChatList[index]
//                             .chatIndex //chatList[index].chatIndex,
//                         );
//                   }),
//             ),
//             if (isTyping) ...[
//               const SpinKitThreeBounce(
//                 color: Colors.white,
//                 size: 18.0,
//               ),
//             ],
//             const SizedBox(
//               height: 15.0,
//             ),
//             Material(
//               color: cardColor,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                         child: TextField(
//                       focusNode: focusNode,
//                       style: const TextStyle(color: Colors.white),
//                       controller: textEditingController,
//                       onSubmitted: (value) async {
//                         await sendMessageFCT(modelsProvider, chatListProvider);
//                       },
//                       decoration: const InputDecoration.collapsed(
//                           hintText: 'How can I help you',
//                           hintStyle: TextStyle(color: Colors.grey)),
//                     )),
//                     IconButton(
//                       onPressed: () async {
//                         await sendMessageFCT(modelsProvider, chatListProvider);
//                       },
//                       icon: const Icon(Icons.send),
//                       color: Colors.white,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void scrollListToEnd() {
//     _scrollController.animateTo(_scrollController.position.maxScrollExtent,
//         duration: const Duration(seconds: 2), curve: Curves.easeOut);
//   }

//   Future<void> sendMessageFCT(
//       ModelsProvider modelsProvider, ChatProvider chatListProvider) async {
//     if (isTyping) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: TextWidget(
//             label:
//                 "You couldn't send multiple messages at a time, please wait."),
//         backgroundColor: Colors.red,
//       ));
//       return;
//     }
//     if (textEditingController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: TextWidget(label: "Please type a message."),
//         backgroundColor: Colors.red,
//       ));
//       return;
//     }
//     try {
//       String msg = textEditingController.text;
//       print("text: ${textEditingController.text}");
//       setState(() {
//         isTyping = true;
//         chatListProvider.addUserMessage(msg: msg);
//         // chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
//         textEditingController.clear();
//         focusNode.unfocus();
//       });
//       await chatListProvider.sendMessageAndGetAnswers(
//           chosenModelId: modelsProvider.getCurrentModel, msg: msg);
//       // chatList.addAll(await ApiService.sendMessageGPT(
//       //     message: textEditingController.text,
//       //     modelId: modelsProvider.getCurrentModel));
//       print("after");
//       setState(() {});
//     } catch (e) {
//       log('$e');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: TextWidget(label: e.toString()),
//         backgroundColor: Colors.red,
//       ));
//     } finally {
//       setState(() {
//         isTyping = false;
//         scrollListToEnd();
//       });
//     }
//   }
// }
