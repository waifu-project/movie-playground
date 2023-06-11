import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';

// copy by https://github.com/Jackiu1997/pure_live/blob/2b03245ac9bb5749f7f01c85c1e4c4c8889f34a7/lib/common/utils/js_engine.dart

class JsEngine {
  static JavascriptRuntime? _jsRuntime;
  static JavascriptRuntime get jsRuntime => _jsRuntime!;

  static void init() {
    _jsRuntime ??= getJavascriptRuntime();
    jsRuntime.enableHandlePromises();
    loadPackages();
  }

  static Future<void> loadPackages() async {
    final cryptojs = await rootBundle.loadString('js/node_modules/json5/dist/');
    jsRuntime.evaluate(cryptojs);
  }

  static JsEvalResult evaluate(String code) {
    return jsRuntime.evaluate(code);
  }

  static Future<JsEvalResult> evaluateAsync(String code) {
    return jsRuntime.evaluateAsync(code);
  }

  static dynamic onMessage(String channelName, dynamic Function(dynamic) fn) {
    return jsRuntime.onMessage(channelName, (args) => null);
  }

  static dynamic sendMessage({
    required String channelName,
    required List<String> args,
    String? uuid,
  }) {
    return jsRuntime.sendMessage(channelName: channelName, args: args);
  }
}