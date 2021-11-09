import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'provider/theme_changer.dart';
import 'style/style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeChanger>(context);

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, right: 18),
                        child: ThemeSwitcher(
                          builder: (context) {
                            return CircleAvatar(
                              radius: 30,
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    if (_theme.isLight) {
                                      ThemeSwitcher.of(context)
                                          .changeTheme(theme: darkTheme);
                                      _theme.setTheme(false);
                                    } else {
                                      ThemeSwitcher.of(context).changeTheme(
                                        theme: lightTheme,
                                        reverseAnimation: true,
                                      );
                                      _theme.setTheme(true);
                                    }
                                  },
                                  icon: Icon(_theme.isLight ? CupertinoIcons.sun_max_fill: CupertinoIcons.moon_fill, color: _theme.isLight ? Colors.black : Colors.white,),
                                ),
                              ),
                              backgroundColor: _theme.isLight ? Colors.white : Color(0xff1E1E1E),
                            );
                          },
                        ),
                      ),
                      alignment: Alignment.centerRight,
                    ),
                    Material(
                      color: Theme.of(context).cardColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).cardColor,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(
                          'assets/images/me.png',
                          fit: BoxFit.contain,
                          height: 140,
                          width: 140,
                        ),
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
                      'This quick website is built in Flutter 💙',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "I help businesses scale to multiple figures with Mobile Apps.",
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
                      text: "Here's my YouTube Channel",
                      link: 'https://www.youtube.com/c/Jeeali',
                    ),
                    _listTile(
                      img: 'assets/images/linkedin.png',
                      text: "Let's Connect",
                      link: 'https://www.linkedin.com/in/jeeali/',
                    ),
                    _listTile(
                      img: 'assets/images/wa.png',
                      text: "Let's talk business",
                      link: 'https://api.whatsapp.com/send?phone=+17162020002',
                    ),
                    _listTile(
                      img: _theme.isLight ? 'assets/images/nt.png' : 'assets/images/nt-white.png',
                      text: "Nerd's Tribe",
                      link: 'https://nerdstribe.com',
                    ),
                    _listTile(
                      img: 'assets/images/github.png',
                      text: "Github Profile",
                      link: 'https://github.com/jeeali',
                    ),
                    SizedBox(height: kToolbarHeight * .5),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _listTile({String img, String text, String link}) {
    final _theme = Provider.of<ThemeChanger>(context, listen: false);

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
                  img.contains('github') && !_theme.isLight ?
                  Image.asset(
                    img,
                    width: 50,
                    height: 50,
                    color: Colors.white,
                  ) : Image.asset(
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
