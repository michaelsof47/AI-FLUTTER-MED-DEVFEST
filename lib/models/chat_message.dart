
import 'package:realm/realm.dart';
part 'chat_message.realm.dart';

@RealmModel()
class _ChatMessage {
  @PrimaryKey()
  late String id;
  late String conversationId; 
  late String content;
  late bool isUser; 
  late DateTime timestamp;
  String? error;
}