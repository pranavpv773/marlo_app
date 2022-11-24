import 'package:flutter/material.dart';
import 'package:marlo_app/app/modules/home/view_model/home_notifier.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Home",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Checkbox(
                value: context.watch<HomeNotifier>().checked,
                onChanged: (value) {
                  context.read<HomeNotifier>().checkBox(context);
                },
              ),
              const Text(
                'change Theme',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
