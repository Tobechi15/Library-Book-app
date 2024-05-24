import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:book_app/widgets/custom_tab.dart';
import 'package:book_app/models/newbook_model.dart';
import 'package:book_app/models/popularbook_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Hi Tobechi ", style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey
                  ),),
                  Text("Discover Latest Book ", style: GoogleFonts.openSans(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),)
                ],
              )
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25, top: 18),
              height: 39,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
              ),
              child: Stack(
                children: [
                  TextField(
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 19,right: 50,bottom: 8),
                      border: InputBorder.none,
                      hintText: 'search book',
                      hintStyle: GoogleFonts.openSans(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: SvgPicture.asset("assets/svg/background_search.svg"),
                  ),
                  Positioned(
                    right: 9,
                    top: 8,
                    child: SvgPicture.asset('assets/icons/icon_search_white.svg'),
                  )
                ],
              ),
            ),
            Container(
              height: 25,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 25),
              child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                      labelPadding: EdgeInsets.all(0),
                      indicatorPadding: EdgeInsets.all(0),
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w700
                      ),
                      unselectedLabelStyle: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      indicator: RoundedRectangleTabIndicator(
                        width: 10,
                        weight: 2,
                        color: Colors.black,
                      ),
                      tabs: [
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 23),
                            child: Text('New'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 23),
                            child: Text('Trending'),
                        ),
                      ),
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 23),
                            child: Text('Best Seller'),
                        ),
                      )
                  ])),
            ),
            Container(
              margin: EdgeInsets.only(top: 21),
              height: 210,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 25, right: 6),
                  itemCount: newbooks.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                return Container(
                  height: 210,
                  width: 153,
                  margin: EdgeInsets.only(right: 19),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    image: DecorationImage(image: AssetImage(newbooks[index].image))
                  )
                );
              }),
            ),
            Padding(
                padding: EdgeInsets.all(25),
                child: Text("Popular ",
                  style: GoogleFonts.openSans(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                  ),
                ),
            ),
            ListView.builder(
                padding: EdgeInsets.only(right: 25, left: 25, top: 25),
                physics: BouncingScrollPhysics(),
                itemCount: populars.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(bottom: 19),
                    height: 81,
                    width: MediaQuery.of(context).size.width-50,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Container(
                          height: 81,
                          width: 62,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage(populars[index].image)
                              ),
                              color: Colors.transparent,
                          ),
                        ),
                        SizedBox(width: 21),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              populars[index].title,
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              populars[index].author,
                              style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),

                            ),
                            SizedBox(width: 5),
                            Text(
                              '\$'+populars[index].price,
                              style: GoogleFonts.openSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
              );
            })
          ],
        ),
      ),
    );
  }
}
