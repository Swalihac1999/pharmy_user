part of 'collection_bloc.dart';

@immutable
abstract class CollectionState {}

class CollectionInitial extends CollectionState {}

class ProductAddSucces extends CollectionState {}

class ProductAddFiled extends CollectionState {}
