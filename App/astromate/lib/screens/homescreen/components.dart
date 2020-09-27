import 'package:flutter/material.dart';

class HomeScreenDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer( 
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor
            ),
            child: Center(
              child: Text('Welcome!', style: Theme.of(context).textTheme.headline1,),
            ),
          ),
          DrawerItem(
            () => {},
            Icons.build,
            'Equipment'
          ),
          DrawerItem(
            () => {},
            Icons.edit_location,
            'Locations'
          ),
          DrawerItem(
            () => {},
            Icons.settings,
            'Settings'
          ),
          DrawerItem(
            () => {},
            Icons.info,
            'About'
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {

  // Requirred items for each listtile in the drawer
  Function onTap;
  IconData itemIcon;
  String itemTitle;
  
  DrawerItem(this.onTap, this.itemIcon, this.itemTitle);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height*0.04,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: InkWell(
        splashColor: Theme.of(context).accentColor,
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.only(right: 10), child: Icon(itemIcon)),
                Text(itemTitle, style: Theme.of(context).textTheme.subtitle2,),
              ],
            ),
            Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}
