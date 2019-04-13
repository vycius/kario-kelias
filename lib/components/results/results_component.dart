import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:kario_kelias/api/api_service.dart';
import 'package:kario_kelias/components/quiz/quiz_component.dart';
import 'package:kario_kelias/questions.dart';

class ResultsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Text("Savaitės lyderiai")),
              Tab(icon: Text("Mėnesio lyderiai")),
            ],
          ),
          title: Text('Rezultatai'),
        ),
        body: TabBarView(
          children: [
            ResultsBodyComponent(),
            ResultsBodyComponent(),
          ],
        ),
      ),
    );
  }
}

class ResultsBodyComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Result>>(
      future: ApiService().getResults(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ScoresComponent(
            results: snapshot.data,
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ScoresComponent extends StatelessWidget {
  final List<Result> results;

  const ScoresComponent({Key key, this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: results.length,
      padding: const EdgeInsets.all(15.0),
      itemBuilder: (context, position) {
        return ResultCell(result: results[position]);
      },
    );
  }
}

class ResultCell extends StatelessWidget {
  final Result result;

  const ResultCell({Key key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              key: Key(result.user.photo),
              backgroundColor: Colors.transparent,
              backgroundImage: AdvancedNetworkImage(
                result.user.photo,
                useDiskCache: true,
              ),
              radius: 36,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                          child: Text(
                            result.user.name,
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.deepOrangeAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          result.rank,
                          style: new TextStyle(
                            fontSize: 18.0,
                          ),
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      result.points.toString(),
                      style: new TextStyle(
                        fontSize: 24.0,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
