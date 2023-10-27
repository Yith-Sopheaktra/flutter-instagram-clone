import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/constants/post_list_constant.dart';
import 'package:instagram/constants/user_list_constant.dart';

import 'package:instagram/models/post_models.dart';
import 'package:instagram/models/user_models.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: _buildAppbar,
      body: _buildBody,
    );
  }


  AppBar get _buildAppbar {
    return AppBar(
      backgroundColor: Colors.grey[50],
      leadingWidth: 130,
      leading: Center(
        child: Text(
          "Instagram",
          style: TextStyle(fontSize: 30, color: Colors.black, fontFamily: "IG"),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.heart,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.facebookMessenger,
              color: Colors.black,
            ))
      ],
    );
  }

  Widget get _buildBody {
    return Container(
      alignment: Alignment.center,
      child: _buildMainListView,
    );
  }

  Widget get _buildMainListView {
    return ListView(
      children: [
        _buildStory,
        Divider(
          color: Colors.grey,
        ),
        _buildListView,
      ],
    );
  }

  Widget get _buildListView {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: postList.length,
          itemBuilder: (context, index) {
            return _buildListItem(postList[index]);
          }),
    );
  }

  Widget _buildListItem(PostModel item) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: item.image,
                      imageBuilder: (context, imageProvider) => Container(
                        padding: EdgeInsets.all(6),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [Colors.purple, Colors.orange])),
                            ),
                            Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(item.image),
                                      fit: BoxFit.cover),
                                  border: Border.all(
                                      color: Colors.white, width: 1.5)),
                            ),
                          ],
                        ),
                      ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Text(
                      "${item.name}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: CachedNetworkImage(
              imageUrl: item.image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(FontAwesomeIcons.heart)),
                    IconButton(
                        onPressed: () {}, icon: Icon(FontAwesomeIcons.comment)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.paperPlane)),
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(FontAwesomeIcons.bookmark))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "${item.NickName}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${item.caption}",
                  style: TextStyle(),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget get _buildStory {
    return Container(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: userlist.length,
        itemBuilder: (context, index) {
          return _buildStoryItem(userlist[index]);
        },
      ),
    );
  }

  Widget _buildStoryItem(UserModel item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: item.image,
          imageBuilder: (context, imageProvider) => Container(
            padding: EdgeInsets.all(6),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.purple, Colors.orange])),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(item.image), fit: BoxFit.cover),
                      border: Border.all(color: Colors.white, width: 1.5)),
                ),
              ],
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Container(
          width: 120,
          height: 20,
          child: Text(
            item.name,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
