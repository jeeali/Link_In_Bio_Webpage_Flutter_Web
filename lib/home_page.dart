import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: kToolbarHeight*1.1),
              Material(
                // color: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset('assets/images/me2.png',fit: BoxFit.contain,height: 140, width: 140,),
                ),
              ),
              SizedBox(height: kToolbarHeight * .4),
              Text(
                '@jeealiii',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: kToolbarHeight * .4),
              Text(
                'This website is made with Flutter 💙',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "All my links are here 🔗",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: kToolbarHeight * .4),
              _listTile(
                img: 'assets/images/bitclout.png',
                text: "I'm on BitClout",
                link: 'https://bitclout.com/u/jeeali',
              ),
              _listTile(
                img: 'assets/images/youtube.png',
                text: "Here's my Youtube Channel",
                link: 'https://www.youtube.com/c/Jeeali',
              ),
              _listTile(
                img: 'assets/images/linkedin.png',
                text: 'Follow me on LinkedIn',
                link: 'https://www.linkedin.com/in/jeeali/',
              ),
              _listTile(
                img: 'assets/images/github.png',
                text: "Github Profile",
                link: 'https://github.com/jeeali',
              ),
              _listTile(
                img: 'assets/images/ja.png',
                text: 'Portfolio',
                link: 'https://jeeali.com',
              ),
              SizedBox(height: kToolbarHeight*.5),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listTile({String img, String text, String link}) {
    return Container(
      width: 300,
      margin: EdgeInsets.symmetric(vertical: 3),
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => _launchURL(link),
          child: Card(
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  SizedBox(width: 26),
                  Image.asset(
                    img,
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(width: 26),
                  Expanded(
                    child: Text(
                      text,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
