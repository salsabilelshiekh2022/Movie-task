part of '{{name}}_cubit.dart';

class {{name.pascalCase()}}State extends Equatable {
  final RequestStatus {{name.camelCase()}}Status;
  final String? errorMessage;

  const {{name.pascalCase()}}State({this.{{name.camelCase()}}Status = RequestStatus.initial, this.errorMessage});

  {{name.pascalCase()}}State copyWith({RequestStatus? {{name.camelCase()}}Status, String? errorMessage}) {
    return {{name.pascalCase()}}State(
      {{name.camelCase()}}Status: {{name.camelCase()}}Status ?? this.{{name.camelCase()}}Status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [{{name.camelCase()}}Status, errorMessage];
}
