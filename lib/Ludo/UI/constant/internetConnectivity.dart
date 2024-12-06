// import 'package:connectivity_plus/connectivity_plus.dart';
//
// class ConnectivityConstants {
//   static ConnectivityResult _connectionStatus = ConnectivityResult.none;
//   static final Connectivity _connectivity = Connectivity();
//
//   static Future<void> initConnectivity() async {
//     try {
//       _connectionStatus = await _connectivity.checkConnectivity();
//     } catch (e) {
//       // Handle exception if needed
//     }
//   }
//
//   static Future<void> updateConnectionStatus() async {
//     try {
//       _connectionStatus = await _connectivity.checkConnectivity();
//     } catch (e) {
//       // Handle exception if needed
//     }
//   }
//
//   static ConnectivityResult getConnectionStatus() {
//     return _connectionStatus;
//   }
// }