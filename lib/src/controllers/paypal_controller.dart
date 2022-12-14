import 'package:flutter/material.dart';
//import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/address.dart';
import '../repository/user_repository.dart' as userRepo;

class PayPalController extends ControllerMVC {
  GlobalKey<ScaffoldState> scaffoldKey;
  InAppWebViewController webView;
  String url = "";
  double progress = 0;
  Address deliveryAddress;

  PayPalController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }
  @override
  void initState() {
    final String _apiToken = 'api_token=${userRepo.currentUser.apiToken}';
    final String _userId = 'user_id=${userRepo.currentUser.id}';
    final String _deliveryAddress = 'delivery_address_id=${userRepo.deliveryAddress?.id}';
    url =
        '${GlobalConfiguration().getString('base_url')}payments/paypal/express-checkout?$_apiToken&$_userId&$_deliveryAddress';
    setState(() {});
    super.initState();
  }
}
