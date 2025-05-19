import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ludo_score/Ludo/UI/Homescreen/timer_page.dart';
import 'package:ludo_score/Ludo/UI/constant/utilll.dart';
import 'package:ludo_score/view_model/profile_view_model.dart';
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
  int _entryAmount = 0;
  int get entryAmount => _entryAmount;

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

  void setEntryAmount(int value) {
    _entryAmount = value;
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

  void setPlayerQuantity(int value) {
    _playerQuantity = value;
    notifyListeners();
  }

  void setPlayerDataFromJson(dynamic jsonData) {
    _playerDataList = List.from(jsonData);
    notifyListeners();
  }

  final List<LudoPlayerType> winners = [];
  int player1Score = 0;
  int player3Score = 0;
  void listenToGameUpdates(context) {
    print("gggggg");
    final firebaseViewModel = Provider.of<FirebaseViewModel>(context, listen: false).table.toString();
    gameDoc = FirebaseFirestore.instance.collection('ludo').doc(firebaseViewModel);
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
          player1Score = data['players']['blue']['score'] ?? 0;
          player3Score = data['players']['green']['score'] ?? 0;
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
    LudoPlayer player(LudoPlayerType type) => players.firstWhere((element) => element.type == type);
    void throwDice(context) async {
      _diceStarted = true;
      _stopDice = true;
      notifyListeners();
      final firebaseViewModel = Provider.of<FirebaseViewModel>(context, listen: false).table.toString();
      if (gameDoc == null) {
        gameDoc = FirebaseFirestore.instance.collection('ludo').doc(firebaseViewModel);
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
        final updates = {
          '${type.toString().split('.').last}PawnPosition$index': i,
        };

        if (i == currentPlayer.path.length - 1) {
          updates['players.${type.toString().split('.').last}.score'] =
              10;
        }
        gameDoc?.update(updates);

        // gameDoc?.update({
        //   '${type.toString().split('.').last}PawnPosition$index': i,
        // });
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
                final docRef = FirebaseFirestore.instance
                    .collection('ludo')
                    .doc(firebaseViewModel);

                Future.microtask(() async {
                  for (int j = opponentPawn.step; j >= 0; j--) {
                    await Future.delayed(const Duration(milliseconds: 50)); // Reduce the delay for faster movement
                    opponentPawn.step = j;
                    final updates = {
                      '${opponentType.toString().split('.').last}PawnPosition$i': j,
                    };

                    if (j == 0) {
                      updates['players.${type.toString().split('.').last}.score'] =
                          5;
                    }

                    await docRef.update(updates);
                    notifyListeners();
                  }
                });
                //     FirebaseFirestore.instance.collection('ludo').doc(firebaseViewModel)
                //         .update({
                //       '${opponentType.toString().split('.').last}PawnPosition$i':
                //           opponentPawn.step,
                //     });
                //     notifyListeners();
                //   }
                // });
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
        player.pawns[i].step = 0;
        _currentTurn = LudoPlayerType.blue;
        await FirebaseFirestore.instance
            .collection('ludo')
            .doc(firebaseViewModel.toString())
            .update({
          '${player.type.toString().split('.').last}PawnPosition$i': 0,
          'currentTurn': _currentTurn.index,
        });
      }
    }

    notifyListeners();
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
    final profileVM = Provider.of<ProfileViewModel>(context, listen: false);
    final profileData= profileVM.profileModelData;
    if(profileData?.data==null)return;
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    CollectionReference ludoCollection = fireStore.collection('ludo');
    final playerColors = players;
    String roomCode = DateTime.now().millisecondsSinceEpoch.toString();
    bool isRoomCreated = false;
    setRoomCode(roomCode);
    while (!isRoomCreated) {
      DocumentSnapshot documentSnapshot = await ludoCollection.doc(roomCode).get();
      if (!documentSnapshot.exists) {
        print("Creating new room with code $roomCode");
        Map<String, dynamic> jsonData = {
          "roomCode": roomCode,
          "1": '{"name":"${profileData?.data?.username}","id":"$userId","image":"$image","number":"${profileData?.data?.phone}","color":"${playerColors[0].type}","colors":"blue"}',
          "3": '',
          "isLocked": false,
          "playerQuantity": 2,
          "prizePool": prizePool,
          "players": {
            "blue": {"score": 0},
            "green": {"score": 0},
          }
        };
        await ludoCollection.doc(roomCode).set(jsonData);
        ludoCollection.doc(roomCode).update({
          'entryAmount': entryAmount,
        });
        setRoomCode(roomCode); // Save the room code in the view model
        setFieldKey(1); // Set field for first player
        isRoomCreated = true;
      } else {
        print("Room code already exists, generating a new one...");
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
    final profileVM = Provider.of<ProfileViewModel>(context, listen: false);
    final profileData= profileVM.profileModelData;
    if(profileData?.data==null)return;
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
      if (!slotsFilled[0]) {
        await ludoCollection.doc(roomCode).update({
          "1":
              '{"name":"${profileData?.data?.username}","id":"$userId","image":"$image","number":"${profileData?.data?.phone}","color":"${playerColors[0].type}","colors":"blue"}'
        });
        setFieldKey(1);
        print("Player joined as Player 1 in room $roomCode");
        setRoomCode(roomCode); // Save the room code in the view model
      }
      else if (!slotsFilled[1]) {
        await ludoCollection.doc(roomCode).update({
          "3":
              '{"name":"${profileData?.data?.username}","id":"$userId","image":"$image","number":"${profileData?.data?.phone}","color":"${playerColors[2].type}","colors":"green"}'
        });
        setFieldKey(3);
        print("Player joined as Player 2 in room $roomCode");

        if (!documentSnapshot.exists) {
          print("Room with code $roomCode does not exist.");
          return;
        }

        setRoomCode(roomCode);
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

  Future<void> joinOrCreateContestRoom(BuildContext context, String contestId) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("userId");
    final firebaseViewModel = Provider.of<FirebaseViewModel>(context, listen: false);
    final profileVM = Provider.of<ProfileViewModel>(context, listen: false);
    final profileData = profileVM.profileModelData;
    if (profileData?.data == null) return;

    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    CollectionReference ludoCollection = fireStore.collection('ludo');
    final playerColors = players;

    QuerySnapshot querySnapshot = await ludoCollection
        .where("contestId", isEqualTo: contestId)
        .where("playerQuantity", isEqualTo: 2)
        .where("isLocked", isEqualTo: false)
        .get();

    DocumentReference? selectedRoom;
    int? fieldKey;

    if (querySnapshot.docs.isNotEmpty) {
      // Existing room found – try joining
      final doc = querySnapshot.docs.first;
      final data = doc.data() as Map<String, dynamic>;
      final roomCode = doc.id;

      final slot1Filled = data["1"] != null && data["1"] != '';
      final slot3Filled = data["3"] != null && data["3"] != '';

      if (slot1Filled && slot3Filled) {
        print("Room is already full");
        return;
      }

      selectedRoom = doc.reference;

        if (!slot1Filled) {
          await selectedRoom.update({
          "1":
          '{"name":"${profileData?.data!.username}","id":"$userId","image":"$image","number":"${profileData?.data!.phone}","color":"${playerColors[0].type}","colors":"blue"}'
        });
        setFieldKey(1);
      } else if (!slot3Filled) {
        await selectedRoom.update({
          "3":
          '{"name":"${profileData?.data!.username}","id":"$userId","image":"$image","number":"${profileData?.data!.phone}","color":"${playerColors[2].type}","colors":"green"}'
        });
        setFieldKey(3);
      }
      final updated = await selectedRoom.get();
      final updatedData = updated.data() as Map<String, dynamic>;
      if (updatedData["1"] != '' && updatedData["3"] != '') {
        await selectedRoom.update({"isLocked": true});
      }
      setRoomCode(roomCode);
      firebaseViewModel.setTable(int.parse(roomCode));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TimerScreen()));
    } else {
      // No room found – create new one
      String roomCode = DateTime.now().millisecondsSinceEpoch.toString();
      selectedRoom = ludoCollection.doc(roomCode);
      await selectedRoom.set({
        "roomCode": roomCode,
        "contestId": contestId,
        "1":
        '{"name":"${profileData?.data!.username}","id":"$userId","image":"$image","number":"${profileData?.data!.phone}","color":"${playerColors[0].type}","colors":"blue"}',
        "3": '',
        "isLocked": false,
        "playerQuantity": 2,
        "prizePool": prizePool,
        "entryAmount": entryAmount,
        "players": {
          "blue": {"score": 0},
          "green": {"score": 0},
        }
      });
      setFieldKey(1);
      setRoomCode(roomCode);
      firebaseViewModel.setTable(int.parse(roomCode));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TimerScreen()));

    }
  }

String _generatedRoomCode = "";
String get generatedRoomCode => _generatedRoomCode;


clearData(context) {
  _generatedRoomCode = "";
  notifyListeners();
}


}
