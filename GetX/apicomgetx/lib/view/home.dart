import 'package:apicomgetx/controller/home.dart';
import 'package:apicomgetx/controller/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  final dynamic value;
  HomeView({this.value});
  final LoginController _loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.put(HomeController());
    print('value $value');
    print(_loginController.emailTextController.text);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Dashboard',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Row(children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 9,
              child: Text(
                'Bem Vindo(a) ${_loginController.emailTextController.text}',
                style: GoogleFonts.exo2(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Obx(
              () => Flexible(
                flex: 1,
                child: Text(
                  'Pág: ${_homeController.pagAtual.value.toString()}',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Obx(
                () => (_homeController.userListData.length <= 0) && (!_homeController.loading.value)
                    ? Center(child: Text('Nenhum contéudo na lista'))
                    : ListView.builder(
                        itemCount: _homeController.userListData.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            _homeController.userListData[index].firstName,
                          ),
                          subtitle: Text(
                            _homeController.userListData[index].email,
                          ),
                          trailing: Image.network(
                            _homeController.userListData[index].avatar,
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                          leading: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                _homeController.deleteItem(index);
                              }),
                        ),
                      ),
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    splashColor: (_homeController.pagAtual.value > 1) ? Colors.grey : Colors.transparent,
                    highlightColor: (_homeController.pagAtual.value > 1) ? Colors.grey : Colors.transparent,
                    color: (_homeController.pagAtual.value == 1) ? Colors.black.withOpacity(0.2) : Colors.black,
                    icon: Icon(Icons.arrow_back_ios_outlined),
                    onPressed: () => (_homeController.pagAtual.value > 1) ? _homeController.previusPage() : null,
                  ),
                  IconButton(
                    splashColor: Colors.grey,
                    highlightColor: Colors.grey,
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () => (_homeController.pagAtual.value >= 1) ? _homeController.nextPage() : null,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
