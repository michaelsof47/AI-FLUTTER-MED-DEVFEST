
part of '../import_package.dart';

class AiChatController extends GetxController {
  final aiServices = Get.put(AIServices());
  final realmServices = RealmService.instance; // FIX: Gunakan getter instance

  final messages = <ChatMessage>[].obs;
  String? currentConversationId;

  @override
  void onInit() {
    super.onInit();
  }

  void startNewConversation() {
    final title = "Chat ${DateTime.now().hour}:${DateTime.now().minute}";
    final conversation = realmServices.createConversation(title);
    currentConversationId = conversation.id;
    messages.clear();
  }

  void loadConversation(String conversationId) {
    currentConversationId = conversationId;
    messages.value = realmServices.getMessages(conversationId);
  }

  List<ChatConversation> getAllConversation() {
    return realmServices.getAllConversation();
  }

  List<ChatMessage> getMessages(String conversationId) {
    return realmServices.getMessages(conversationId);
  }

  void getRealmLog() {
    realmServices.printDatabaseInfo();
  }

  String? getRealmPath() {
    return realmServices.getRealmPath();
  }
 

  void sendMessages(String prompt) {
    
    if(currentConversationId == null) {
      startNewConversation();
    }

    // 1. Simpan pesan user
    final userMessage = realmServices.addMessage(
      conversationId: currentConversationId!, 
      content: prompt, 
      isUser: true
    );
    messages.add(userMessage);

    // 2. Buat placeholder untuk AI response
    final aiMessage = realmServices.addMessage(
      conversationId: currentConversationId!, 
      content: "...", 
      isUser: false
    );
    messages.add(aiMessage);

    String fullResponse = "";
    final stream = aiServices.generateText(prompt);
    
    stream.listen(
      (chunk) {
        fullResponse += chunk;
        print('📝 AI chunk received: ${chunk.substring(0, chunk.length > 50 ? 50 : chunk.length)}...');
      },
      onDone: () {
        print('✅ AI response complete. Length: ${fullResponse.length}');
        // Update AI message dengan response lengkap
        realmServices.updateMessageContent(aiMessage.id, fullResponse);
        // Reload messages dari database agar UI ter-update
        messages.value = realmServices.getMessages(currentConversationId!);
        print('✅ Messages reloaded from DB. Total: ${messages.length}');
      },
      onError: (error) {
        print('❌ AI error: $error');
        realmServices.updateMessageContent(aiMessage.id, "Error: $error");
        messages.value = realmServices.getMessages(currentConversationId!);
      }
    );
  }

}