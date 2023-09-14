

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Note extends Equatable {
   Note({
    required this.id,
    required this.title,
    required this.description,
    this.color
  });

  final String title;
  final String description;
  final int id;
  Color? color;

  @override
  List<Object?> get props => [id, title, description, color];
}
