import 'package:de/src/attachment_downloader.dart';
import 'package:de/src/utils.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

final MessageCommand currentMessageCommand = MessageCommand(
  'This message',
  id('This message', (MessageContext context) async {
    final Message message = context.targetMessage;

    if (message.attachments.isEmpty) {
      await context
          .respond(MessageBuilder(content: 'This message has no attachments'));
    }

    GuildChannel? channel = await message.channel.fetch() as GuildChannel?;
    Guild? guild = await channel?.guild.fetch();

    if (guild == null) {
      await context
          .respond(MessageBuilder(content: 'This message is not in a guild'));
    }

    if (channel == null) {
      await context
          .respond(MessageBuilder(content: 'This message is not in a channel'));
    }

    int i = await AttachmentDownloader().download(
        guild!.name, channel!.name, attachmentsToMap(message.attachments));

    await context.respond(MessageBuilder(content: 'Downloaded $i attachments'),
        level: ResponseLevel.private);
  }),
  localizedNames: {
    Locale.fr: 'Ce message',
  },
);
