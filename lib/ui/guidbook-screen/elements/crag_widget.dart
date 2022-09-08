// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:climb_gesh_on_flutter_demo/ui/guidbook-screen/climbing_area_model.dart';
import 'package:climb_gesh_on_flutter_demo/ui/guidbook-screen/elements/crag_details_widget.dart';
import 'package:flutter/material.dart';

class CragWidget extends StatelessWidget {
  const CragWidget({
    Key? key,
    required this.crag,
  }) : super(key: key);

  static const routeName = '/crag';
  final CragModel crag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, CragDetailsWidget.routeName,
              arguments: crag);
        },
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              colorFilter:
                  const ColorFilter.mode(Colors.black12, BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage('assets/images/${crag.imageName}'),
            ),
          ),
          child: ListTile(
            leading: const Icon(
              // color: Colors.white,
              Icons.landscape_rounded,
              size: 28,
            ),
            title: Text(
              crag.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
