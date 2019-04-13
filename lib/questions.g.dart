// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(name: json['name'] as String, photo: json['photo'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) =>
    <String, dynamic>{'name': instance.name, 'photo': instance.photo};

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      points: json['points'] as int,
      rank: json['rank'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'points': instance.points,
      'rank': instance.rank,
      'user': instance.user
    };

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

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
      rank: json['rank'] as String, nextRank: json['next_rank'] as String);
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) =>
    <String, dynamic>{'rank': instance.rank, 'next_rank': instance.nextRank};

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
      gameId: json['game_id'] as String,
      questions: (json['questions'] as List)
          ?.map((e) =>
              e == null ? null : Question.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      userInfo: json['user_info'] == null
          ? null
          : UserInfo.fromJson(json['user_info'] as Map<String, dynamic>));
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'game_id': instance.gameId,
      'questions': instance.questions,
      'user_info': instance.userInfo
    };
