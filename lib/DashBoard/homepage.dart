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

import 'CartPage.dart';
import 'MyOrderPage.dart';

class HomePageContent extends StatefulWidget {

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {



  @override
  void initState() {
    super.initState();

  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        elevation: 0.0,
        title: Text("Home", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 30.0),),
      ),
      drawer: createDrawer(),
      body: SingleChildScrollView(
          child: Container(
          //padding: EdgeInsets.symmetric(horizontal:20.0,vertical:10.0),
          width: MediaQuery.of(context).size.width,
          color:Colors.white,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            createSearchBar(),
            SizedBox(height: 10.0,),

            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 5.0),
              child: Text("Recently Added",style: TextStyle(color: Colors.orange,fontSize: 30.0,fontWeight: FontWeight.bold,),),
            ),
            createListRecntlyAdd(), 
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:18.0),
              child: Text("Food Category",style: TextStyle(color: Colors.orange,fontSize: 30.0,fontWeight: FontWeight.bold,),),
            ),
            createFoodCategory(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:18.0),
              child: Text("For You",style: TextStyle(color: Colors.black45,fontSize: 20.0,fontWeight: FontWeight.bold,),),
            ),
            createForYou(),
          ],)
        ),
      ),
    );
  }

  // createbanner(){
  //   // for creating image list with name
  //   final List<Widget> imageSliders = homePageBloc.bannerFoodList.map((item) => GestureDetector(
  //   onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=>FoodDetailPage(food:item))),
  //   child: Container(
  //     margin: EdgeInsets.all(5.0),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //       child: Stack(
  //         children: <Widget>[
  //           Image.network(item.image, fit: BoxFit.cover, width: 1000.0),
  //           Positioned(
  //             bottom: 0.0,
  //             left: 0.0,
  //             right: 0.0,
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 gradient: LinearGradient(
  //                   colors: [
  //                     Color.fromARGB(200, 0, 0, 0),
  //                     Color.fromARGB(0, 0, 0, 0)
  //                   ],
  //                   begin: Alignment.bottomCenter,
  //                   end: Alignment.topCenter,
  //                 ),
  //               ),
  //               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  //               child: Text(
  //                 '${item.name}',
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 20.0,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       )
  //     ),
  //   ),
  // )).toList();
  //
  // return Padding(
  //   padding: const EdgeInsets.symmetric(vertical: 15.0),
  //   child: Container(
  //       child: Column(children: <Widget>[
  //         CarouselSlider(
  //           options: CarouselOptions(
  //             autoPlay: true,
  //             aspectRatio: 2.0,
  //             enlargeCenterPage: true,
  //             enlargeStrategy: CenterPageEnlargeStrategy.height,
  //           ),
  //           items: imageSliders,
  //         ),
  //       ],)
  //     ),
  //   );
  // }

  createDrawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          DrawerHeader(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white,),
              accountName:Text("") ,
              accountEmail: Text(""),
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

  gotoCateogry(Category category){
 //   Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryListPage(category)));
  }

  createListRecntlyAdd(){
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // GestureDetector( onTap: ()=>gotoCateogry(homePageBloc.recentlyCategory), child: CircleAvatar(radius: 35.0,backgroundImage: NetworkImage("https://www.pngitem.com/pimgs/m/398-3981213_how-to-draw-burger-burger-drawing-easy-hd.png",scale: 60.0),)),
          // GestureDetector( onTap: ()=>gotoCateogry(homePageBloc.recentlyCategory2),child: CircleAvatar(radius: 35.0,backgroundImage: NetworkImage("https://img.favpng.com/19/11/2/pizza-clip-art-vector-graphics-pepperoni-illustration-png-favpng-Mf177mM20Db6kFJa1SmMpQN5R.jpg",scale: 60.0),)),
          // GestureDetector( onTap: ()=>gotoCateogry(homePageBloc.recentlyCategory3),child: CircleAvatar(radius: 35.0,backgroundImage: NetworkImage("https://www.vippng.com/png/detail/133-1337804_french-fry-png-mcdonalds-french-fries-drawing.png",scale: 60.0),)),
          // GestureDetector( onTap: ()=>gotoCateogry(homePageBloc.recentlyCategory4),child: CircleAvatar(radius: 35.0,backgroundImage: NetworkImage("https://www.kindpng.com/picc/m/488-4883349_png-download-png-download-kfc-chicken-bowl-easy.png",scale: 60.0),)),
        ],
      ),
    );
  }

  createFoodCategory(){

  }

  createForYou(){

  }
}
