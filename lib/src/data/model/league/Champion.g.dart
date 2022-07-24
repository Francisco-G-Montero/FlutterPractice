// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Champion.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ChampionCollectionReference
    implements
        ChampionQuery,
        FirestoreCollectionReference<ChampionQuerySnapshot> {
  factory ChampionCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$ChampionCollectionReference;

  static Champion fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Champion.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Champion value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  ChampionDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ChampionDocumentReference> add(Champion value);
}

class _$ChampionCollectionReference extends _$ChampionQuery
    implements ChampionCollectionReference {
  factory _$ChampionCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$ChampionCollectionReference._(
      firestore.collection('champions').withConverter(
            fromFirestore: ChampionCollectionReference.fromFirestore,
            toFirestore: ChampionCollectionReference.toFirestore,
          ),
    );
  }

  _$ChampionCollectionReference._(
    CollectionReference<Champion> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Champion> get reference =>
      super.reference as CollectionReference<Champion>;

  @override
  ChampionDocumentReference doc([String? id]) {
    return ChampionDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ChampionDocumentReference> add(Champion value) {
    return reference.add(value).then((ref) => ChampionDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ChampionCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ChampionDocumentReference
    extends FirestoreDocumentReference<ChampionDocumentSnapshot> {
  factory ChampionDocumentReference(DocumentReference<Champion> reference) =
      _$ChampionDocumentReference;

  DocumentReference<Champion> get reference;

  /// A reference to the [ChampionCollectionReference] containing this document.
  ChampionCollectionReference get parent {
    return _$ChampionCollectionReference(reference.firestore);
  }

  @override
  Stream<ChampionDocumentSnapshot> snapshots();

  @override
  Future<ChampionDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String id,
    String name,
    String description,
    String imageUrl,
    List<Object?> props,
  });

  Future<void> set(Champion value);
}

class _$ChampionDocumentReference
    extends FirestoreDocumentReference<ChampionDocumentSnapshot>
    implements ChampionDocumentReference {
  _$ChampionDocumentReference(this.reference);

  @override
  final DocumentReference<Champion> reference;

  /// A reference to the [ChampionCollectionReference] containing this document.
  ChampionCollectionReference get parent {
    return _$ChampionCollectionReference(reference.firestore);
  }

  @override
  Stream<ChampionDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return ChampionDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<ChampionDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return ChampionDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? id = _sentinel,
    Object? name = _sentinel,
    Object? description = _sentinel,
    Object? imageUrl = _sentinel,
    Object? props = _sentinel,
  }) async {
    final json = {
      if (id != _sentinel) "id": id as String,
      if (name != _sentinel) "name": name as String,
      if (description != _sentinel) "description": description as String,
      if (imageUrl != _sentinel) "imageUrl": imageUrl as String,
      if (props != _sentinel) "props": props as List<Object?>,
    };

    return reference.update(json);
  }

  Future<void> set(Champion value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is ChampionDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class ChampionDocumentSnapshot extends FirestoreDocumentSnapshot {
  ChampionDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Champion> snapshot;

  @override
  ChampionDocumentReference get reference {
    return ChampionDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Champion? data;
}

abstract class ChampionQuery implements QueryReference<ChampionQuerySnapshot> {
  @override
  ChampionQuery limit(int limit);

  @override
  ChampionQuery limitToLast(int limit);

  ChampionQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ChampionQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ChampionQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ChampionQuery whereImageUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ChampionQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Object?>? arrayContainsAny,
  });

  ChampionQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ChampionDocumentSnapshot? startAtDocument,
    ChampionDocumentSnapshot? endAtDocument,
    ChampionDocumentSnapshot? endBeforeDocument,
    ChampionDocumentSnapshot? startAfterDocument,
  });

  ChampionQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ChampionDocumentSnapshot? startAtDocument,
    ChampionDocumentSnapshot? endAtDocument,
    ChampionDocumentSnapshot? endBeforeDocument,
    ChampionDocumentSnapshot? startAfterDocument,
  });

  ChampionQuery orderByDescription({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ChampionDocumentSnapshot? startAtDocument,
    ChampionDocumentSnapshot? endAtDocument,
    ChampionDocumentSnapshot? endBeforeDocument,
    ChampionDocumentSnapshot? startAfterDocument,
  });

  ChampionQuery orderByImageUrl({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ChampionDocumentSnapshot? startAtDocument,
    ChampionDocumentSnapshot? endAtDocument,
    ChampionDocumentSnapshot? endBeforeDocument,
    ChampionDocumentSnapshot? startAfterDocument,
  });

  ChampionQuery orderByProps({
    bool descending = false,
    List<Object?> startAt,
    List<Object?> startAfter,
    List<Object?> endAt,
    List<Object?> endBefore,
    ChampionDocumentSnapshot? startAtDocument,
    ChampionDocumentSnapshot? endAtDocument,
    ChampionDocumentSnapshot? endBeforeDocument,
    ChampionDocumentSnapshot? startAfterDocument,
  });
}

