import 'package:movie_task/core/database/network/api_consumer.dart';
import 'package:injectable/injectable.dart';

import '{{name}}_repo.dart';

@LazySingleton(as: {{name.pascalCase()}}Repo)
class {{name.pascalCase()}}RepoImpl implements {{name.pascalCase()}}Repo {
  {{name.pascalCase()}}RepoImpl({required this.apiConsumer});
  final ApiConsumer apiConsumer;
}
