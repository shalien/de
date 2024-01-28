import 'package:collection/collection.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

import '../attachment_downloader.dart';
import '../utils.dart';

final MessageCommand afterMessageCommand = MessageCommand(
    "After this message",
    id('After this message', (MessageContext context) async {
      final Message message = context.targetMessage;

      final GuildTextChannel channel =
          await message.channel.fetch() as GuildTextChannel;
      final Guild guild = await channel.guild.fetch();

      List<Message> messages =
          await channel.messages.fetchMany(limit: 100, after: message.id);

      int attachmentsCount = 0;
      int messsagesCount = 0;
      int step = 1;

      do {
        List<Message> messagesWithAttachments =
            messages.where((e) => e.attachments.isNotEmpty).toList();

        if (messagesWithAttachments.isEmpty) {
          await context.respond(
              MessageBuilder(
                  content: 'No attachments found in the last 100 messages'),
              level: ResponseLevel.private);
          print(
              'No attachments found in the last 100 messages from ${guild.name} ${channel.name}');
          return;
        } else {
          await context.respond(
              MessageBuilder(
                  content:
                      'Found ${messagesWithAttachments.length} messages with attachments'),
              level: ResponseLevel.private);
        }

        messsagesCount += messagesWithAttachments.length;

        List<Attachment> attachments = [
          ...messagesWithAttachments.map((e) => e.attachments).flattened
        ];

        attachmentsCount += await AttachmentDownloader()
            .download(guild.name, channel.name, attachmentsToMap(attachments));

        print(
            '[${guild.name}][${channel.name}] Step $step: $messsagesCount attachments downloaded');

        step++;

        messages = await channel.messages
            .fetchMany(limit: 100, after: messages.last.id);
      } while (messages.isNotEmpty);

      await context.respond(
          MessageBuilder(
              content:
                  'Downloaded $attachmentsCount attachments from $messsagesCount messages'),
          level: ResponseLevel.private);

      print(
          '[${guild.name}][${channel.name}] Downloaded $attachmentsCount attachments from $messsagesCount in $step steps');
    }),
    localizedNames: {
      Locale.fr: 'Après ce message',
    });
