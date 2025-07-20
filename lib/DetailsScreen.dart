
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatefulWidget {
  String name;
  String instructions;
  String difficulty;
  String prepTimeMinutes;
  String cookTimeMinutes;
  String cuisine;
  String image;
  String ingredients;



   DetailsScreen({ required this.image,required this.name,required this.cookTimeMinutes,required this.cuisine ,required  this.difficulty,required this.instructions,required this.prepTimeMinutes,required this.ingredients});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
          iconTheme:const  IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xffEF2A39),
        title: Text("Recipe Details",
            style: GoogleFonts.aladin(
                textStyle: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ))),
        centerTitle: true,
      ),
       body:  Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Stack(
             alignment: Alignment.topCenter,
             children: [
               Padding(
                 padding:  EdgeInsets.only(left:10,right:10,top: MediaQuery.of(context).size.height*.068),
                 child:  Card(
                   child:  Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       SizedBox(height: screenWidth*0.15,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(widget.name,
                           style: GoogleFonts.aladin(
                               textStyle: const TextStyle(
                                 fontSize: 30,
                                 color: Colors.black,
                               ))),


                   ],),
                       Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const Text("Preparation Time",
                             ),
                             Text("${widget.prepTimeMinutes} min",
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const Text("Cook Time",
                             ),
                             Text("${widget.cookTimeMinutes} min",
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const Text("Cuisine",
                             ),
                             Text(widget.cuisine,
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const Text("Difficulty",
                             ),
                             Text(widget.difficulty,
                             ),

                           ],
                         ),
                       ),


                     ],
                   ),
                 ),
               ),
               Padding(
                 padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.02),
                 child:  CircleAvatar(
                   radius: 50,
                   backgroundImage: NetworkImage(widget.image.toString()),
                 ),
               ),

             ],
           ),
           Padding(
             padding: const EdgeInsets.only(top: 40.0),
             child: Align(
             alignment: Alignment.bottomCenter,
               child: Container(
               color:const Color(0xffEF2A39),
                 margin: const EdgeInsets.symmetric(horizontal: 20),
                 height: 50,
                 width: double.infinity,
                 child:Center(
                   child: Text("Proceed To Next",
                       style: GoogleFonts.aladin(
                           textStyle: const TextStyle(
                             color: Colors.white,
                             fontSize: 22
                           ))),
                 ),
               ),
             ),
           )

         ],
       ),
      );
  }
}
