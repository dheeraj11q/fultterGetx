import 'dart:async';
import 'package:connectivity/connectivity.dart';

class Internet {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectionSubscription;
  String _connectionStatus = "";
}
