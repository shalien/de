import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

import 'commands/after_message_command.dart';
import 'commands/before_message_command.dart';
import 'commands/current_message_command.dart';
import 'token.dart';

/// This client will be used to access Discord API
///
final class DeClient {
  static NyxxGateway? _client;

  /// Define how the command should behave
  static final CommandsPlugin _commands = CommandsPlugin(
    prefix: null, // No prefix, everything will be message command
    guild: null, // Command will be global
    options: CommandsOptions(
      logErrors: true, // Error will be logged to stderr
    ),
  );

  static Future<void> instance() async {
    _commands.addCommand(currentMessageCommand);
    _commands.addCommand(beforeMessageCommand);
    _commands.addCommand(afterMessageCommand);

    _client = await Nyxx.connectGateway(token, GatewayIntents.messageContent,
        options: GatewayClientOptions(
          plugins: [_commands, Logging()],
        ));

    _client!.onReady.listen((ReadyEvent e) {
      print('De - Ready!');
    });
  }
}
