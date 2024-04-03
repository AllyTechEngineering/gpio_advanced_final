import 'package:flutter/material.dart';
import 'package:gpio_advanced_final/src/gpio_advanced.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GpioAdvanced gpioAdvanced = GpioAdvanced();
  @override
  void initState() {
    gpioAdvanced.initGpio16Output();
    super.initState();
  }

  @override
  void dispose() {
    gpioAdvanced.disposeGpio16();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPIO Advanced'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('GPIO Advanced Controls'),
            const SizedBox(
              height: 20.0,
            ),
            getElevatedButtonLedOn(),
            const SizedBox(
              height: 20.0,
            ),
            getElevatedButtonLedOff(),
          ],
        ),
      ),
    );
  }

  Widget getElevatedButtonLedOn() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          gpioAdvanced.getGpio16Output(true);
        });
      },
      child: const Text('GPIO16 High Led On'),
    );
  }

  Widget getElevatedButtonLedOff() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          gpioAdvanced.getGpio16Output(false);
        });
      },
      child: const Text('GPIO16 Low Led Off'),
    );
  }
}
