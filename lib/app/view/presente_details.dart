import 'package:presente_crud/app/domain/entities/presente.dart';
import 'package:presente_crud/app/view/presente_details_back.dart';
import 'package:flutter/material.dart';

class PresenteDetails extends StatelessWidget {
  showModalError(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Alerta!'),
      content: Text('Não foi possível encontrar um APP compatível.'),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    var _back = PresenteDetailsBack(context);
    Presente presente = _back.presente;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        var radius = width / 3;
        // var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              (Uri.tryParse(presente.urlPresente).isAbsolute)
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(presente.urlPresente),
                      radius: radius,
                    )
                  : CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: width / 2,
                      ),
                      radius: radius,
                    ),
              Center(
                child: Text(
                  '${presente.nome}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('unidade:'),
                  subtitle: Text('${presente.unidade}'),
                  trailing: Container(
                    width: width / 4,
                    child: Row(children: [
                      IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.message),
                          onPressed: () {
                            _back.launchSMS(showModalError);
                          }),
                      IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.phone),
                          onPressed: () {
                            _back.launchPhone(showModalError);
                          })
                    ]),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('E-mail:'),
                  onTap: () {
                    _back.launchvalorEstimado(showModalError);
                  },
                  subtitle: Text('${presente.valorEstimado}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}
