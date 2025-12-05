part of '../import_package.dart';

class RealmService {
  late Realm _realm;

  RealmService() {
    try {
      final config = Configuration.local([
        ChatConversation.schema,
        ChatMessage.schema,
      ]);
      _realm = Realm(config);
      print('✅ Realm database opened successfully');
    } catch (e) {
      print('❌ Failed to open Realm database: $e');
      rethrow;
    }
  }


  ChatConversation createConversation(String title) {
    final conversation = ChatConversation(const uuid_pkg.Uuid().v4(), title,DateTime.now(), DateTime.now());
    _realm.write(() => _realm.add(conversation));
    return conversation;
  }

  List<ChatConversation> getAllConversation() {
    return _realm.all<ChatConversation>().toList()..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }

  ChatMessage addMessage({
    required String conversationId,
    required String content,
    required bool isUser
  }) {
    final message = ChatMessage(const uuid_pkg.Uuid().v4(),conversationId,content,isUser,DateTime.now());
    _realm.write(() {
      _realm.add(message);
      
      final conversation = _realm.find<ChatConversation>(conversationId);
      if(conversation != null) {
        conversation.lastMessage = content;
        conversation.updatedAt = DateTime.now();
      }
    });
    return message;
  }

  List<ChatMessage> getMessages(String conversationId) {
    return _realm.all<ChatMessage>().query('conversationId == \$0', [conversationId]).toList()..sort((a,b) => a.timestamp.compareTo(b.timestamp));
  }

  void updateMessageContent(String messageId, String newContent) {
    final message = _realm.find<ChatMessage>(messageId);
    if(message != null) {
      _realm.write(() {
        message.content = newContent;
      });
    }
  }

  void close() => _realm.close();

  // Method untuk mendapatkan path file database
  String getRealmPath() => _realm.config.path;

  // Method untuk export database info
  void printDatabaseInfo() {
    print('📁 Realm Database Path: ${_realm.config.path}');
    print('📊 Total Conversations: ${_realm.all<ChatConversation>().length}');
    print('💬 Total Messages: ${_realm.all<ChatMessage>().length}');
  }
}