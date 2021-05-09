import 'package:connectivity/connectivity.dart';

class connection{
  Future<bool> check() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return false;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
  }
  Future<String> checknet() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi) {
      return "Wifi";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return "Internet";
    }
    else if (connectivityResult == ConnectivityResult.none){
      return "No Internet";
    }
  }
}