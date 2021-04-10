import 'package:presente_crud/app/domain/entities/presente.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class PresenteDetailsBack {
  BuildContext context;
  Presente presente;

  PresenteDetailsBack(this.context) {
    presente = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async {
    await canLaunch(url) ? await launch(url) : showModalError(context);
  }

  launchPhone(Function(BuildContext context) showModalError) {
    _launchApp('tel:${presente.unidade}', showModalError);
  }

  launchSMS(Function(BuildContext context) showModalError) {
    _launchApp('sms:${presente.unidade}', showModalError);
  }

  launchvalorEstimado(Function(BuildContext context) showModalError) {
    _launchApp('mailto:${presente.valorEstimado}', showModalError);
  }
}
