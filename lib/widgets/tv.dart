import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/utils/text.dart';

class TV extends StatelessWidget {
  final List Tv;
  const TV({Key? key, required this.Tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'TV',
            size: 26,
            color: Colors.white,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: Tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            Tv[index]['backdrop_path']),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: modified_text(
                              text: Tv[index]['original'],
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          Container(
                            child: modified_text(
                              text: Tv[index]['original'] ?? 'Loading',
                              color: Colors.white,
                              size: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
