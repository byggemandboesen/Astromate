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

  // Screen width
  double width = MediaQuery.of(context).size.width;

  animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child){
        // TODO: Create custom icons
        return Transform(
          transform: Matrix4.translationValues(animation.value*width, 0, 0),
          child: ListView(
            shrinkWrap: true,
            children: [
              ListViewItem(
                'Visual',
                Icons.remove_red_eye,
                () => {}
              ),
              ListViewItem(
                'Imaging',
                Icons.camera,
                () => {}
              ),
              ListViewItem(
                'Solar system',
                Icons.brightness_3,
                () => {}
              ),
              ListViewItem(
                'Satellites',
                Icons.wifi,
                () => {},
              )
            ],
          ),
        );
      },
    );
  }
}


class ListViewItem extends StatelessWidget {

  final String itemTitle;
  final IconData itemIcon;
  final Function onTap;

  ListViewItem(this.itemTitle, this.itemIcon, this.onTap);

  @override
  Widget build(BuildContext context) {

  // Screen height
  double height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: height*0.17,
      color: Theme.of(context).primaryColor,
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(itemTitle, style: Theme.of(context).textTheme.headline1),
              Icon(itemIcon, color: Theme.of(context).accentColor)
            ],
          ),
        )
      ),
    );
  }
}
