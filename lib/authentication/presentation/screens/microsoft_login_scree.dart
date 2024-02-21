// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:booky/book/presentation/screens/home_screen.dart';
import 'package:booky/core/methods/navigate_and_finish.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MicrosoftLoginScreen extends StatefulWidget {
  const MicrosoftLoginScreen({super.key});

  @override
  State<MicrosoftLoginScreen> createState() => _MicrosoftLoginScreenState();
}

class _MicrosoftLoginScreenState extends State<MicrosoftLoginScreen> {
  static final Config config = Config(
    tenant: 'fba2ab1c-6438-4673-afd5-42cf22b1a69d',
    clientId: 'd6b24623-6a85-418d-8390-13fd69b81130',
    scope: 'openid profile offline_access',
    navigatorKey: navigatorKey,
    redirectUri: "https://login.live.com/oauth20_desktop.srf",
    appBar: AppBar(),
    onPageFinished: (String url) async {
      log('onPageFinished: $url');
    },
  );
  final AadOAuth oauth = AadOAuth(config);

  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = AlertDialog(content: Text(text), actions: <Widget>[
      TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void login(BuildContext context, bool redirect) async {
    config.webUseRedirect = redirect;
    final result = await oauth.login();
    result.fold(
      (l) => showError(l.toString()),
      (r) => showMessage('Logged in successfully, your access token: $r'),
    );
    var accessToken = await oauth.getAccessToken();
    if (accessToken != null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(accessToken)));
    }
  }

  void hasCachedAccountInformation(
    BuildContext context,
  ) async {
    var hasCachedAccountInformation = await oauth.hasCachedAccountInformation;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('HasCachedAccountInformation: $hasCachedAccountInformation'),
      ),
    );
  }

  void logout(
    BuildContext context,
  ) async {
    await oauth.logout();
    showMessage('Logged out');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {
            navigateAndFinish(
              context,
              const HomeScreen(),
            );
          },
          icon: const FaIcon(
            FontAwesomeIcons.house,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            login(context, false);
          },
          icon: const Icon(
            FontAwesomeIcons.microsoft,
          ),
          label: const Text("Sign in with Microsoft"),
        ),
      ),
    );
  }
}
