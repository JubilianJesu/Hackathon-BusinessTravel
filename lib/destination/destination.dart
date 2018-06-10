// Copyright 2017, the Flutter project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import '../model/offers.dart';
import 'package:url_launcher/url_launcher.dart';

offers getevents()
{
offers offersdata = new offers(   
    images: <image>[ 
      new image(
        title: 'Jazz in the Garden Concert Series, On June 08, 2018',
        imageUrl: 'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F41503594%2F1961717567%2F1%2Foriginal.jpg?w=800&auto=compress&rect=583%2C389%2C1944%2C972&s=e068139d3d0c3fcb38c8385afd60109f',
        url: 'https://washington.org/event/jazz-garden-concert-series',
      ),
      new image(
        title: 'DC Jazz Festival, From June 8-17, 2018',
        imageUrl: 'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F41503594%2F1961717567%2F1%2Foriginal.jpg?w=800&auto=compress&rect=583%2C389%2C1944%2C972&s=e068139d3d0c3fcb38c8385afd60109f',
        url: 'https://washington.org/visit-dc/reasons-to-attend-dc-jazz-festival',
      ),
      new image(
        title: 'Experience a creativity, From June 21-24, 2018',
        imageUrl: 'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F41503594%2F1961717567%2F1%2Foriginal.jpg?w=800&auto=compress&rect=583%2C389%2C1944%2C972&s=e068139d3d0c3fcb38c8385afd60109f',
        url: 'https://washington.org/visit-dc/discover-by-the-people-festival',
      ),
      new image(
        title: 'Girlfriend , Signature Theatre, From June 10, 2018',
        imageUrl: 'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F41503594%2F1961717567%2F1%2Foriginal.jpg?w=800&auto=compress&rect=583%2C389%2C1944%2C972&s=e068139d3d0c3fcb38c8385afd60109f',
        url: 'https://washington.org/event/girlfriend-matthew-sweet-and-todd-almond',
      ),
    ],
  );

  return offersdata;
}

Widget _buildThumbnail(imagethumbnail, linkurl) {
    return new ClipRRect(
      borderRadius: new BorderRadius.circular(8.0),
      child: new Stack(
        children: <Widget>[
          new Image.network(imagethumbnail),
          // new Positioned(
          //   bottom: 12.0,
          //   right: 12.0,
          //   child: _buildPlayButton(linkurl),
          // ),
        ],
      ),
    );
  }

 Widget _buildPlayButton(linkurl) {
    return new Material(
      color: Colors.black87,
      type: MaterialType.circle,
      child: new InkWell(
        onTap: () async {
          if (await canLaunch(linkurl)) {
            await launch(linkurl);
          }
        },
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),        
        ),
      ),
    );
  }

 Widget _buildInfo(eventtitle) {
    return  new Container(
                    height: 80.0,
                    margin: const EdgeInsets.only(left: 5.0, top: 3.0),                    
                    child: new Text(
                      eventtitle,
                      style: new TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                      textAlign: TextAlign.start,
                      //overflow: TextOverflow.ellipsis,
                      softWrap: true,                      
                      //maxLines: 1,
                    ),                    
                  );
  }

Widget _buildTile(image imagedata) {
    return  new GestureDetector(
      onTap: () async {
          if (await canLaunch(imagedata.url)) {
            await launch(imagedata.url);
          }
        },
      child: new Container(          
              margin: const EdgeInsets.only(left: 1.0),
              padding: const EdgeInsets.only(bottom: 5.0),
              decoration: const BoxDecoration(
                border: const Border(
                  top: const BorderSide(width: 0.8, color: Colors.grey),
                  right: const BorderSide(width: 0.8, color: Colors.grey),
                  bottom: const BorderSide(width: 0.8, color: Colors.grey),
                  left: const BorderSide(width: 0.8, color: Colors.grey),
                ),
              ),            
              child: new Row(                
                  children: [
                    new Flexible(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Container(                          
                            //padding: const EdgeInsets.only(bottom: 0.0),
                            child: _buildThumbnail(imagedata.imageUrl, imagedata.url)
                          ),
                         
                        ],
                      ),
                    ),
                    new Flexible(                      
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfo(imagedata.title)                                                      
                            ],
                          ),
                        ),             
                  ],
                ),
      ),
  );
}

  Widget getEvent(image imagedata)
  {
      return new Row(
        children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Flexible(flex: 0, child: _buildThumbnail(imagedata.imageUrl,imagedata.url)),                                 
                ],
              ),  
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Flexible(flex: 3, child: _buildInfo(imagedata.title)),                                 
                ],
              ),     
        ],  
      ); 
  }

const tabCount = 2;

class DestinationsBarDelegate extends SliverPersistentHeaderDelegate {
  DestinationsBarDelegate({ this.controller });

  final TabController controller;

  @override
  double get minExtent => kToolbarHeight;

  @override
  double get maxExtent => kToolbarHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return new Container(
      color: Theme
          .of(context)
          .cardColor,
      height: kToolbarHeight,
      child: new TabBar(
        controller: controller,
        key: new PageStorageKey<Type>(TabBar),
        indicatorColor: Theme
            .of(context)
            .primaryColor,
        tabs: <Widget>[
          new Tab(text: 'IT Events'),
          new Tab(text: 'Sports Events'),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant DestinationsBarDelegate oldDelegate) {
    return oldDelegate.controller != controller;
  }
}

class MyDestinations extends StatefulWidget {
   static String tag="mydestinations-Page";
  @override
  DestinationsPageState createState() => new DestinationsPageState();
}

class DestinationsPageState extends State<MyDestinations>
    with TickerProviderStateMixin {
  ScrollController _scrollController = new ScrollController();

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: tabCount, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Events'),
        elevation: 0.0,
      ),
      body: new NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverPersistentHeader(
              pinned: true,
              delegate: new DestinationsBarDelegate(controller: _tabController),
            ),
          ];
        },
        body: new DestinationsPageBody(
          tabController: _tabController,
          scrollController: _scrollController,
        ),
      ),
    );
  }
}

class DestinationsPageBody extends StatefulWidget {
  DestinationsPageBody({ this.scrollController, this.tabController });

  final ScrollController scrollController;
  final TabController tabController;

  DestinationsPageBodyState createState() => new DestinationsPageBodyState();
}

class DestinationsPageBodyState extends State<DestinationsPageBody> {
  Key _key = new PageStorageKey({});
  bool _innerListIsScrolled = false;

  void _updateScrollPosition() {
    if (!_innerListIsScrolled && widget.scrollController.position.extentAfter == 0.0) {
      setState(() {
        _innerListIsScrolled = true;
      });
    } else if (_innerListIsScrolled && widget.scrollController.position.extentAfter > 0.0) {
      setState(() {
        _innerListIsScrolled = false;
        // Reset scroll positions of the TabBarView pages
        _key = new PageStorageKey({});
      });
    }
  }

  @override
  void initState() {
    widget.scrollController.addListener(_updateScrollPosition);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateScrollPosition);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    offers offerdata = getevents();

    return new TabBarView(
    
      controller: widget.tabController,
      key: _key,
      children: new List<Widget>.generate(tabCount, (int index) {
        return new ListView.builder(        
          padding: const EdgeInsets.only(left: 0.0),
          key: new PageStorageKey<int>(index),
          itemCount: offerdata.images.length,
          itemBuilder:  (BuildContext context, int index) {
            var offer = offerdata.images;
            var imagedata = offer[index];
            print(imagedata.imageUrl);
            return _buildTile(imagedata);
          },
        );
      }),
    );
  }
}