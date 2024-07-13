import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class CheckInternt {
  Future<bool> get isConnected;
}

class CheckInternetImpl implements CheckInternt {
  final InternetConnectionChecker internetConnectionChecker;

  CheckInternetImpl({required this.internetConnectionChecker});

  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
