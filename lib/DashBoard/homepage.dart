/*
 * Copyright (c) 2021 Akshay Jadhav <jadhavakshay0701@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 3 of the License, or (at your option) any later
 * version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program.  If not, see <http://www.gnu.org/licenses/>.
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_tourist/utils/universal_variables.dart';

import 'CartPage.dart';
import 'MyOrderPage.dart';

class HomePageContent extends StatefulWidget {

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {

  @override
  Widget build(BuildContext context) {
          return Scaffold();
  }
  createDrawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          DrawerHeader(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white,),
              accountName:Text("Adeena") ,
              accountEmail: Text("Addena@gmail.com"),
              currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage("https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/eggs-breakfast-avocado-1296x728-header.jpg?w=1155&h=1528")),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.transparent,
            ),
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios,),
            leading: Icon(Icons.home,color: Colors.orangeAccent,),
            title: Text('Home',),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios,),
            leading: Icon(Icons.shopping_basket,color: Colors.orangeAccent,),
            title: Text('Cart'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios,),
            leading: Icon(Icons.fastfood,color: Colors.orangeAccent,),
            title: Text('My Order'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrderPage()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios,),
            leading: Icon(Icons.clear,color: Colors.orangeAccent,),
            title: Text('Logout'),
            onTap: () async {
              // final AuthMethods _authMethods = AuthMethods();
              //  await _authMethods.logout();
            },
          ),
        ],
      ),
    );
  }
  createSearchBar(){
       return  Container(
         height: MediaQuery.of(context).size.height*0.08,
         child: Stack(
           children: <Widget>[
             // Replace this container with your Map widget
             Container(
               decoration: BoxDecoration(
                 color: Colors.orange,
                 borderRadius: BorderRadius.only(
                   bottomRight:Radius.circular(20.0),
                   bottomLeft: Radius.circular(20.0),
                 ),
               ),
             ),
             Positioned(
               top: 10,
               right: 15,
               left: 15,
               child: GestureDetector(
              //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage())),
                 child: Container(
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.all(Radius.circular(10.0))
                   ),
                   child: Row(
                     children: <Widget>[
                       Expanded(
                         child: Padding(
                           padding: const EdgeInsets.only(left:18.0),
                           child: Text("Search",style: TextStyle(color: Colors.black45),),
                         )
                       ),
                       Padding(
                         padding: const EdgeInsets.only(right: 8.0),
                         child: IconButton(icon: Icon(Icons.search,color: Colors.orange,), onPressed: null)
                       ),
                     ],
                   ),
                 ),
               ),
             ),
           ],
         ),
       );
     }

}


