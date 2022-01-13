import 'package:flutter/material.dart';
import 'package:portfolio/widgets/clippers/triangular_clipper.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()..rotateZ(-90 * 3.1415927 / 180),
            child: ClipPath(
                clipper: CustomTriangleClipper(),
                child: Icon(
                  Icons.menu,
                  size: size.height * 0.045,
                ))),
        Container(
            height: size.height * 0.065,
            width: size.width * 0.15,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Padding(
                  padding: EdgeInsets.all(size.height * 0.001),
                  child: Image.asset('assets/images/me.jpg'),
                )))
      ],
    );
  }
}
