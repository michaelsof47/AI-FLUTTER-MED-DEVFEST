// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_conversation.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class ChatConversation extends _ChatConversation
    with RealmEntity, RealmObjectBase, RealmObject {
  ChatConversation(
    String id,
    String title,
    DateTime createdAt,
    DateTime updatedAt, {
    String? lastMessage,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set(this, 'lastMessage', lastMessage);
  }

  ChatConversation._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  DateTime get updatedAt =>
      RealmObjectBase.get<DateTime>(this, 'updatedAt') as DateTime;
  @override
  set updatedAt(DateTime value) =>
      RealmObjectBase.set(this, 'updatedAt', value);

  @override
  String? get lastMessage =>
      RealmObjectBase.get<String>(this, 'lastMessage') as String?;
  @override
  set lastMessage(String? value) =>
      RealmObjectBase.set(this, 'lastMessage', value);

  @override
  Stream<RealmObjectChanges<ChatConversation>> get changes =>
      RealmObjectBase.getChanges<ChatConversation>(this);

  @override
  Stream<RealmObjectChanges<ChatConversation>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ChatConversation>(this, keyPaths);

  @override
  ChatConversation freeze() =>
      RealmObjectBase.freezeObject<ChatConversation>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'createdAt': createdAt.toEJson(),
      'updatedAt': updatedAt.toEJson(),
      'lastMessage': lastMessage.toEJson(),
    };
  }

  static EJsonValue _toEJson(ChatConversation value) => value.toEJson();
  static ChatConversation _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'createdAt': EJsonValue createdAt,
        'updatedAt': EJsonValue updatedAt,
      } =>
        ChatConversation(
          fromEJson(id),
          fromEJson(title),
          fromEJson(createdAt),
          fromEJson(updatedAt),
          lastMessage: fromEJson(ejson['lastMessage']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ChatConversation._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, ChatConversation, 'ChatConversation', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
      SchemaProperty('lastMessage', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
