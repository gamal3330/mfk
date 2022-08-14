import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/local.dart';

navigateAndDelete(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

navigateTo(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}

