import 'package:fam_controller/core/debug_log/log.dart';
import 'package:url_launcher/url_launcher.dart' as u;

Future<void> launchUrl(String url) async {
  try {
    if (url.isEmpty) return;
    final parsedUrl = Uri.parse(url);

    await u.launchUrl(parsedUrl);
  } catch (e, s) {
    logError(e.toString(), s);
    throw Exception('Unable to launch URL; $url');
  }
}
