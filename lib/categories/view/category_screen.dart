import 'package:flutter/material.dart';
import 'package:menz_cart_app/categories/view_model/map.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryCards(
            index: index,
          );
        });
  }
}

class CategoryCards extends StatelessWidget {
  const CategoryCards({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 10,
        shadowColor: Colors.black,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(
                categoryList[index]['backgroundImg'].toString(),
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ListTile(
              subtitle: Text(
                categoryList[index]['subTitle'].toString(),
                style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              title: Text(
                categoryList[index]['categary'].toString(),
                style: const TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List bgImages = [
  'https://png.pngtree.com/thumb_back/fh260/back_our/20190620/ourmid/pngtree-tmall-t-shirt-festival-taobao-e-commerce-home-poster-banner-image_153340.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTeH_RvF4PvMT_dQQgdI93iS5qWm-qKRcjXCW4OXbgM3ZZyuA_xGYcfGXZLDdYoKW36xw&usqp=CAU',
  'https://media.istockphoto.com/photos/texture-banner-neutral-fabric-background-panoramic-picture-id1313116746?b=1&k=20&m=1313116746&s=170667a&w=0&h=NLosrN0eX2CObND853a2f_CfutrKKEdTQGYjJ2m2ckQ=',
  'https://media.istockphoto.com/vectors/soft-silk-satin-pink-background-vector-illustration-vector-id1159776728?k=20&m=1159776728&s=612x612&w=0&h=MT8b6267MT29shxTRh1gFnzpsXdh1TwqtogTdQxAle0=',
  'https://thumbs.dreamstime.com/b/dark-purple-silk-fabric-as-background-top-view-banner-design-dark-purple-silk-fabric-as-background-top-view-banner-design-233235103.jpg',
  'https://africa-images.com/public/photos/1/z/1zkn0nxHZsA8LEQiUxCNbATWr/1zkn0nxHZsA8LEQiUxCNbATWr_smaller.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsW-cew5qB-s9E5z4Jr4TVbB8nVUgG4T35hm_PPF0udCuJD8wBFcxIDQT62y5CXbnJ1w0&usqp=CAU',
  'https://thumbs.dreamstime.com/b/set-mobile-covid-passport-urban-holiday-accessories-background-232565286.jpg',
];