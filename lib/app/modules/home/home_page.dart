import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/values/colors.dart';
import 'package:pemantauan_ternak/app/modules/home/home_controller.dart';
import 'package:pemantauan_ternak/app/modules/home/local_widgets/card_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
        builder: (_) => Scaffold(
              backgroundColor: ColorsPallete.LIGHT,
              appBar: AppBar(
                title: Text("Pemantauan Ternak"),
                elevation: 0,
              ),
              body: Stack(
                children: <Widget>[
                  Container(
                    height: 50,
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                  SafeArea(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Obx(
                              () => cardName(
                                  nama: _.nama,
                                  role: _.role,
                                  gambar: _.gambar.value.toString()),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Flexible(
                                child: GridView.count(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 15,
                                    children: List.generate(
                                        _.menus.length,
                                        (i) => CardMenu(
                                            color: _.menus[i]['color'],
                                            image: _.menus[i]['image'],
                                            title: _.menus[i]['title'],
                                            page: _.menus[i]['page']))))
                          ],
                        )),
                  )
                ],
              ),
            ));
  }

  cardName(
      {@required String nama, @required String role, @required String gambar}) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            (gambar.isNotEmpty)
                ? CircleAvatar(
                    backgroundImage: NetworkImage(gambar),
                  )
                : CircleAvatar(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nama,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  role,
                  style: TextStyle(fontSize: 14),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
