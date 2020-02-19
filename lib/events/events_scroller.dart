// Copyright 2017, the Flutter project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import '../model/offers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'dart:convert';

Future<List<image>> getevents() async {
  await new Future.delayed(const Duration(seconds : 2));
  offers offersdata = new offers(
    images: <image>[
      new image(
        title: 'Seattle Sounders FC, On April 12, 2019',
        imageUrl:
            'http://cdn.placepass.com/vendors/fanxchange/fanxchange_product_images/soccer_1.jpg',
        url: 'https://www.placepass.com/things-to-do/h8bjMv7SZ1ZZgSZ-seattle-sounders-fc?startDate=2019-04-05&endDate=2019-04-12',
        description: 'Real Salt Lake at Seattle Sounders FC, On April 12, 2019',
      ),
      new image(
        title: 'Washington Huskies Softball, From April 8-17, 2019',
        imageUrl:
            'http://cdn.placepass.com/vendors/fanxchange/fanxchange_product_images/baseball_8.jpg',
        url:
            'https://www.placepass.com/things-to-do/h8bjMv7SZ17SEL0-washington-huskies-softball?startDate=2019-04-05&endDate=2019-04-12',
        description: 'Arizona State Sun Devils at Washington Huskies Softball, From April 8-17, 2019',
      )
    ],
  );

  List<image> images = offersdata.images;
  return images;
}

Future<List<image>> getapievents() async {
  List<image> data;

  http.Response res = await http.get(
      "https://ndcwas18.azurewebsites.net/api/event/1/preferences",
      headers: {
        "Content-Type": "Application/Json",
      }).then((http.Response response) {
    String jsonContent = response.body.toString();
    final parsed = json.decode(jsonContent).cast<Map<String, dynamic>>();
    data = parsed.map<image>((i) => new image.fromJson(i)).toList();
  });
  // print(res.body);
  // print(res.statusCode);
  return data;
}

Widget _buildThumbnail(imagethumbnail, linkurl) {
  return new ClipRRect(
    borderRadius: new BorderRadius.circular(8.0),
    child: new Stack(
      children: <Widget>[
        new Image.network(imagethumbnail),
      ],
    ),
  );
}

Widget _buildInfo(eventtitle) {
  return new Container(
    height: 80.0,
    margin: const EdgeInsets.only(left: 5.0, top: 3.0),
    child: new Text(
      eventtitle,
      style: new TextStyle(
          fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black54),
      textAlign: TextAlign.start,
      //overflow: TextOverflow.ellipsis,
      softWrap: true,
      //maxLines: 1,
    ),
  );
}

Widget _buildTile(image imagedata) {
  return new GestureDetector(
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
                    child: _buildThumbnail(imagedata.imageUrl, imagedata.url)),
              ],
            ),
          ),
          new Flexible(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_buildInfo(imagedata.title)],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget getEvent(image imagedata) {
  return new Row(
    children: <Widget>[
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Flexible(
              flex: 0,
              child: _buildThumbnail(imagedata.imageUrl, imagedata.url)),
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

class EventsBarDelegate extends SliverPersistentHeaderDelegate {
  EventsBarDelegate({this.controller});

  final TabController controller;

  @override
  double get minExtent => kToolbarHeight;

  @override
  double get maxExtent => kToolbarHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Theme.of(context).cardColor,
      height: kToolbarHeight,
      child: new TabBar(
        controller: controller,
        key: new PageStorageKey<Type>(TabBar),
        indicatorColor: Theme.of(context).primaryColor,
        tabs: <Widget>[
          new Tab(text: 'IT Events'),
          new Tab(text: 'Sports Events'),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant EventsBarDelegate oldDelegate) {
    return oldDelegate.controller != controller;
  }
}

class MyEvents extends StatefulWidget {
  static String tag = "myevents-Page";
  @override
  EventsPageState createState() => new EventsPageState();
}

class EventsPageState extends State<MyEvents> with TickerProviderStateMixin {
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
              delegate: new EventsBarDelegate(controller: _tabController),
            ),
          ];
        },
        body: new EventsPageBody(
          tabController: _tabController,
          scrollController: _scrollController,
        ),
      ),
    );
  }
}

class EventsPageBody extends StatefulWidget {
  EventsPageBody({this.scrollController, this.tabController});

  final ScrollController scrollController;
  final TabController tabController;

  EventsPageBodySTate createState() => new EventsPageBodySTate();
}

class EventsPageBodySTate extends State<EventsPageBody> {
  Key _key = new PageStorageKey({});
  bool _innerListIsScrolled = false;

  void _updateScrollPosition() {
    if (!_innerListIsScrolled &&
        widget.scrollController.position.extentAfter == 0.0) {
      setState(() {
        _innerListIsScrolled = true;
      });
    } else if (_innerListIsScrolled &&
        widget.scrollController.position.extentAfter > 0.0) {
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
    return new FutureBuilder(
        future: getevents(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (!snapshot.hasData)
            return new Center(child: new CircularProgressIndicator());
          List content = snapshot.data;
          return new ListView.builder(
            padding: const EdgeInsets.only(left: 0.0),
            itemCount: content.length,
            itemBuilder: (BuildContext context, int index) {            
              image imagedata = content[index];              
              return _buildTile(imagedata);              
            },
          );
        });
  }
}