class _$ChampionQuery extends QueryReference<ChampionQuerySnapshot>
    implements ChampionQuery {
  _$ChampionQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Champion> reference;

  ChampionQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Champion> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return ChampionQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<ChampionDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: ChampionDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return ChampionQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<ChampionQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<ChampionQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  ChampionQuery limit(int limit) {
    return _$ChampionQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  ChampionQuery limitToLast(int limit) {
    return _$ChampionQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  ChampionQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ChampionQuery(
      reference.where(
        'id',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ChampionQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ChampionQuery(
      reference.where(
        'name',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ChampionQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ChampionQuery(
      reference.where(
        'description',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ChampionQuery whereImageUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ChampionQuery(
      reference.where(
        'imageUrl',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ChampionQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Object?>? arrayContainsAny,
  }) {
    return _$ChampionQuery(
      reference.where(
        'props',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  ChampionQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChampionDocumentSnapshot? startAtDocument,
    ChampionDocumentSnapshot? endAtDocument,
    ChampionDocumentSnapshot? endBeforeDocument,
    ChampionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('id', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ChampionQuery(query, _collection);
  }

  ChampionQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChampionDocumentSnapshot? startAtDocument,
    ChampionDocumentSnapshot? endAtDocument,
    ChampionDocumentSnapshot? endBeforeDocument,
    ChampionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ChampionQuery(query, _collection);
  }

  ChampionQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChampionDocumentSnapshot? startAtDocument,
    ChampionDocumentSnapshot? endAtDocument,
    ChampionDocumentSnapshot? endBeforeDocument,
    ChampionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('description', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ChampionQuery(query, _collection);
  }

  ChampionQuery orderByImageUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChampionDocumentSnapshot? startAtDocument,
    ChampionDocumentSnapshot? endAtDocument,
    ChampionDocumentSnapshot? endBeforeDocument,
    ChampionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('imageUrl', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ChampionQuery(query, _collection);
  }

  ChampionQuery orderByProps({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChampionDocumentSnapshot? startAtDocument,
    ChampionDocumentSnapshot? endAtDocument,
    ChampionDocumentSnapshot? endBeforeDocument,
    ChampionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('props', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ChampionQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$ChampionQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ChampionQuerySnapshot
    extends FirestoreQuerySnapshot<ChampionQueryDocumentSnapshot> {
  ChampionQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Champion> snapshot;

  @override
  final List<ChampionQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ChampionDocumentSnapshot>> docChanges;
}

class ChampionQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements ChampionDocumentSnapshot {
  ChampionQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Champion> snapshot;

  @override
  ChampionDocumentReference get reference {
    return ChampionDocumentReference(snapshot.reference);
  }

  @override
  final Champion data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Champion _$ChampionFromJson(Map<String, dynamic> json) => Champion(
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$ChampionToJson(Champion instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
