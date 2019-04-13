import 'package:dio/dio.dart';
import 'package:kario_kelias/questions.dart';

class ApiService {
  static final ApiService _singleton = new ApiService._internal();

  factory ApiService() {
    return _singleton;
  }

  static const _baseApiUrl = "https://www.getpet.lt/rukla/";

  static const _authenticateUrl =
      "https://www.getpet.lt/api/v1/authentication/firebase/connect/";

  final Dio rawDio = Dio();
  final Dio dio = Dio(BaseOptions(
    baseUrl: _baseApiUrl,
  ));

//  final _appPreferences = AppPreferences();
//  final _authenticationManager = AuthenticationManager();

  ApiService._internal() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      final apiToken = "dcb0be97601574147fd62aa6ae40ba9022d87319";
//      final apiToken = await _appPreferences.getApiToken();

      if (apiToken != null) {
        _addHeaderApiToken(options.headers, apiToken);
      }
//      else if (await _authenticationManager.isLoggedIn()) {
//        try {
//          dio.interceptors.requestLock.lock();
//          final idToken = await _authenticationManager.getIdToken();
//          if (idToken != null) {
//            final apiToken = await _authenticate(idToken);
//            await _appPreferences.setApiToken(apiToken);
//
//            _addHeaderApiToken(options.headers, apiToken);
//          }
//        } catch (ex) {
//          print(ex);
//        } finally {
//          dio.interceptors.requestLock.unlock();
//        }
//      }

      return options;
    }, onResponse: (Response response) {
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      // Do something with response error
      return e; //continue
    }));
  }

  static _addHeaderApiToken(Map<String, dynamic> headers, String apiToken) {
    headers["Authorization"] = "Token $apiToken";
  }

  Future<String> _authenticate(String idToken) async {
    final response = await rawDio.post(
      _authenticateUrl,
      data: {
        "id_token": idToken,
      },
    );

    return response.data['key'];
  }

  Future<Game> startGame() async {
    final response = await dio.post(
      '/v1/game/start/',
      data: {},
    );

    return Game.fromJson(response.data);
  }

  Future submitGame(
    Game game, {
    bool finished = false,
    Answer failedAnswer,
  }) async {
    await dio.patch(
      '/v1/game/finish/${game.gameId}/',
      data: {
        'answered_questions': game.getAnsweredQuestionIds(),
        'is_finished': finished,
        'failed_answer': failedAnswer != null ? failedAnswer.id : null,
      },
    );
  }

  Future<List<Result>> getResults() async {
    final response = await dio.get(
      '/v1/game/results/',
    );

    return response.data
        .map<Result>((model) => Result.fromJson(model))
        .toList();
  }
}
