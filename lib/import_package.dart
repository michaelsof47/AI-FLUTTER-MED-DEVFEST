
import 'package:flutter/material.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:realm/realm.dart';
import 'package:uuid/uuid.dart' as uuid_pkg;

import 'models/chat_conversation.dart';
import 'models/chat_message.dart'; // Alias untuk menghindari konflik nama

part 'services/ai_services.dart';
part 'services/realm_service.dart';
part 'controller/ai_chat_controller.dart';
part 'views/chat_bubble.dart';

part 'views/ai_view.dart';
