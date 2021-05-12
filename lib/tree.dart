import 'package:flutter/cupertino.dart';

List<Church> churches = [];

class Tree {
    Node root;
    Tree(this.root);
}

class Node {
  List children = [];
  Church church;
  Node(this.church);

  addChild(Node node) {
    children.add(node);
  }
}

enum ChurchType {
  legacy,
  existingBelievers,
  newBelievers,
}

class Church {
  int id;//?
  String name;
  String email;
  String peopleGroup;
  int attenders;
  int believers;
  int baptized;
  int newlyBaptized;
  bool isChurch;
  ChurchType churchType;
  bool elementBaptism;
  bool elementWord;
  bool elementPrayer;
  bool elementLordsSupper;
  bool elementGive;
  bool elementWorship;
  bool elementLeaders;
  bool elementMakeDisciples;
  String place;
  DateTime date;
  List<int> threeThirds;
  bool active;
  //initialLeadersName
  //initialPlace
  //initialDate
  Church({this.name = '',
    this.email = '',
    this.peopleGroup = '',
    this.attenders = 0,
    this.believers = 0,
    this.baptized = 0,
    this.newlyBaptized = 0,
    this.isChurch = false,
    this.churchType = ChurchType.legacy,
    this.elementBaptism = false,
    this.elementWord = false,
    this.elementPrayer = false,
    this.elementLordsSupper = false,
    this.elementGive = false,
    this.elementWorship = false,
    this.elementLeaders = false,
    this.elementMakeDisciples = false,
    this.place = '',
    this.date,
    this.threeThirds = const [],
    this.active = true
  }) {
    int maxId = 0;
    for (Church church in churches) {
      maxId = (church.id > maxId) ? church.id : maxId;
    }
    this.id = maxId+1;
    this.date = this.date ?? DateTime.now();
  }
}

