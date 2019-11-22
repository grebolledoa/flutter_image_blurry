import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_blurry/image_blurry.dart';

void main() {
  const MethodChannel channel = MethodChannel('image_blurry');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ImageBlurry.platformVersion, '42');
  });
}
