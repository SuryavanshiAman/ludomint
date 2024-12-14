// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:ludomint/Ludo/UI/Homescreen/api/apiprofile.dart';
// import 'package:provider/provider.dart';
// import 'audio.dart';
// import 'constants.dart';
// import 'ludo_player.dart';
// import 'view_model/firebase_view_model.dart';
//
// class LudoProvider extends ChangeNotifier {
//   bool _isMoving = false;
//   bool _stopMoving = false;
//   bool _isPlayer1Turn = true;
//   bool _status = false;
//   bool get status => _status;
//   bool get isPlayer1Turn => _isPlayer1Turn;
//   int _playerQuantity = 2;
//   int get playerQuantity => _playerQuantity;
//   void setPlayerQuantity(int value) {
//     _playerQuantity = value;
//     notifyListeners();
//   }
//
//   LudoGameState _gameState = LudoGameState.throwDice;
//   LudoGameState get gameState => _gameState;
//
//   LudoPlayerType _currentTurn = LudoPlayerType.blue;
//
//   LudoPlayer get currentPlayer => player(_currentTurn);
//
//   int _diceResult = 0;
//   int? _previousDiceResult;
//
//   int _totalPoints = 0;
//   int get totalPoints => _totalPoints;
//
//
//   int get diceResult {
//     if (_diceResult < 1) {
//       return 1;
//     } else {
//       if (_diceResult > 6) {
//         return 6;
//       } else {
//         return _diceResult;
//       }
//     }
//   }
//
//   int? get previousDiceResult => _previousDiceResult;
//   String _prizePool = "0";
//   String get prizePool => _prizePool;
//   void setPrizePool(String value) {
//     _prizePool = value;
//     notifyListeners();
//   }
//
//   bool _diceStarted = false;
//   bool get diceStarted => _diceStarted;
//   int _fieldKey = 1;
//   int get fieldKey => _fieldKey;
//   setFieldKey(int value) {
//     if (value == 0) {
//       _fieldKey = value;
//     } else {
//       _fieldKey = value - 1;
//     }
//     notifyListeners();
//   }
//
//
//   void switchPlayerTurn() {
//     _isPlayer1Turn = !_isPlayer1Turn;
//     notifyListeners();
//   }
//
//   final List<LudoPlayer> players = [
//     LudoPlayer(LudoPlayerType.blue),
//     LudoPlayer(LudoPlayerType.red),
//     LudoPlayer(LudoPlayerType.green),
//     LudoPlayer(LudoPlayerType.yellow),
//   ];
//
//   final List<LudoPlayerType> winners = [];
//
//   LudoPlayer player(LudoPlayerType type) => players.firstWhere((element) => element.type == type);
//
//   void throwDice() async {
//     if (_gameState != LudoGameState.throwDice) return;
//     _diceStarted = true;
//     notifyListeners();
//     Audio.rollDice();
//
//     LudoPlayer currentPlayer = player(_currentTurn);
//
//     if (winners.contains(currentPlayer.type)) {
//       nextTurn();
//       return;
//     }
//
//     currentPlayer.highlightAllPawns(false);
//
//     await Future.delayed(const Duration(seconds: 1));
//     _diceStarted = false;
//     _previousDiceResult = _diceResult;
//     var random = Random();
//     _diceResult = random.nextBool() ? 5  : random.nextInt(6) + 1; //Random between 1 - 6
//     notifyListeners();
//
//     // Move this line here to avoid adding _diceResult twice
//     _totalPoints += (_previousDiceResult ?? 0);
//
//     if (diceResult == 6) {
//       currentPlayer.highlightAllPawns();
//       _gameState = LudoGameState.pickPawn;
//       notifyListeners();
//       _totalPoints += _diceResult; // Add only when diceResult is 6
//     } else {
//       if (currentPlayer.pawnInsideCount == 4) {
//         return nextTurn();
//       } else {
//         currentPlayer.highlightOutside();
//         _gameState = LudoGameState.pickPawn;
//         notifyListeners();
//       }
//     }
//
//     for (var i = 0; i < currentPlayer.pawns.length; i++) {
//       var pawn = currentPlayer.pawns[i];
//       if ((pawn.step + diceResult) > currentPlayer.path.length - 1) {
//         currentPlayer.highlightPawn(i, false);
//       }
//     }
//
//     var moveablePawn = currentPlayer.pawns.where((e) => e.highlight).toList();
//     if (moveablePawn.length > 1) {
//       var biggestStep = moveablePawn.map((e) => e.step).reduce(max);
//       if (moveablePawn.every((element) => element.step == biggestStep)) {
//         var random = 1 + Random().nextInt(moveablePawn.length - 1);
//         if (moveablePawn[random].step == -1) {
//           var thePawn = moveablePawn[random];
//           move(thePawn.type, thePawn.index, (thePawn.step + 1) + 1);
//           return;
//         } else {
//           var thePawn = moveablePawn[random];
//           move(thePawn.type, thePawn.index, (thePawn.step + 1) + diceResult);
//           return;
//         }
//       }
//     }
//
//     if (currentPlayer.pawns.every((element) => !element.highlight)) {
//       if (diceResult == 6) {
//         _gameState = LudoGameState.throwDice;
//       } else {
//         nextTurn();
//         return;
//       }
//     }
//
//     if (currentPlayer.pawns.where((element) => element.highlight).length == 1) {
//       var index = currentPlayer.pawns.indexWhere((element) => element.highlight);
//       move(currentPlayer.type, index, (currentPlayer.pawns[index].step + 1) + diceResult);
//     }
//   }
//
//   void throwDicee() async {
//     if (_gameState != LudoGameState.throwDice || isPlayer1Turn) return;
//
//     _diceStarted = true;
//     notifyListeners();
//     Audio.rollDice();
//
//     LudoPlayer currentPlayer = player(_currentTurn);
//
//     if (winners.contains(currentPlayer.type)) {
//       nextTurn();
//       return;
//     }
//
//     currentPlayer.highlightAllPawns(false);
//
//     // Simulate the dice rolling delay
//     Future.delayed(const Duration(seconds: 6), () {
//       _diceStarted = false;
//       _previousDiceResult = _diceResult;
//       var random = Random();
//       _diceResult = random.nextBool() ? 5 : random.nextInt(6) + 1; // Random between 1 - 6
//       notifyListeners();
//
//       // Move this line here to avoid adding _diceResult twice
//       _totalPoints += (_previousDiceResult ?? 0);
//
//       if (diceResult == 6) {
//         currentPlayer.highlightAllPawns();
//         _gameState = LudoGameState.pickPawn;
//         notifyListeners();
//         _totalPoints += _diceResult; // Add only when diceResult is 6
//       } else {
//         if (currentPlayer.pawnInsideCount == 4) {
//           return nextTurn();
//         } else {
//           currentPlayer.highlightOutside();
//           _gameState = LudoGameState.pickPawn;
//           notifyListeners();
//         }
//       }
//
//       for (var i = 0; i < currentPlayer.pawns.length; i++) {
//         var pawn = currentPlayer.pawns[i];
//         if ((pawn.step + diceResult) > currentPlayer.path.length - 1) {
//           currentPlayer.highlightPawn(i, false);
//         }
//       }
//
//       var moveablePawn = currentPlayer.pawns.where((e) => e.highlight).toList();
//       if (moveablePawn.length > 1) {
//         var biggestStep = moveablePawn.map((e) => e.step).reduce(max);
//         if (moveablePawn.every((element) => element.step == biggestStep)) {
//           var random = 1 + Random().nextInt(moveablePawn.length - 1);
//           if (moveablePawn[random].step == -1) {
//             var thePawn = moveablePawn[random];
//             move(thePawn.type, thePawn.index, (thePawn.step + 1) + 1);
//             return;
//           } else {
//             var thePawn = moveablePawn[random];
//             move(thePawn.type, thePawn.index, (thePawn.step + 1) + diceResult);
//             return;
//           }
//         }
//       }
//
//       if (currentPlayer.pawns.every((element) => !element.highlight)) {
//         if (diceResult == 6) {
//           _gameState = LudoGameState.throwDice;
//         } else {
//           nextTurn();
//           return;
//         }
//       }
//
//       if (currentPlayer.pawns.where((element) => element.highlight).length == 1) {
//         var index = currentPlayer.pawns.indexWhere((element) => element.highlight);
//         move(currentPlayer.type, index, (currentPlayer.pawns[index].step + 1) + diceResult);
//       }
//     });
//   }
//
//   void move(LudoPlayerType type, int index, int step) async {
//     if (_isMoving) return;
//     _isMoving = true;
//     _gameState = LudoGameState.moving;
//
//     LudoPlayer currentPlayer = player(type);
//
//     currentPlayer.highlightAllPawns(false);
//
//     for (int i = currentPlayer.pawns[index].step; i < step; i++) {
//       if (_stopMoving) break;
//       if (currentPlayer.pawns[index].step == i) continue;
//       currentPlayer.movePawn(index, i);
//       await Audio.playMove();
//       notifyListeners();
//       if (_stopMoving) break;
//     }
//     if (checkToKill(type, index, step, currentPlayer.path)) {
//       _gameState = LudoGameState.throwDice;
//       _isMoving = false;
//       Audio.playKill();
//       notifyListeners();
//       return;
//     }
//
//     validateWin(type);
//
//     if (diceResult == 6) {
//       _gameState = LudoGameState.throwDice;
//       notifyListeners();
//     } else {
//       nextTurn();
//       notifyListeners();
//     }
//     _isMoving = false;
//   }
//
//   bool checkToKill(LudoPlayerType type, int index, int step, List<List<double>> path) {
//     bool killSomeone = false;
//     for (int i = 0; i < 4; i++) {
//       var redElement = player(LudoPlayerType.red).pawns[i];
//       var yellowElement = player(LudoPlayerType.yellow).pawns[i];
//
//       if ((yellowElement.step > -1 && !LudoPath.safeArea.map((e) => e.toString()).contains(player(LudoPlayerType.yellow).path[yellowElement.step].toString())) && type != LudoPlayerType.yellow) {
//         if (player(LudoPlayerType.yellow).path[yellowElement.step].toString() == path[step - 1].toString()) {
//           killSomeone = true;
//           player(LudoPlayerType.yellow).movePawn(i, -1);
//           notifyListeners();
//         }
//       }
//
//       if ((redElement.step > -1 && !LudoPath.safeArea.map((e) => e.toString()).contains(player(LudoPlayerType.red).path[redElement.step].toString())) && type != LudoPlayerType.red) {
//         if (player(LudoPlayerType.red).path[redElement.step].toString() == path[step - 1].toString()) {
//           killSomeone = true;
//           player(LudoPlayerType.red).movePawn(i, -1);
//           notifyListeners();
//         }
//       }
//     }
//     return killSomeone;
//   }
//
//   void validateWin(LudoPlayerType color) {
//     if (winners.map((e) => e.name).contains(color.name)) return;
//     if (player(color).pawns.map((e) => e.step).every((element) => element == player(color).path.length - 1)) {
//       winners.add(color);
//       notifyListeners();
//     }
//
//     if (winners.length == 3) {
//       _gameState = LudoGameState.finish;
//     }
//   }
//
//   void nextTurn() {
//     switch (_currentTurn) {
//       case LudoPlayerType.blue:
//         _currentTurn = LudoPlayerType.red;
//         break;
//       case LudoPlayerType.red:
//         _currentTurn = LudoPlayerType.green;
//         break;
//       case LudoPlayerType.green:
//         _currentTurn = LudoPlayerType.yellow;
//         break;
//       case LudoPlayerType.yellow:
//         _currentTurn = LudoPlayerType.blue;
//         break;
//     }
//
//     if (winners.contains(_currentTurn)) return nextTurn();
//     _gameState = LudoGameState.throwDice;
//     notifyListeners();
//   }
//   String? _roomCode;
//
//   String? get roomCode => _roomCode;
//
//   // Method to set the room code
//   void setRoomCode(String roomCode) {
//     _roomCode = roomCode;
//     notifyListeners();
//   }
//   void createRoom(context) async {
//     final firebaseViewModel = Provider.of<FirebaseViewModel>(context, listen: false);
//     FirebaseFirestore fireStore = FirebaseFirestore.instance;
//     CollectionReference ludoCollection = fireStore.collection('ludo');
//     final playerColors = players;
//     String roomCode = DateTime.now().millisecondsSinceEpoch.toString(); // Unique room code
//
//     bool isRoomCreated = false;
//
//     while (!isRoomCreated) {
//       DocumentSnapshot documentSnapshot = await ludoCollection.doc(roomCode).get();
//
//       if (!documentSnapshot.exists) {
//         print("Creating new room with code $roomCode");
//         Map<String, dynamic> jsonData = {
//           "roomCode": roomCode,
//           "1": '{"name":"$username","id":"$RndId","image":"$image","number":"$mobilenumber","color":"${playerColors[0].type}"}',
//           "3": '', // Second player is empty initially
//           "isLocked": false,
//           "playerQuantity": 2, // Only 2 players are allowed
//           "prizePool": prizePool
//         };
//
//         await ludoCollection.doc(roomCode).set(jsonData);
//         setRoomCode(roomCode); // Save the room code in the view model
//         setFieldKey(1); // Set field for first player
//         isRoomCreated = true;
//       } else {
//         print("Room code already exists, generating a new one...");
//         // Regenerate room code if it already exists
//         roomCode = DateTime.now().millisecondsSinceEpoch.toString();
//       }
//     }
//     if (isRoomCreated) {
//       print("vvvvv");
//       firebaseViewModel.setTable(int.parse(roomCode.toString()));
//     }
//   }
//
//   joinRoom(context, String roomCode) async {
//     // final profile = Provider.of<ProfileViewModel>(context, listen: false).profileResponse;
//     final firebaseViewModel = Provider.of<FirebaseViewModel>(context, listen: false);
//     FirebaseFirestore fireStore = FirebaseFirestore.instance;
//     CollectionReference ludoCollection = fireStore.collection('ludo');
//     final playerColors = players;
//     DocumentSnapshot documentSnapshot = await ludoCollection.doc(roomCode).get();
//
//     if (!documentSnapshot.exists) {
//       print("Room with code $roomCode does not exist.");
//       return;
//     }
//
//     Map<String, dynamic>? existingData = documentSnapshot.data() as Map<String, dynamic>?;
//
//     if (existingData != null) {
//       final List<bool> slotsFilled = [
//         existingData["1"] != null && existingData["1"] != '',
//         existingData["3"] != null && existingData["3"] != ''
//       ];
//
//       if (slotsFilled.every((isFilled) => isFilled)) {
//         print("Room is full. Cannot join.");
//         return;
//       }
//
//       // If slot 1 is empty, join as player 1
//       if (!slotsFilled[0]) {
//         await ludoCollection.doc(roomCode).update({
//           "1": '{"name":"$username","id":"$RndId","image":"$image","number":"$mobilenumber","color":"${playerColors[0].type}"}'
//         });
//         setFieldKey(1);
//         print("Player joined as Player 1 in room $roomCode");
//         setRoomCode(roomCode); // Save the room code in the view model
//       }
//       // If slot 2 is empty, join as player 2
//       else if (!slotsFilled[1]) {
//         await ludoCollection.doc(roomCode).update({
//           "3": '{"name":"$username","id":"$RndId","image":"$image","number":"$mobilenumber","color":"${playerColors[2].type}"}'
//         });
//         setFieldKey(3);
//         print("Player joined as Player 2 in room $roomCode");
//         setRoomCode(roomCode); // Save the room code in the view model
//       }
//       firebaseViewModel.setTable(int.parse(roomCode.toString()));
//     }
//   }
//   @override
//   void dispose() {
//     _stopMoving = true;
//     super.dispose();
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ludomint/Ludo/UI/constant/utilll.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Ludo/UI/Homescreen/api/apiprofile.dart';
import 'Ludo/UI/constant/api constant.dart';
import 'constants.dart';

