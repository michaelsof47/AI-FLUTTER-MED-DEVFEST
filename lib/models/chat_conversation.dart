import 'package:realm/realm.dart';
part 'chat_conversation.realm.dart';

@RealmModel()
class _ChatConversation {
  @PrimaryKey()
  late String id;
  late String title;
  late DateTime createdAt;
  late DateTime updatedAt;
  String? lastMessage;  // Boleh nullable karena optional
}