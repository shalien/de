import 'package:nyxx/nyxx.dart';

/// Converts a list of [Attachment]s to a [Map] of [Snowflake]s to [Uri]s.
Map<Snowflake, Uri> attachmentsToMap(List<Attachment> attachments) {
  return Map.fromEntries(attachments.map((e) => MapEntry(e.id, e.url)));
}