import 'ludo_player.dart';

import 'view_model/firebase_view_model.dart';
import 'package:http/http.dart' as http;

class LudoProvider with ChangeNotifier {
  bool _isMoving = false;
  bool _status = false;
  bool get status => _status;
  // int _playerQuantity = 0;
  int _playerQuantity = 2;
  int _documentId = 1;
  int get documentId => _documentId;
  bool _stopDice = false;
  bool get isMoving => _isMoving;
  bool get stopDice => _stopDice;
  int get playerQuantity => _playerQuantity;
  String _tournamentId = "0";
  String get tournamentId => _tournamentId;
  bool _isConnected = true;
  bool get isConnected => _isConnected;
  int _selectedAvatarIndex = 0;
  String? _selectedAvatarImage;
   int _entryAmount=0;
   int get entryAmount=>_entryAmount;

  int get selectedAvatarIndex => _selectedAvatarIndex;
  String? get selectedAvatarImage => _selectedAvatarImage;
  String? _base64Image;
  void setAvatar(int index, String imagePath) async {
    _selectedAvatarIndex = index;
    _selectedAvatarImage = imagePath;
    ByteData byteData = await rootBundle.load(_selectedAvatarImage!);
    final bytes = byteData.buffer.asUint8List();
    _base64Image = base64Encode(bytes);
    notifyListeners();
  }

