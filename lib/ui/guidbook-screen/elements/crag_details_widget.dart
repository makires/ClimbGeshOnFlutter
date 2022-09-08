import 'package:climb_gesh_on_flutter_demo/ui/guidbook-screen/climbing_area_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CragDetailsWidget extends StatelessWidget {
  const CragDetailsWidget({
    Key? key,
    required this.crag,
  }) : super(key: key);
  static const routeName = '/crag_details';
  final CragModel crag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(crag.name),
      ),
      body: Column(children: [
        Expanded(
          flex: 3,
          // height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: crag.imagesRoutes.isEmpty
                ? [
                    SizedBox(
                      width: 100,
                    ),
                    Center(
                      child: Container(
                        width: 200,
                        child: Text(
                            'Для данной скалы линии маршрутов нарисованы в печатном гайдбуке. Пройдите в предыдущий раздел и посмотрите их в pdf-файле. '),
                      ),
                    )
                  ]
                : crag.imagesRoutes
                    .map(
                      (sideCrag) => Card(
                        child: Image(
                          image: AssetImage('assets/images/$sideCrag'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
        Expanded(
          flex: 3,
          // width: 100,
          // height: 300,
          child: ListView.builder(
              itemCount: crag.sortedRoutes.length,
              itemBuilder: ((context, index) {
                return SizedBox(
                  height: 60,
                  child: Card(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 40,
                            child: crag.routes[index].number == 0
                                ? Text('⦿')
                                : Text('${crag.routes[index].number}')),
                        SizedBox(
                            width: 180, child: Text(crag.routes[index].name)),
                        SizedBox(
                            width: 50, child: Text(crag.routes[index].grade)),
                        Text('🔩 ${crag.routes[index].bolts}'),
                      ],
                    ),
                  )),
                );
              })),
        ),
      ]),
    );
  }
}
