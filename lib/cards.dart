import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ombre_clone_flutter/user_class.dart';
import 'package:ombre_clone_flutter/event_class.dart';

class DisplayEvent extends StatelessWidget {
  event_class event;
  DisplayEvent(@required event_class event) {
    this.event = event;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl:event.url,
          width: MediaQuery.of(context).size.width * 0.36,
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Text(
                event.category.toString().replaceAll(',', ' |'),
                style: TextStyle(
                  color: Color(0xFFDA5C86),
                ),
              ),
            ),
            Text(
              event.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Lato'),
            ),
          ],
        ),
      ],
    );
  }
}

class DisplayUser extends StatelessWidget {
  user_class user;
  DisplayUser(@required user_class user) {
    this.user = user;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 190.0,
          width:MediaQuery.of(context).size.width * 0.25,
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.056, right: MediaQuery.of(context).size.width * 0.08),
          child: Container(
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new CachedNetworkImageProvider(user.imageUrl),
                  )
              ),
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              user.username,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.5,
              ),
            ),
            Text(
              user.actual_name,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 11,
              ),
            ),
            Text(
              user.description,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
