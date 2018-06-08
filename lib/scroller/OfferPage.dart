
import 'dart:ui';
import 'package:flutter/material.dart';
import '../model/offers.dart';
import '../scroller/video_card.dart';

class OffersPage extends StatelessWidget {
  OffersPage(this.offer);
  final offers offer;

  Widget _buildContent() {
    return new SingleChildScrollView(
       padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
                  welcomeMessage,   
                  line,
                  headerMessage,
          _buildVideoScroller(),
        ],
      ),
    );
  }

   Widget _buildVideoScroller() {
    return new Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: new SizedBox.fromSize(
        size: new Size.fromHeight(245.0),
        child: new ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          itemCount: offer.images.length,
          itemBuilder: (BuildContext context, int index) {
            var video = offer.images[index];
            return new ImageCard(video);
          },
        ),
      ),
    );
  }

final welcomeMessage =  Row(          
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [            
                      new Column(children: [  new Container(
                        margin: const EdgeInsets.only(top:10.0),
                        child : new Text(
                                'Welcome Shiva',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.white),                               
                              )
                      ),              
                      ]),                   
                    ],
                  );    

  final headerMessage = Row(          
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [            
                      new Column(children: [  new Container(
                        margin: const EdgeInsets.only(top:10.0, bottom: 40.0),
                        child : new Text(
                                'We are glad to make your Business Travel Exciting!',
                                style: const TextStyle(fontSize: 16.0, color: Colors.white),                               
                              )
                      ),              
                      ]),                   
                    ],
                  );

  final line = Container(
          color: Colors.white.withOpacity(0.85),
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          width: 500.0,
          height: 2.0,
        );       

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset("assets/background.jpg", fit: BoxFit.cover),
          new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: new Container(
              color: Colors.black.withOpacity(0.5),
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }
}