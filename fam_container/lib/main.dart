import 'package:flutter/material.dart';

import 'core/injection/injection.dart';
import 'features/fam_container/presentation/home_page.dart';

void main() => mainCommon();

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FamPay());
}

class FamPay extends StatefulWidget {
  const FamPay({super.key});

  @override
  State<FamPay> createState() => _FamPayState();
}

class _FamPayState extends State<FamPay> {
  @override
  void initState() {
    registerOnAppStartUpServices();
    super.initState();
  }

  @override
  void dispose() {
    unRegisterOnAppClosedServices();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FamPay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Satoshi',
        useMaterial3: true,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