  File? _image;
  final picker = ImagePicker();

  File? get image => _image;
  String? get base64Image => _base64Image;
  void setImage(File value) {
    _image = value;
    notifyListeners();
  }
void setEntryAmount(int value){
  _entryAmount=value;
  notifyListeners();
}
  // Function to pick an image and encode it to base64
  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _base64Image = base64Encode(_image!.readAsBytesSync());
      _selectedAvatarImage = null;
      notifyListeners();
    }
  }

  void updateDocumentId(int newId) {
    _documentId = newId;
    notifyListeners();
  }

  void setStatus(bool value) {
    _status = value;
    notifyListeners();
  }

  void setConnection(bool value) {
    _isConnected = value;
    notifyListeners();
  }

  String _prizePool = "0";
  String get prizePool => _prizePool;
  int _fieldKey = 1;
  int get fieldKey => _fieldKey;
  setFieldKey(int value) {
    if (value == 0) {
      _fieldKey = value;
    } else {
      _fieldKey = value - 1;
    }
    notifyListeners();
  }

  LudoGameState _gameState = LudoGameState.throwDice;
  int _diceResult = 1;
  bool _diceStarted = false;
  LudoPlayerType _currentTurn = LudoPlayerType.blue;
  DocumentReference<Map<String, dynamic>>? gameDoc;

  int _currentDiceIndex = -1;
  int get currentDiceIndex => _currentDiceIndex;

  void setCurrentDiceIndex(int val) {
    _currentDiceIndex = val;
    notifyListeners();
  }

  void setTournamentID(String value) {
    _tournamentId = value;
    notifyListeners();
  }

  void setPrizePool(String value) {
    _prizePool = value;
    notifyListeners();
  }

  List<LudoPlayer> players = [
    LudoPlayer(LudoPlayerType.blue),
    LudoPlayer(LudoPlayerType.red),
    LudoPlayer(LudoPlayerType.green),
    LudoPlayer(LudoPlayerType.yellow),
  ];


  List<dynamic> _playerDataList = [];

  List<dynamic> get playerDataList => _playerDataList;
  // PlayerData? firstPlace;
  // PlayerData? secondPlace;
  // PlayerData? thirdPlace;
  // PlayerData? fourthPlace;

  void setPlayerQuantity(int value) {
    _playerQuantity = value;
    notifyListeners();
  }
  // void setTopFourPlayers(List<PlayerData> playerDataList) async {
  //   playerDataList
  //       .sort((a, b) => int.parse(b.score).compareTo(int.parse(a.score)));
  //
  //   firstPlace = playerDataList.isNotEmpty ? playerDataList[0] : null;
  //   secondPlace = playerDataList.length > 1 ? playerDataList[1] : null;
  //   thirdPlace = playerDataList.length > 2 ? playerDataList[2] : null;
  //   fourthPlace = playerDataList.length > 3 ? playerDataList[3] : null;
  //
  //   notifyListeners();
  // }

  void setPlayerDataFromJson(dynamic jsonData) {
    _playerDataList = List.from(jsonData);
    notifyListeners();
  }

  final List<LudoPlayerType> winners = [];

  void listenToGameUpdates(context) {
    print("gggggg");
    final firebaseViewModel =
    Provider.of<FirebaseViewModel>(context, listen: false).table.toString();
    gameDoc =
        FirebaseFirestore.instance.collection('ludo').doc(firebaseViewModel);
    gameDoc!.snapshots().listen((snapshot) {
      if (snapshot.exists) {
        var data = snapshot.data();
        if (data != null) {
          _diceResult = data['diceResult'] ?? 1;
          _currentTurn = LudoPlayerType.values[data['currentTurn'] ?? 0];
          _currentDiceIndex = data['currentTurn'] ?? 0;
          _gameState = LudoGameState.values[data['gameState'] ?? 0];
          var playersData = data['players'];
          if (playersData != null) {
            for (var playerType in LudoPlayerType.values) {
              var pawnsData = playersData[playerType.toString()];
              if (pawnsData != null) {
                for (int i = 0;
                i < players[playerType.index].pawns.length;
                i++) {
                  players[playerType.index].pawns[i].step = pawnsData[i];
                }
              }
            }
          }
          notifyListeners();
        }
      }
    });
  }

  dynamic _myData;
  dynamic get myData => _myData;
  int _myPosition = 0;
  int get myPosition => _myPosition;
  setMyData(profile) {
    _myData = _playerDataList.firstWhere(
          (player) => player['name']['id'] == profile?.data?.id.toString(),
      orElse: () => null,
    );
    notifyListeners();
  }

  setMyPosition(profile) {
    _myPosition = playerDataList.indexWhere(
            (player) => player['name']['id'] == profile?.data?.id.toString()) +
        1;
  }

  LudoPlayer get currentPlayer => player(_currentTurn);
  bool get diceStarted => _diceStarted;
  int get diceResult => _diceResult;
  LudoGameState get gameState => _gameState;
  LudoPlayer player(LudoPlayerType type) =>
      players.firstWhere((element) => element.type == type);
  void throwDice(context) async {
    _diceStarted = true;
    _stopDice = true;
    notifyListeners();
    final firebaseViewModel =
    Provider.of<FirebaseViewModel>(context, listen: false).table.toString();
    if (gameDoc == null) {
      gameDoc =
          FirebaseFirestore.instance.collection('ludo').doc(firebaseViewModel);
    } else {
      if (kDebugMode) {
        print("skdkdkd");
      }
    }
    _diceResult = Random().nextInt(6) + 1;
    gameDoc!.update({
      'diceResult': _diceResult,
      'currentTurn': _currentTurn.index,
      'gameState': LudoGameState.pickPawn.index,
    });
    listenToGameUpdates(context);

    Future.delayed(const Duration(milliseconds: 500), () {
      _diceStarted = false;
      notifyListeners();
    });

    if (_diceResult != 6) {
      if (currentPlayer.pawnInsideCount == 4) {
        await Future.delayed(const Duration(seconds: 1));
        nextTurn();
      } else {
        currentPlayer.highlightOutside();
        _gameState = LudoGameState.pickPawn;
        notifyListeners();
      }
    } else {
      // When 6 is rolled, the player gets another chance
      currentPlayer.highlightOutside();
      _gameState = LudoGameState.pickPawn;
      notifyListeners();
    }
    for (var i = 0; i < currentPlayer.pawns.length; i++) {
      var pawn = currentPlayer.pawns[i];
      if ((pawn.step + diceResult) > currentPlayer.path.length - 1) {
        currentPlayer.highlightPawn(i, false);
      }
    }
    if (currentPlayer.pawns.every((element) => !element.highlight)) {
      if (diceResult == 6) {
        _gameState = LudoGameState.throwDice;
      } else {
        nextTurn();
        return;
      }
    }
  }

  void move(context, LudoPlayerType type, int index, int step) async {
    if (_isMoving) return;
    _isMoving = true;
    _stopDice = false;
    _gameState = LudoGameState.moving;
    LudoPlayer currentPlayer = player(type);
    currentPlayer.highlightAllPawns(false);
    for (int i = currentPlayer.pawns[index].step; i <= step; i++) {
      currentPlayer.movePawn(index, i);

      gameDoc?.update({
        '${type.toString().split('.').last}PawnPosition$index': i,
      });
      await Future.delayed(const Duration(milliseconds: 320));
      notifyListeners();
    }
    if (await checkToKill(context, type, index, step, currentPlayer.path)) {
      _gameState = LudoGameState.throwDice;
      _isMoving = false;
      notifyListeners();
      return;
    }

    validateWin(type);
    nextTurn();
    _isMoving = false;
    notifyListeners();
  }

  Future<bool> checkToKill(context, LudoPlayerType type, int index, int step,
      List<List<double>> path) async {
    bool killSomeone = false;
    final firebaseViewModel =
    Provider.of<FirebaseViewModel>(context, listen: false).table.toString();
    for (var opponentType in LudoPlayerType.values.where((t) => t != type)) {
      for (int i = 0; i < 4; i++) {
        var opponentPawn = player(opponentType).pawns[i];

        if (opponentPawn.step > 0) {
          bool isInSafeArea = LudoPath.safeArea
              .map((e) => e.toString())
              .contains(
              player(opponentType).path[opponentPawn.step].toString());

          if (!isInSafeArea) {
            if (player(opponentType).path[opponentPawn.step].toString() ==
                path[step].toString()) {
              killSomeone = true;

              Future.microtask(() async {
                for (int j = opponentPawn.step; j >= 0; j--) {
                  await Future.delayed(const Duration(
                      milliseconds:
                      50)); // Reduce the delay for faster movement
                  opponentPawn.step = j;
                  FirebaseFirestore.instance
                      .collection('ludo')
                      .doc(firebaseViewModel)
                      .update({
                    '${opponentType.toString().split('.').last}PawnPosition$i':
                    opponentPawn.step,
                  });
                  notifyListeners();
                }
              });

              notifyListeners();

              if (kDebugMode) {
                print(
                    'Pawn of $opponentType at index $i was killed by player $type at step $step.');
              }
              if (kDebugMode) {
                print('Opponent pawn reset to step: ${opponentPawn.step}');
              }
            }
          }
        }
      }
    }

    return killSomeone;
  }

  Future<void> validateWin(LudoPlayerType color) async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId") ?? '0';
    if (winners.contains(color)) return;
    if (player(color)
        .pawns
        .every((pawn) => pawn.step == player(color).path.length - 1)) {
      winners.add(color);
      FirebaseFirestore.instance.collection('ludo').doc(roomCode).update({
        'winnerId': userid,
      });
      notifyListeners();
    }
    if (winners.length == 3) {
      _gameState = LudoGameState.finish;
      notifyListeners();
    }
  }

  void resetPawns(context, firebaseViewModel) async {
    for (var player in players) {
      for (var i = 0; i < player.pawns.length; i++) {
        player.pawns[i].step = 0; // Reset to the initial position
        _currentTurn = LudoPlayerType.blue;
        // Update Firestore with the reset position
        await FirebaseFirestore.instance
            .collection('ludo')
            .doc(firebaseViewModel.toString())
            .update({
          '${player.type.toString().split('.').last}PawnPosition$i': 0,
          'currentTurn': _currentTurn.index,
        });
      }
    }

    notifyListeners(); // Notify listeners to rebuild the UI
  }

  void nextTurn() async {
    if (_diceResult == 6) {
      _gameState = LudoGameState.throwDice;
      notifyListeners();
      return;
    }

    if (playerQuantity != 2) {
      switch (_currentTurn) {
        case LudoPlayerType.blue:
          _currentTurn = LudoPlayerType.red;
          break;
        case LudoPlayerType.red:
          _currentTurn = LudoPlayerType.green;
          break;
        case LudoPlayerType.green:
          _currentTurn = LudoPlayerType.yellow;
          break;
        case LudoPlayerType.yellow:
          _currentTurn = LudoPlayerType.blue;
          break;
      }
    } else {
      switch (_currentTurn) {
        case LudoPlayerType.blue:
          _currentTurn = LudoPlayerType.green;
          break;
        case LudoPlayerType.green:
          _currentTurn = LudoPlayerType.blue;
          break;

        case LudoPlayerType.green:
        // TODO: Handle this case.
        case LudoPlayerType.yellow:
        // TODO: Handle this case.
        case LudoPlayerType.red:
        // TODO: Handle this case.
      }
    }
    if (winners.contains(_currentTurn)) return nextTurn();
    _gameState = LudoGameState.throwDice;

    await gameDoc!.update({
      'currentTurn': _currentTurn.index,
      'gameState': _gameState.index,
    });

    notifyListeners();
  }
  String? _roomCode;

  String? get roomCode => _roomCode;

  // Method to set the room code
  void setRoomCode(String roomCode) {
    _roomCode = roomCode;
    notifyListeners();
  }
  void createRoom(context) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");
    final firebaseViewModel = Provider.of<FirebaseViewModel>(context, listen: false);
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    CollectionReference ludoCollection = fireStore.collection('ludo');
    final playerColors = players;
    String roomCode = DateTime.now().millisecondsSinceEpoch.toString(); // Unique room code

    bool isRoomCreated = false;
    setRoomCode(roomCode);
    while (!isRoomCreated) {
      DocumentSnapshot documentSnapshot = await ludoCollection.doc(roomCode).get();

      if (!documentSnapshot.exists) {
        print("Creating new room with code $roomCode");
        Map<String, dynamic> jsonData = {
          "roomCode": roomCode,
          "1": '{"name":"$username","id":"$userId","image":"$image","number":"$mobilenumber","color":"${playerColors[0].type}","colors":"blue"}',
          "3": '', // Second player is empty initially
          "isLocked": false,
          "playerQuantity": 2, // Only 2 players are allowed
          "prizePool": prizePool
        };
        // gameDoc!.update({
        //   'entryAmount': entryAmount,
        // });
        await ludoCollection.doc(roomCode).set(jsonData);
        ludoCollection.doc(roomCode).update({
          'entryAmount': entryAmount,
        });
        setRoomCode(roomCode); // Save the room code in the view model
        setFieldKey(1); // Set field for first player
        isRoomCreated = true;

      } else {
        print("Room code already exists, generating a new one...");
        // Regenerate room code if it already exists
        roomCode = DateTime.now().millisecondsSinceEpoch.toString();
      }
    }
    if (isRoomCreated) {
      print("vvvvv");
      firebaseViewModel.setTable(int.parse(roomCode.toString()));
    }
  }

  joinRoom(context, String roomCode) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");
    final firebaseViewModel = Provider.of<FirebaseViewModel>(context, listen: false);
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    CollectionReference ludoCollection = fireStore.collection('ludo');
    final playerColors = players;
    DocumentSnapshot documentSnapshot = await ludoCollection.doc(roomCode).get();

    Map<String, dynamic>? existingData = documentSnapshot.data() as Map<String, dynamic>?;

    if (existingData != null) {
      final List<bool> slotsFilled = [
        existingData["1"] != null && existingData["1"] != '',
        existingData["3"] != null && existingData["3"] != ''
      ];

      if (slotsFilled.every((isFilled) => isFilled)) {
        print("Room is full. Cannot join.");
        return;
      }

      // If slot 1 is empty, join as player 1
      if (!slotsFilled[0]) {
        await ludoCollection.doc(roomCode).update({
          "1": '{"name":"${username}","id":"${userId}","image":"$image","number":"$mobilenumber","color":"${playerColors[0].type}","colors":"blue"}'
        });
        setFieldKey(1);
        print("Player joined as Player 1 in room $roomCode");
        setRoomCode(roomCode); // Save the room code in the view model
      }
      // If slot 2 is empty, join as player 2
      else if (!slotsFilled[1]) {
        await ludoCollection.doc(roomCode).update({
          "3": '{"name":"$username","id":"$userId","image":"$image","number":"$mobilenumber","color":"${playerColors[2].type}","colors":"green"}'
        });
        setFieldKey(3);
        print("Player joined as Player 2 in room $roomCode");

        if (!documentSnapshot.exists) {
          print("Room with code $roomCode does not exist.");
          return;
        }

        setRoomCode(roomCode); // Save the room code in the view model
      }
      firebaseViewModel.setTable(int.parse(roomCode.toString()));
    }
  }

  removePlayerData(context) async {
    final firebaseViewModel =
    Provider.of<FirebaseViewModel>(context, listen: false);
    final ludoProvider = Provider.of<LudoProvider>(context, listen: false);
    final documentID = firebaseViewModel.table.toString();
    CollectionReference ludoCollection =
    FirebaseFirestore.instance.collection('ludo');

    // Get the field key for the current player
    int fieldKey = ludoProvider.fieldKey + 1;

    // Update Firestore to remove the current player's data
    await ludoCollection.doc(roomCode).update({
      fieldKey.toString(): '', // Clear the player's data
    });

    // Reset the pawns for the current player
    var currentPlayer =
    ludoProvider.players[fieldKey - 1]; // Assuming players is a list
    for (var i = 0; i < currentPlayer.pawns.length; i++) {
      print("😢😢😢😢😢");
      currentPlayer.pawns[i].step = 0; // Reset to initial position
      // Update Firestore with the reset pawn position
      await ludoCollection.doc(documentID).update({
        '${currentPlayer.type.toString().split('.').last}PawnPosition$i': 0,
      });
    }

    // Optionally lock the table
    await ludoCollection.doc(documentID).update({"isLocked": true});

    // Notify listeners to rebuild the UI
    notifyListeners();
  }

  removePlayerName(context) async {
    final firebaseViewModel =
    Provider.of<FirebaseViewModel>(context, listen: false);
    final ludoProvider = Provider.of<LudoProvider>(context, listen: false);
    final documentID = firebaseViewModel.table.toString();
    CollectionReference ludoCollection =
    FirebaseFirestore.instance.collection('ludo');

    // Get the field key for the current player
    int fieldKey = ludoProvider.fieldKey + 1;

    // Update Firestore to remove the current player's data
    await ludoCollection.doc(documentID).update({
      fieldKey.toString(): '', // Clear the player's data
    });

    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
