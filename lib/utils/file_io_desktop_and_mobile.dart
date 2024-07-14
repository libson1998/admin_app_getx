import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'dart:io' show Platform;

// Existing code in google_fonts/src/file_io_desktop_and_mobile.dart

Future<String> localPath() async {
  if (!kIsWeb && (Platform.isIOS || Platform.isAndroid || Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    final directory = await getApplicationSupportDirectory();
    return directory.path;
  } else {
    throw UnsupportedError("This platform is not supported for this operation");
  }
}

// Continue with the rest of the code
