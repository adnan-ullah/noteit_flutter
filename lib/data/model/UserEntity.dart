import 'package:objectbox/objectbox.dart';

@Entity()
class UserEntity  {

   UserEntity({
     this.id,
     this.title,
     this.description,

  });

  @Id()
  int? id;

    String? title;

    String? description;


}

