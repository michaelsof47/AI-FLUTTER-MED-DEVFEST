part of '../import_package.dart';

class AIView extends StatefulWidget {
  const AIView({Key? key}) : super(key: key);

  @override
  State<AIView> createState() => _AIViewState();
}

class _AIViewState extends State<AIView> {
  AiChatController? controller;
  TextEditingController? inputController;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AiChatController());
    inputController = TextEditingController();
  }

  void showInfoDialog() {
    controller?.getRealmLog();
    // Show dialog dengan path
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Database Info"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Path:", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8.h),
            SelectableText(
              controller!.getRealmPath()!,
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(height: 16.h),
            Text("Stats:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Conversations: ${controller?.getAllConversation().length}"),
            Text(
                "Messages: ${controller?.getMessages(controller?.currentConversationId ?? '').length}"),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(), child: Text("Close")),
        ],
      ),
    );
  }

  void sendMessage() {
    final prompt = inputController!.text;
    if (prompt.isNotEmpty) {
      controller!.sendMessages(prompt); // Panggil di sini
      inputController!.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AI Chat"),
          actions: [
            // Button untuk print database path
            IconButton(
                icon: Icon(Icons.download), onPressed: () => showInfoDialog()),
          ],
        ),
        body: Column(
          children: [
            // Display response
            Expanded(
              child: Obx(() => ListView.builder(
                    padding: EdgeInsets.all(16.w),
                    itemCount: controller!.messages.length,
                    itemBuilder: (context, index) {
                      final message = controller!.messages[index];
                      return ChatBubble(
                        message: message.content,
                        isUser: message.isUser,
                        timestamp: message.timestamp,
                      );
                    },
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Row(children: [
                Expanded(
                  child: TextField(
                    controller: inputController,
                    decoration: const InputDecoration(
                        hintText: "Type your message...",
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(width: 8.w),
                IconButton(
                    icon: Icon(Icons.send), onPressed: () => sendMessage()),
              ]),
            )
          ],
        ));
  }
}
