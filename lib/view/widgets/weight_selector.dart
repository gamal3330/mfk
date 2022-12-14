import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mfk/view/widgets/value_provider.dart';

class WeightSelector extends StatelessWidget {
  const WeightSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _weightGlobal = ValueProvider().getWeight();
    ValueNotifier _weight = ValueNotifier(_weightGlobal);
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      shadowColor: Colors.black38,
      child: SizedBox(
        height: 150,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "الوزن",
              style: TextStyle(fontSize: 20 , fontFamily: 'Janna'),
            ),
            ValueListenableBuilder(
                valueListenable: _weight,
                builder: (ctx, newValue, _) {
                  return Text(
                    "${newValue.toString()} Kg",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _weight.value = _weight.value - 1;
                    ValueProvider().setWeight(_weight.value);
                  },
                  child: const Icon(Icons.remove),
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      primary: Colors.white,
                      onPrimary: const Color(0xff566ee7)),
                ),
                ElevatedButton(
                  onPressed: () {
                    _weight.value = _weight.value + 1;
                    ValueProvider().setWeight(_weight.value);
                  },
                  child: const Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      primary: Colors.white,
                      onPrimary: const Color(0xff566ee7)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}