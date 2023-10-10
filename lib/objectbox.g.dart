// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'data/model/product/ProductEntity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(3, 6164021053374449473),
      name: 'ProductEntity',
      lastPropertyId: const IdUid(11, 2742919739488250633),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8043429182291713850),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 228953264236611203),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2292287436869268414),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2180606330838756805),
            name: 'discountPercentage',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8781652042973682397),
            name: 'stock',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 8643844271382368172),
            name: 'brand',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 951399966229928176),
            name: 'category',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 5189030817531592209),
            name: 'thumbnail',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 677769398469923988),
            name: 'images',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 6900771166403315223),
            name: 'price',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 2742919739488250633),
            name: 'rating',
            type: 8,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 6164021053374449473),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [1530723527421059779, 1630201017835985052],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        5886488971388665040,
        222031384392468797,
        6623145126502543265,
        8372218341338129593,
        3971746479613676770,
        2366093300643570808,
        5327418147435784584,
        2039923194924771340,
        1296112713202235994,
        4138670837695715391,
        4464759708449479120,
        2997341497105518439
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ProductEntity: EntityDefinition<ProductEntity>(
        model: _entities[0],
        toOneRelations: (ProductEntity object) => [],
        toManyRelations: (ProductEntity object) => {},
        getId: (ProductEntity object) => object.id,
        setId: (ProductEntity object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field ProductEntity.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (ProductEntity object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final descriptionOffset = fbb.writeString(object.description);
          final brandOffset = fbb.writeString(object.brand);
          final categoryOffset = fbb.writeString(object.category);
          final thumbnailOffset = fbb.writeString(object.thumbnail);
          final imagesOffset = fbb.writeList(
              object.images.map(fbb.writeString).toList(growable: false));
          fbb.startTable(12);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.addFloat64(3, object.discountPercentage);
          fbb.addInt64(4, object.stock);
          fbb.addOffset(5, brandOffset);
          fbb.addOffset(6, categoryOffset);
          fbb.addOffset(7, thumbnailOffset);
          fbb.addOffset(8, imagesOffset);
          fbb.addFloat64(9, object.price);
          fbb.addFloat64(10, object.rating);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final descriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final priceParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 22, 0);
          final discountPercentageParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final ratingParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 24, 0);
          final stockParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final brandParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 14, '');
          final categoryParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 16, '');
          final thumbnailParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 18, '');
          final imagesParam = const fb.ListReader<String>(
                  fb.StringReader(asciiOptimization: true),
                  lazy: false)
              .vTableGet(buffer, rootOffset, 20, []);
          final object = ProductEntity(
              id: idParam,
              title: titleParam,
              description: descriptionParam,
              price: priceParam,
              discountPercentage: discountPercentageParam,
              rating: ratingParam,
              stock: stockParam,
              brand: brandParam,
              category: categoryParam,
              thumbnail: thumbnailParam,
              images: imagesParam);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ProductEntity] entity fields to define ObjectBox queries.
class ProductEntity_ {
  /// see [ProductEntity.id]
  static final id =
      QueryIntegerProperty<ProductEntity>(_entities[0].properties[0]);

  /// see [ProductEntity.title]
  static final title =
      QueryStringProperty<ProductEntity>(_entities[0].properties[1]);

  /// see [ProductEntity.description]
  static final description =
      QueryStringProperty<ProductEntity>(_entities[0].properties[2]);

  /// see [ProductEntity.discountPercentage]
  static final discountPercentage =
      QueryDoubleProperty<ProductEntity>(_entities[0].properties[3]);

  /// see [ProductEntity.stock]
  static final stock =
      QueryIntegerProperty<ProductEntity>(_entities[0].properties[4]);

  /// see [ProductEntity.brand]
  static final brand =
      QueryStringProperty<ProductEntity>(_entities[0].properties[5]);

  /// see [ProductEntity.category]
  static final category =
      QueryStringProperty<ProductEntity>(_entities[0].properties[6]);

  /// see [ProductEntity.thumbnail]
  static final thumbnail =
      QueryStringProperty<ProductEntity>(_entities[0].properties[7]);

  /// see [ProductEntity.images]
  static final images =
      QueryStringVectorProperty<ProductEntity>(_entities[0].properties[8]);

  /// see [ProductEntity.price]
  static final price =
      QueryDoubleProperty<ProductEntity>(_entities[0].properties[9]);

  /// see [ProductEntity.rating]
  static final rating =
      QueryDoubleProperty<ProductEntity>(_entities[0].properties[10]);
}