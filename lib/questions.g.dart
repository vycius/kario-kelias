// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
      id: json['id'] as int,
      text: json['text'] as String,
      explanation: json['explanation'] as String,
      answers: (json['answers'] as List)
          ?.map((e) =>
              e == null ? null : Answer.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'explanation': instance.explanation,
      'answers': instance.answers
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
      id: json['id'] as int,
      text: json['text'] as String,
      isCorrect: json['is_correct'] as bool);
}

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'is_correct': instance.isCorrect
    };

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
      gameId: json['game_id'] as String,
      questions: (json['questions'] as List)
          ?.map((e) =>
              e == null ? null : Question.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'game_id': instance.gameId,
      'questions': instance.questions
    };
