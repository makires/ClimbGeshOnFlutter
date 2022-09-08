import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileAndLinksWidget extends StatelessWidget {
  ProfileAndLinksWidget({Key? key}) : super(key: key);

  final Uri _urlTelegram = Uri.parse('https://t.me/climbgesh');
  final Uri _urlWebSite = Uri.parse('https://ilvutikova-6be42.web.app');

  Future<void> _launchUrlTelegram() async {
    if (!await launchUrl(_urlTelegram)) {
      throw 'Could not launch $_urlTelegram';
    }
  }

  Future<void> _launchUrlWebsite() async {
    if (!await launchUrl(_urlWebSite)) {
      throw 'Could not launch $_urlWebSite';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Контакты'),
        ),
        body: Column(
          children: [
            Card(
              child: ListTile(
                onTap: _launchUrlTelegram,
                title: const Text('Написать в Телеграмм'),
                trailing: const Icon(Icons.near_me_rounded),
              ),
            ),
            Card(
              child: ListTile(
                onTap: _launchUrlWebsite,
                title: const Text('Сайт разработчика'),
                trailing: const Icon(Icons.public),
              ),
            ),
            Divider(),
            ListTile(
              onTap: _launchUrlWebsite,
              title: const Text('Версия 0.1.0'),
              // trailing: const Icon(Icons.),
            ),
            Divider(),
          ],
        ));
  }
}
