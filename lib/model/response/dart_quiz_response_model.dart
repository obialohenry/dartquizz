class DartQuizResponseModel {
  String? title;
  String? description;
  List<Questions>? questions;

  DartQuizResponseModel({this.title,this.description ,this.questions});

  DartQuizResponseModel copyWith({String? title,String? description ,List<Questions>? questions}) {
    return DartQuizResponseModel(
      title: title ?? this.title,
      description: description??this.description,
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title,'description':description ,'questions': questions};
  }

  factory DartQuizResponseModel.fromJson(Map<String, dynamic> json) {
    return DartQuizResponseModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      questions:
          (json['questions'] as List<dynamic>?)
              ?.map((e) => Questions.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  @override
  String toString() => "DartQuizResponseModel(title: $title,description:$description,questions: $questions)";

  @override
  int get hashCode => Object.hash(title, description,questions);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DartQuizResponseModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description
          &&
          questions == other.questions;
}

class Questions {
  String? question;
  List<String>? options;
  String? answer;

  Questions({this.question, this.options, this.answer});

  Questions copyWith({String? question, List<String>? options, String? answer}) {
    return Questions(
      question: question ?? this.question,
      options: options ?? this.options,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toJson() {
    return {'question': question, 'options': options, 'answer': answer};
  }

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      question: json['question'] as String?,
      options: (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      answer: json['answer'] as String?,
    );
  }

  @override
  String toString() => "Questions(question: $question,options: $options,answer: $answer)";

  @override
  int get hashCode => Object.hash(question, options, answer);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Questions &&
          runtimeType == other.runtimeType &&
          question == other.question &&
          options == other.options &&
          answer == other.answer;
}
