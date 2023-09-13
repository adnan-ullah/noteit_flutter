import 'package:equatable/equatable.dart';

class Note extends Equatable {
  const Note({
    required this.id,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
  final int id;

  @override
  List<Object?> get props => [id, title, description];
}
