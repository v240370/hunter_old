import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunter/scr/models/category.dart';
import 'package:hunter/scr/widgets/loading.dart';
import 'package:hunter/scr/widgets/title.dart';
import 'package:transparent_image/transparent_image.dart';


class CategoryWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryWidget({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Stack(children: <Widget>[
       Container(
            width: 120,
            height: 200,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Loading(),
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(category.image),
                        radius: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomText(

                          text: category.name,
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                    ),
            ]
    )
            )
          ),
      ]
        )
    );

  }
}
