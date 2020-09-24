import 'package:flutter/services.dart';
import 'package:flutter_ios_screenshots/flutter_ios_screenshots.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_ios_screenshots');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getIosStartScreenshots', () async {
    expect(await FlutterIosScreenshots.iosStartScreenshots, '42');
  });

  test('listeningPlatform', () async {
    expect(
        await FlutterIosScreenshots.listeningPlatform(
            (endResult) => print(endResult)),
        '42');
  });
}
