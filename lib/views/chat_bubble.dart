part of '../import_package.dart';

class ChatBubble extends StatelessWidget {

  final String message;
  final bool isUser;
  final DateTime timestamp;


  const ChatBubble({Key? key, required this.message, required this.isUser, required this.timestamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h),
        padding: EdgeInsets.all(12.w),
        constraints: BoxConstraints(maxWidth: 0.75.sw), // Max width 75% layar
        decoration: BoxDecoration(
          color: isUser ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
            bottomLeft: isUser ? Radius.circular(12.r) : Radius.zero,
            bottomRight: isUser ? Radius.zero : Radius.circular(12.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}",
              style: TextStyle(
                fontSize: 10.sp,
                color: isUser ? Colors.white70 : Colors.black54,
              ),
            ),
          ]
        ),
      )
    );
  }
}