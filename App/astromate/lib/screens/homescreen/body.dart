import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with SingleTickerProviderStateMixin{

  // Initializes the animation
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {

    animationController = AnimationController(duration: Duration(milliseconds: 1250), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(curve: Interval(0.0, 1.0, curve: Curves.linearToEaseOut),
          parent: animationController)
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  // Screen dimensions
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child){
        return Column(
          children: [
            
          ],
        );
      },
    );
  }
}


class ListViewItem extends StatelessWidget {

  String itemTitle;
  IconData itemIcon;
  Function onTap;

  ListViewItem(this.itemTitle, this.itemIcon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO: Add design for home page items
    );
  }
}
