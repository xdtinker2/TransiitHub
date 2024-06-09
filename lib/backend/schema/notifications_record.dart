import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "notificationId" field.
  String? _notificationId;
  String get notificationId => _notificationId ?? '';
  bool hasNotificationId() => _notificationId != null;

  // "recipientId" field.
  DocumentReference? _recipientId;
  DocumentReference? get recipientId => _recipientId;
  bool hasRecipientId() => _recipientId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "read" field.
  bool? _read;
  bool get read => _read ?? false;
  bool hasRead() => _read != null;

  void _initializeFields() {
    _notificationId = snapshotData['notificationId'] as String?;
    _recipientId = snapshotData['recipientId'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _title = snapshotData['title'] as String?;
    _details = snapshotData['details'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _read = snapshotData['read'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? notificationId,
  DocumentReference? recipientId,
  String? type,
  String? title,
  String? details,
  DateTime? timestamp,
  bool? read,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notificationId': notificationId,
      'recipientId': recipientId,
      'type': type,
      'title': title,
      'details': details,
      'timestamp': timestamp,
      'read': read,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.notificationId == e2?.notificationId &&
        e1?.recipientId == e2?.recipientId &&
        e1?.type == e2?.type &&
        e1?.title == e2?.title &&
        e1?.details == e2?.details &&
        e1?.timestamp == e2?.timestamp &&
        e1?.read == e2?.read;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.notificationId,
        e?.recipientId,
        e?.type,
        e?.title,
        e?.details,
        e?.timestamp,
        e?.read
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}