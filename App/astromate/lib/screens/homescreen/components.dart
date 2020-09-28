import 'package:flutter/material.dart';

import 'package:astromate/theme.dart';

class HomeScreenDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer( 
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor
            ),
            child: Center(
              child: Text('Welcome!', style: Theme.of(context).textTheme.headline1,),
            ),
          ),
          // TODO: Add onTap functions
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
  final Function onTap;
  final IconData itemIcon;
  final String itemTitle;
  
  DrawerItem(this.onTap, this.itemIcon, this.itemTitle);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height*0.04,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(itemIcon, color: ThemeStatus().themeBool ? Colors.black : Theme.of(context).primaryColor)
                  ),
                Text(itemTitle, style: Theme.of(context).textTheme.subtitle2,),
              ],
            ),
            Icon(Icons.chevron_right, color: ThemeStatus().themeBool ? Colors.black : Theme.of(context).primaryColor)
          ],
        ),
      ),
    );
  }
}
