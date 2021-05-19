import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final betterPlayerController = BetterPlayerController(
    BetterPlayerConfiguration(
      autoPlay: true,
      looping: true,
      aspectRatio: 9 / 16,
      controlsConfiguration: const BetterPlayerControlsConfiguration(
        showControlsOnInitialize: true,
        showControls: false,
      ),
    ),
    betterPlayerDataSource: BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      'https://staging.milov.id/videoProfile/628137654321/MjAyMTA1MTgwMjU1NThfNjI4MTM3NjU0MzIxX21pbG92X3RyaW1fOTQ5NC5tcDQ=',
      cacheConfiguration: BetterPlayerCacheConfiguration(useCache: true),
    ),
  );

  // final ValueNotifier<bool> _isPlayed = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Application'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () async {
            if (betterPlayerController.isPlaying()) {
              await betterPlayerController.pause();
            } else {
              await betterPlayerController.play();
            }
          },
          child: BetterPlayer(controller: betterPlayerController),
        ),
      ),
    );
  }
}
