import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance;

//a variable to create a collection in our firebase firestore backend.
final quizLevelRF = fireStore.collection("QuizLevel");
