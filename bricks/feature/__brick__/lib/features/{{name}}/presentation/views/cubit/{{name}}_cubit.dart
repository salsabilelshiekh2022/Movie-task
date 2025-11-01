
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/{{name}}_repo.dart';
import '../../../../../core/enums/request_status.dart';



part '{{name}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit({required {{name.pascalCase()}}Repo {{name.camelCase()}}Repo})
    : _repo = {{name.camelCase()}}Repo,
      super(const {{name.pascalCase()}}State());
  final {{name.pascalCase()}}Repo _repo;

 
}