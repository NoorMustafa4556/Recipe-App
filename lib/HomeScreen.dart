import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myrecipeapp/utilites/Api_Hitting/APIs.dart';
import 'package:shimmer/shimmer.dart';

import 'DetailsScreen.dart';


void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    RecipesClass recipesClass = RecipesClass();

    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffEF2A39),
          title: Text("Recipe App",
              style: GoogleFonts.lilitaOne(
                  textStyle: const TextStyle(
                    fontSize: 30,
                color: Colors.white,
              ))),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: "search your recipe",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                    future: recipesClass.getRecipes(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade100,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: screenHeight * 0.15,
                                        width: double.infinity,
                                        child: Card(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: screenHeight * 0.30,
                                                  width: screenWidth * 0.30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(9.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 5,
                                                      width: 100,
                                                      color: Colors.white,
                                                    ),
                                                    Container(
                                                      height: 5,
                                                      width: 100,
                                                      color: Colors.white,
                                                    ),
                                                    Container(
                                                      height: 5,
                                                      width: 100,
                                                      color: Colors.white,
                                                    ),
                                                    Container(
                                                      height: 5,
                                                      width: 100,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      } else {
                        return ListView.builder(
                            itemCount:snapshot.data!.recipes!.length,
                            itemBuilder: (context, index) {
                              String name = snapshot.data!.recipes![index].name
                                  .toString();

                              if (searchController.text.isEmpty) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: InkWell(
                                        onTap:(){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(image: snapshot.data!.recipes![index].image.toString(),
                                              ingredients: snapshot.data!.recipes![index].ingredients.toString(),
                                              name: snapshot.data!.recipes![index].name.toString(), cookTimeMinutes: snapshot.data!.recipes![index].cookTimeMinutes.toString(), cuisine: snapshot.data!.recipes![index].cuisine.toString(), difficulty: snapshot.data!.recipes![index].difficulty.toString(), instructions: snapshot.data!.recipes![index].instructions.toString(), prepTimeMinutes: snapshot.data!.recipes![index].prepTimeMinutes.toString())));
                                        },
                                        child: SizedBox(
                                          height: screenHeight * 0.15,
                                          width: double.infinity,
                                          child: Card(
                                            color: const Color(0xffEF2A39),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(top: 8.0,left: 8,bottom: 8),
                                                  child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(20),
                                                 child: Container(
                                                      height: screenHeight * 0.30,
                                                      width: screenWidth * 0.30,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20),
                                                      ),
                                                      child: Image(
                                                        image: NetworkImage(snapshot
                                                            .data!
                                                            .recipes![index]
                                                            .image.toString()
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(top: 12.0,left: 9,),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        snapshot.data!
                                                            .recipes![index].name
                                                            .toString(),
                                                        style: GoogleFonts.abel(
                                                            textStyle:
                                                                const TextStyle(
                                                                  fontSize: 17,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                      ),

                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Cuisine",
                                                            softWrap: true,
                                                            style: GoogleFonts.abel(
                                                                textStyle: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),

                                                          Text(
                                                            "  ${snapshot
                                                                .data!
                                                                .recipes![index]
                                                                .cuisine
                                                                .toString()}",
                                                            style: GoogleFonts.abel(
                                                                textStyle: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 12,),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.star,
                                                            color: Colors.yellow,
                                                            size: 17,
                                                          ),
                                                          const Icon(
                                                            Icons.star,
                                                            color: Colors.yellow,
                                                            size: 17,
                                                          ),
                                                          const Icon(
                                                            Icons.star,
                                                            color: Colors.yellow,
                                                            size: 17,
                                                          ),
                                                          SizedBox(
                                                            width: screenWidth *
                                                                0.02,
                                                          ),

                                                          Text(
                                                            snapshot
                                                                .data!
                                                                .recipes![index]
                                                                .rating
                                                                .toString(),
                                                            style: GoogleFonts.abel(
                                                                textStyle: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                          SizedBox(
                                                            width: screenWidth *
                                                                0.25,
                                                          ),
                                                          IconButton(
                                                            color: Colors.white,

                                                            icon: Icon(
                                                              size: 24,
                                                              isFavorite
                                                                  ? Icons.favorite
                                                                  : Icons
                                                                      .favorite_border,
                                                              color: isFavorite
                                                                  ? Colors.white
                                                                  : null,
                                                            ),
                                                            onPressed:
                                                                toggleFavorite,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else if (name
                                  .toLowerCase()
                                  .contains(searchController.text.toString())) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: InkWell(
                                        onTap:(){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(image: snapshot.data!.recipes![index].image.toString(),
                                              ingredients: snapshot.data!.recipes![index].ingredients.toString(),
                                              name: snapshot.data!.recipes![index].name.toString(), cookTimeMinutes: snapshot.data!.recipes![index].cookTimeMinutes.toString(), cuisine: snapshot.data!.recipes![index].cuisine.toString(), difficulty: snapshot.data!.recipes![index].difficulty.toString(), instructions: snapshot.data!.recipes![index].instructions.toString(), prepTimeMinutes: snapshot.data!.recipes![index].prepTimeMinutes.toString())));
                                        },
                                        child: SizedBox(
                                          height: screenHeight * 0.15,
                                          width: double.infinity,
                                          child: Card(
                                            color: const Color(0xffEF2A39),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(top: 8.0,left: 8,bottom: 8),
                                                  child: Container(
                                                    height: screenHeight * 0.30,
                                                    width: screenWidth * 0.30,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                    ),
                                                    child: Image(
                                                      image: NetworkImage(snapshot
                                                          .data!
                                                          .recipes![index]
                                                          .image.toString()),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(9.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        snapshot.data!
                                                            .recipes![index].name
                                                            .toString(),
                                                        style: GoogleFonts.abel(
                                                            textStyle:
                                                            const TextStyle(
                                                                fontSize: 17,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                      ),

                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Cuisine",
                                                            softWrap: true,
                                                            style: GoogleFonts.abel(
                                                                textStyle: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                          ),

                                                          Text(
                                                            "  ${snapshot
                                                                .data!
                                                                .recipes![index]
                                                                .cuisine
                                                                .toString()}",
                                                            style: GoogleFonts.abel(
                                                                textStyle: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 1,),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.star,
                                                            color: Colors.yellow,
                                                            size: 17,
                                                          ),
                                                          const Icon(
                                                            Icons.star,
                                                            color: Colors.yellow,
                                                            size: 17,
                                                          ),
                                                          const Icon(
                                                            Icons.star,
                                                            color: Colors.yellow,
                                                            size: 17,
                                                          ),
                                                          SizedBox(
                                                            width: screenWidth *
                                                                0.02,
                                                          ),

                                                          Text(
                                                            snapshot
                                                                .data!
                                                                .recipes![0]
                                                                .rating
                                                                .toString(),
                                                            style: GoogleFonts.abel(
                                                                textStyle: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                          ),
                                                          SizedBox(
                                                            width: screenWidth *
                                                                0.25,
                                                          ),
                                                          IconButton(
                                                            color: Colors.white,

                                                            icon: Icon(
                                                              size: 24,
                                                              isFavorite
                                                                  ? Icons.favorite
                                                                  : Icons
                                                                  .favorite_border,
                                                              color: isFavorite
                                                                  ? Colors.white
                                                                  : null,
                                                            ),
                                                            onPressed:
                                                            toggleFavorite,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Container();
                              }
                            });
                      }
                    }),
              ),
            ],
          ),
        ),
      );
  }
}


class ReUseAbleRow extends StatelessWidget {
  String title,value;
   ReUseAbleRow({required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Text(
          title,
          style: GoogleFonts.abel(
              textStyle: const TextStyle(
                  color: Colors
                      .white,
                  fontWeight:
                  FontWeight
                      .bold)),
        ),
        Text(
         value,
          style: GoogleFonts.abel(
              textStyle: const TextStyle(
                  color: Colors
                      .white,
                  fontWeight:
                  FontWeight
                      .bold)),
        ),
      ],
    );
  }
}
