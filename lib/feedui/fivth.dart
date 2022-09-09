import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_flutter/text_description.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FivthFeedUI extends StatelessWidget {

  late String profileUrl,profileName,title,photoUrl;
  FivthFeedUI(this.profileUrl,this.profileName,this.title,this.photoUrl);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 10),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(140),
                child: Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(140)),
                  height: 58,
                  width: 60,
                  child: Stack(
                    children: <Widget>[
                      Container(
                          height: 78,
                          width: 74,
                          margin: const EdgeInsets.only(
                              left: 0.0, right: 0, top: 0, bottom: 0),
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(140)),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              // 'https://bloximages.newyork1.vip.townnews.com/roanoke.com/content/tncms/assets/v3/editorial/d/da/ddac1f83-ffae-5e84-a8e5-e71f8ff18119/5f3176da21b5c.image.jpg?crop=650%2C650%2C175%2C0&resize=1200%2C1200&order=crop%2Cresize',
                              this.profileUrl,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 13),
                child: Text(
                  // 'Sound Byte',
                  this.profileName,
                  style: GoogleFonts.lato(
                      color: Colors.grey[700],
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  '1 hr',
                  style: GoogleFonts.lato(
                      color: Colors.grey[500],
                      fontSize: 15,
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ]),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          // child: Text(
          //   // 'Was great meeting up with Anna Ferguson and Dave Bishop at the breakfast talk!',
          //   this.title,
          //   style: GoogleFonts.lato(
          //       color: Colors.grey[600],
          //       fontSize: 15,
          //       letterSpacing: 1,
          //       fontWeight: FontWeight.normal),
          //   textAlign: TextAlign.justify,
          // ),
          child: new DescriptionTextWidget(text: this.title),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 18.0, right: 18, top: 15),
        //   child: Material(
        //       borderRadius: BorderRadius.all(Radius.circular(40)),
        //       elevation: 6,
        //       child: ClipRRect(
        //         borderRadius: BorderRadius.all(
        //           Radius.circular(10),
        //         ),
        //         child: Image.network(
        //             // 'https://images.pexels.com/photos/2387873/pexels-photo-2387873.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
        //             this.photoUrl),
        //       )),
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18, top: 15),
          child: Material(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              elevation: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: this.photoUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    width: 30,
                      height: 30,
                      child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              )),
        ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(top: 2, left: 28.0),
        //       child: Row(
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(right: 5.0),
        //             child: Image.asset(
        //               'assets/images/like.png',
        //               height: 35,
        //             ),
        //           ),
        //           // Text(
        //           //   '45',
        //           //   style: GoogleFonts.averageSans(
        //           //       color: Colors.grey[700],
        //           //       fontSize: 22,
        //           //       letterSpacing: 1,
        //           //       fontWeight: FontWeight.normal),
        //           // ),
        //         ],
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(top: 18, right: 22.0),
        //       child: Row(
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(right: 1.0),
        //             child: Image.network(
        //               'https://www.searchpng.com/wp-content/uploads/2019/02/Comment-Icon-PNG.png',
        //               height: 40,
        //             ),
        //           ),
        //           Text(
        //             '45',
        //             style: GoogleFonts.averageSans(
        //                 color: Colors.grey[700],
        //                 fontSize: 22,
        //                 letterSpacing: 1,
        //                 fontWeight: FontWeight.normal),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2, left: 28.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Image.asset(
                      'assets/images/like.png',
                      height: 35,
                    ),
                  ),
                  Text(
                    '45',
                    style: GoogleFonts.averageSans(
                        color: Colors.grey[700],
                        fontSize: 22,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 4, right: 22.0),
            //   child: Row(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(right: 1.0),
            //         child: Image.network(
            //           //'https://www.searchpng.com/wp-content/uploads/2019/02/Comment-Icon-PNG.png',
            //           'https://www.pngitem.com/middle/bmTibR_comment-logo-png-comment-icon-transparent-png',
            //           height: 40,
            //         ),
            //       ),
            //       Text(
            //         '45',
            //         style: GoogleFonts.averageSans(
            //             color: Colors.grey[700],
            //             fontSize: 22,
            //             letterSpacing: 1,
            //             fontWeight: FontWeight.normal),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 2, left: 28.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Image.asset(
                      'assets/images/comment_icon.png',
                      height: 35,
                    ),
                  ),
                  Text(
                    '45',
                    style: GoogleFonts.averageSans(
                        color: Colors.grey[700],
                        fontSize: 22,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),

      ],
    );
  }
}
