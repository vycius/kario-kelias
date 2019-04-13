import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'questions.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String name;
  final String photo;

  User({
    this.name,
    this.photo,
  }) : super([
          name,
          photo,
        ]);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Result extends Equatable {
  final int points;
  final String rank;
  final User user;

  Result({this.points, this.rank, this.user})
      : super([
          points,
          rank,
          user,
        ]);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Question extends Equatable {
  final int id;
  final String text;
  final String explanation;
  final List<Answer> answers;

  Question({
    this.id,
    this.text,
    this.explanation,
    this.answers,
  }) : super([
          id,
          text,
          explanation,
        ]);

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class Answer extends Equatable {
  final int id;
  final String text;

  @JsonKey(name: 'is_correct')
  final bool isCorrect;

  Answer({
    this.id,
    this.text,
    this.isCorrect,
  }) : super([
          id,
          text,
          isCorrect,
        ]);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}

@JsonSerializable()
class UserInfo extends Equatable {
  final String rank;

  @JsonKey(name: 'next_rank')
  final String nextRank;

  UserInfo({
    this.rank,
    this.nextRank,
  }) : super([
          rank,
          nextRank,
        ]);

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

@JsonSerializable()
class Game extends Equatable {
  @JsonKey(name: 'game_id')
  final String gameId;

  final List<Question> questions;

  @JsonKey(name: 'user_info')
  final UserInfo userInfo;

  @JsonKey(ignore: true)
  List<Question> answeredQuestions = [];

  Game({
    this.gameId,
    this.questions,
    this.userInfo,
  }) : super([
          gameId,
          questions,
          userInfo,
        ]);

  bool isGameFinished() {
    return answeredQuestions.length == questions.length;
  }

  bool isLastQuestion() {
    return answeredQuestions.length + 1 == questions.length;
  }

  List<int> getAnsweredQuestionIds() {
    return answeredQuestions.map((q) => q.id).toList();
  }

  Question getCurrentQuestion() {
    if (isGameFinished()) {
      return null;
    }

    return questions[answeredQuestions.length];
  }

  bool nextQuestion() {
    answeredQuestions.add(getCurrentQuestion());

    return !isGameFinished();
  }

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);
}
