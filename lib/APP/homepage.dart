// import 'package:chatgpt_flutter/APP/aboutus.dart';
import 'package:chatgpt_flutter/CHATBOT/home.dart';
import 'package:chatgpt_flutter/CHATGPT/screens/chat_screen.dart';
import 'package:chatgpt_flutter/LOGIN/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  void _handleSearch(BuildContext context) async {
    await showSearch(
      context: context,
      delegate: CustomSearchDelegate(),
    );
  }

  void _handleChatButton(
      BuildContext context, String buttonText, String? link) async {
    // Check if the link is not null and not empty
    if (link != null && link.isNotEmpty) {
      if (await canLaunch(link)) {
        await launch(link);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch the link.'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No link provided for this button.'),
        ),
      );
    }
  }

  void _handlechatbotbutton(BuildContext context) {
    // Navigate to the ChatPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Chatbot()),
    );
  }

  void _handlechatgptbutton(BuildContext context) {
    // Navigate to the SecondPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AISupportedBuddY'),
        backgroundColor: Color.fromARGB(255, 22, 16, 46),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => _handleSearch(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color:
              Color.fromARGB(255, 22, 16, 46), // Change drawer background color
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/login_background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: null,
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Navigate to the home page or perform an action
                  // Navigator.pop(context); // Close the drawer if needed
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.rocket_launch_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  'Bot',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Navigate to the settings page or perform an action
                  // Navigator.pop(context); // Close the drawer if needed
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.message_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  'ChatGPT',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Navigate to the settings page or perform an action
                  // Navigator.pop(context); // Close the drawer if needed
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.book_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  'About Us',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => AboutUsPage()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.phone_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Navigate to the settings page or perform an action
                  // Navigator.pop(context); // Close the drawer if needed
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                title: Text(
                  'LogOut',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
              // Add more items with icons to the drawer
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 24, 122, 157),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: [
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/notion.png',
                'Notion AI transforms your Notion pages, harnessing the power of AI to boost productivity and creativity in your writing process.',
                'https://www.notion.so/product/ai?utm_source=affl&utm_medium=nicholasalevras3843&pscd=affiliate.notion.so&ps_partner_key=bmljaG9sYXNhbGV2cmFzMzg0Mw&ps_xid=jLZUG8stku8OpY&gsxid=jLZUG8stku8OpY&gspk=bmljaG9sYXNhbGV2cmFzMzg0Mw'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/munch.png',
                'Munch turns long-form videos into short, viral clips.',
                'https://www.getmunch.com/?utm_campaign=influencers&utm_medium=website&utm_source=rewardful&via=gpte'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/logoai.png',
                'LogoAI is an AI engine that creates unique logo designs and branding templates based on design best practices for business cards, posters, flyers, and social media.',
                'https://www.logoai.com'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/dektopus.png',
                'Decktopus is the worlds #1 AI-powered presentation generator, streamlining the creation of engaging and visually appealing presentations.',
                'https://www.decktopus.com/?via=gpte'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/synthesia.png',
                'Synthesia generates lifelike AI videos based on text scripts. It allows for the creation of professional-looking videos without the need for filming or actors',
                'https://www.synthesia.io/?via=gpte'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/marketingblocks.png',
                'MarketingBlocks is an all-in-one AI marketing suite that creates landing pages, promo videos, ads, marketing copy, graphics, email swipes, blog posts, articles, art and more in minutes.',
                'https://marketingblocks.ai/ultimate/?affiliate=gpte'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/adcreative.png',
                'Adcreative.ai generates conversion-focused ad and social media post creatives in seconds. Get better results while saving time.',
                'https://www.adcreative.ai/?gspk=bmljaG9sYXNhbGV2cmFzMzg0Mw&gsxid=CYGiSebcTJzR&pscd=free-trial.adcreative.ai'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/Looka.png',
                'Looka is an AI-powered platform that helps you design a logo and build a brand you love.',
                'https://looka.com/?gspk=bmljaG9sYXNhbGV2cmFzMzg0Mw&gsxid=f3qj1xW1OmQq&utm_campaign=nicholasalevras3843&utm_content=TierA&utm_medium=affiliate&utm_source=growsumo'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/uizard.png',
                'Uizard is an AI-powered design tool that lets you create stunning web and mobile apps in minutes, even without any design experience.',
                'https://uizard.io/?transaction_id=102daf42b6b0cd775d295072b0f6e4&offer_id=3&affiliate_id=39&utm_campaign=affiliates&utm_term=GPTE%2FNicholas+Alevras&utm_source=affilate_&utm_medium=affiliate'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/taskade.png',
                'Taskade is a productivity tool that serves as a unified workspace designed to break down complexities and map out your collective mind, simplifying your work processes.',
                'https://www.taskade.com/?via=gpteai'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/Descript.png',
                'Descript is the only tool you need to write, record, transcribe, edit, collaborate, and share your videos and podcasts.',
                'https://www.descript.com/?lmref=sB6Cqw'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/Pictory.png',
                'Pictory automatically creates short, highly sharable branded videos from long-form content, enhancing your video marketing efforts.',
                'https://pictory.ai/?ref=nicholas34'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/Windosr.png',
                'Windsor sends millions of personalized videos to customers, ensuring they never forget your brand and building strong brand loyalty.',
                'https://www.windsor.io/?via=gpte'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/MeetGeek.png',
                'MeetGeek maximizes the value of meetings by recording, summarizing, and sharing key highlights, enhancing team collaboration and productivity.',
                'https://meetgeek.ai/?source=nicholasalevras3843&utm_campaign=partnerstack&utm_medium=partner&utm_source=nicholasalevras3843&pscd=get.meetgeek.ai&ps_partner_key=bmljaG9sYXNhbGV2cmFzMzg0Mw&ps_xid=ofZdEeky0LC2uL&gsxid=ofZdEeky0LC2uL&gspk=bmljaG9sYXNhbGV2cmFzMzg0Mw'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/listner.png',
                'Listnr is your go-to AI voice generator, offering voiceovers in 80+ languages and easy export in MP3 or WAV format.',
                'https://listnr.ai/?gr_pk=a1Yq&gr_uid=ZM5G'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/MeetGeek.png',
                'MeetGeek maximizes the value of meetings by recording, summarizing, and sharing key highlights, enhancing team collaboration and productivity.',
                'https://meetgeek.ai/?source=nicholasalevras3843&utm_campaign=partnerstack&utm_medium=partner&utm_source=nicholasalevras3843&pscd=get.meetgeek.ai&ps_partner_key=bmljaG9sYXNhbGV2cmFzMzg0Mw&ps_xid=ofZdEeky0LC2uL&gsxid=ofZdEeky0LC2uL&gspk=bmljaG9sYXNhbGV2cmFzMzg0Mw'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/MeetGeek.png',
                'MeetGeek maximizes the value of meetings by recording, summarizing, and sharing key highlights, enhancing team collaboration and productivity.',
                'https://meetgeek.ai/?source=nicholasalevras3843&utm_campaign=partnerstack&utm_medium=partner&utm_source=nicholasalevras3843&pscd=get.meetgeek.ai&ps_partner_key=bmljaG9sYXNhbGV2cmFzMzg0Mw&ps_xid=ofZdEeky0LC2uL&gsxid=ofZdEeky0LC2uL&gspk=bmljaG9sYXNhbGV2cmFzMzg0Mw'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/MeetGeek.png',
                'MeetGeek maximizes the value of meetings by recording, summarizing, and sharing key highlights, enhancing team collaboration and productivity.',
                'https://meetgeek.ai/?source=nicholasalevras3843&utm_campaign=partnerstack&utm_medium=partner&utm_source=nicholasalevras3843&pscd=get.meetgeek.ai&ps_partner_key=bmljaG9sYXNhbGV2cmFzMzg0Mw&ps_xid=ofZdEeky0LC2uL&gsxid=ofZdEeky0LC2uL&gspk=bmljaG9sYXNhbGV2cmFzMzg0Mw'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/MeetGeek.png',
                'MeetGeek maximizes the value of meetings by recording, summarizing, and sharing key highlights, enhancing team collaboration and productivity.',
                'https://meetgeek.ai/?source=nicholasalevras3843&utm_campaign=partnerstack&utm_medium=partner&utm_source=nicholasalevras3843&pscd=get.meetgeek.ai&ps_partner_key=bmljaG9sYXNhbGV2cmFzMzg0Mw&ps_xid=ofZdEeky0LC2uL&gsxid=ofZdEeky0LC2uL&gspk=bmljaG9sYXNhbGV2cmFzMzg0Mw'),
            _AIBLOCKS(
                context,
                'Explore Now',
                'assets/app/MeetGeek.png',
                'MeetGeek maximizes the value of meetings by recording, summarizing, and sharing key highlights, enhancing team collaboration and productivity.',
                'https://meetgeek.ai/?source=nicholasalevras3843&utm_campaign=partnerstack&utm_medium=partner&utm_source=nicholasalevras3843&pscd=get.meetgeek.ai&ps_partner_key=bmljaG9sYXNhbGV2cmFzMzg0Mw&ps_xid=ofZdEeky0LC2uL&gsxid=ofZdEeky0LC2uL&gspk=bmljaG9sYXNhbGV2cmFzMzg0Mw'),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => _handlechatbotbutton(context),
              child: Icon(Icons.question_mark_rounded),
              backgroundColor: Color.fromARGB(255, 110, 142, 8),
            ),
            SizedBox(width: 16.0), // Adding some space between the buttons
            FloatingActionButton(
              onPressed: () => _handlechatgptbutton(context),
              child: Icon(Icons.chat),
              backgroundColor: Color.fromARGB(255, 32, 30, 99),
            ),
          ],
        ),
      ),
    );
  }

  Widget _AIBLOCKS(BuildContext context, String buttonText, String assetPath,
      String description, String link) {
    return GestureDetector(
      onTap: () => _handleChatButton(context, buttonText, link),
      child: Container(
        width: 150.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 5.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              height: 250.0,
              child: Image.asset(
                assetPath,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 5.0), // Adjust the top padding of the button
            ElevatedButton(
              onPressed: () => _handleChatButton(context, buttonText, link),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0), // Adjust the vertical padding here
                child: Text(
                  buttonText,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              style: ElevatedButton.styleFrom(
                // padding: const EdgeInsets.only(bottom: 40),
                primary: Color.fromARGB(255, 222, 123, 69),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text('No search query entered.'),
      );
    } else {
      // Implement the search results display here
      return Center(
        child: Text('Search results for: $query'),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement search suggestions here (if needed)
    return Center(
      child: Text('Type to search...'),
    );
  }
}
