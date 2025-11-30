// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class ChatMessage extends _ChatMessage
    with RealmEntity, RealmObjectBase, RealmObject {
  ChatMessage(
    String id,
    String conversationId,
    String content,
    bool isUser,
    DateTime timestamp, {
    String? error,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'conversationId', conversationId);
    RealmObjectBase.set(this, 'content', content);
    RealmObjectBase.set(this, 'isUser', isUser);
    RealmObjectBase.set(this, 'timestamp', timestamp);
    RealmObjectBase.set(this, 'error', error);
  }

  ChatMessage._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get conversationId =>
      RealmObjectBase.get<String>(this, 'conversationId') as String;
  @override
  set conversationId(String value) =>
      RealmObjectBase.set(this, 'conversationId', value);

  @override
  String get content => RealmObjectBase.get<String>(this, 'content') as String;
  @override
  set content(String value) => RealmObjectBase.set(this, 'content', value);

  @override
  bool get isUser => RealmObjectBase.get<bool>(this, 'isUser') as bool;
  @override
  set isUser(bool value) => RealmObjectBase.set(this, 'isUser', value);

  @override
  DateTime get timestamp =>
      RealmObjectBase.get<DateTime>(this, 'timestamp') as DateTime;
  @override
  set timestamp(DateTime value) =>
      RealmObjectBase.set(this, 'timestamp', value);

  @override
  String? get error => RealmObjectBase.get<String>(this, 'error') as String?;
  @override
  set error(String? value) => RealmObjectBase.set(this, 'error', value);

  @override
  Stream<RealmObjectChanges<ChatMessage>> get changes =>
      RealmObjectBase.getChanges<ChatMessage>(this);

  @override
  Stream<RealmObjectChanges<ChatMessage>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ChatMessage>(this, keyPaths);

  @override
  ChatMessage freeze() => RealmObjectBase.freezeObject<ChatMessage>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'conversationId': conversationId.toEJson(),
      'content': content.toEJson(),
      'isUser': isUser.toEJson(),
      'timestamp': timestamp.toEJson(),
      'error': error.toEJson(),
    };
  }

  static EJsonValue _toEJson(ChatMessage value) => value.toEJson();
  static ChatMessage _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'conversationId': EJsonValue conversationId,
        'content': EJsonValue content,
        'isUser': EJsonValue isUser,
        'timestamp': EJsonValue timestamp,
      } =>
        ChatMessage(
          fromEJson(id),
          fromEJson(conversationId),
          fromEJson(content),
          fromEJson(isUser),
          fromEJson(timestamp),
          error: fromEJson(ejson['error']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ChatMessage._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, ChatMessage, 'ChatMessage', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('conversationId', RealmPropertyType.string),
      SchemaProperty('content', RealmPropertyType.string),
      SchemaProperty('isUser', RealmPropertyType.bool),
      SchemaProperty('timestamp', RealmPropertyType.timestamp),
      SchemaProperty('error', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
