import 'dart:io';

import 'package:http/http.dart';
import 'package:nyxx/nyxx.dart';
import 'package:path/path.dart';

AttachmentDownloader? _attachmentDownloader;

const String _attachmentDirectory = 'attachments';

final class AttachmentDownloader {
  final Client _client = Client();

  factory AttachmentDownloader() {
    return _attachmentDownloader ??= AttachmentDownloader._();
  }

  AttachmentDownloader._();

  Future<int> download(String guildName, String channelName,
      Map<Snowflake, Uri> snowflakeUris) async {
    int counter = 0;

    final Directory targetDirectory = Directory(
        '$_attachmentDirectory$separator$guildName$separator$channelName$separator');

    if (!await targetDirectory.exists()) {
      await targetDirectory.create(recursive: true);
    }

    for (MapEntry entry in snowflakeUris.entries) {
      final String filename =
          '${entry.key.toString()}${extension(entry.value.path)}';
      final File file = File('${targetDirectory.path}$filename');

      if (await file.exists()) {
        counter++;
        continue;
      }

      final Response response = await _client.get(entry.value);

      switch (response.statusCode) {
        case HttpStatus.ok:
          break;
        case HttpStatus.notFound:
          print('Attachment not found: ${entry.value}');
          continue;
        default:
          print('Unexpected status code: ${response.statusCode}');
          continue;
      }

      File writtenFile = await file.writeAsBytes(response.bodyBytes);

      if (await writtenFile.exists()) {
        counter++;
      }
    }

    return Future.value(counter);
  }
}
