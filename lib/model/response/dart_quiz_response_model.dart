class DartQuizResponseModel {
  String? id;
  String? title;
  String? description;
  List<Questions>? questions;

  DartQuizResponseModel({this.id, this.title, this.description, this.questions});

  DartQuizResponseModel copyWith({String? title, String? description, List<Questions>? questions}) {
    return DartQuizResponseModel(
      title: title ?? this.title,
      description: description ?? this.description,
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'description': description, 'questions': questions};
  }

  factory DartQuizResponseModel.fromJson(Map<String, dynamic> json) {
    return DartQuizResponseModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      questions:
          (json['questions'] as List<dynamic>?)
              ?.map((e) => Questions.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  @override
  String toString() =>
      "DartQuizResponseModel(id: $id,title: $title,description:$description,questions: $questions)";

  @override
  int get hashCode => Object.hash(id, title, description, questions);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DartQuizResponseModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          questions == other.questions;
}

class Questions {
  String? id;
  String? question;
  List<String>? options;
  String? answer;

  Questions({this.id, this.question, this.options, this.answer});

  Questions copyWith({String? question, List<String>? options, String? answer}) {
    return Questions(
      question: question ?? this.question,
      options: options ?? this.options,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'question': question, 'options': options, 'answer': answer};
  }

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      id: json['id'] as String?,
      question: json['question'] as String?,
      options: (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      answer: json['answer'] as String?,
    );
  }

  @override
  String toString() => "Questions(id: $id,question: $question,options: $options,answer: $answer)";

  @override
  int get hashCode => Object.hash(id, question, options, answer);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Questions &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          question == other.question &&
          options == other.options &&
          answer == other.answer;
}
