/// Base transformer class for transforming data model to entity and vice versa
abstract class BaseTransformer<DataType, EntityType> {
  /// transform the data model to entity
  EntityType transformToEntity(DataType model);

  /// transform the entity to data model
  DataType transformToModel(EntityType entity);

  /// transform the data model list to entity list
  List<EntityType> transformToEntityList(List<DataType> models);
}
