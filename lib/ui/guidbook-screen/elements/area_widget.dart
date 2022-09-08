import 'package:climb_gesh_on_flutter_demo/ui/guidbook-screen/climbing_area_model.dart';
import 'package:climb_gesh_on_flutter_demo/ui/guidbook-screen/elements/crags_screen.dart';
import 'package:flutter/material.dart';

class AreaWidget extends StatelessWidget {
  const AreaWidget({
    Key? key,
    required this.area,
  }) : super(key: key);
  final ClimbingAreaModel area;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CragsListScreen.routeName,
            arguments: area);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage('assets/images/${area.imageName}'),
            ),
          ),
          child: Stack(children: [
            Positioned(
              left: 10,
              bottom: 15,
              child: Row(
                children: [
                  const Icon(
                    Icons.landscape_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    area.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
