// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ParameterState extends Equatable {
  final String server;
  final String api;
  final String apiPagination;

  const ParameterState({this.server= '', this.api = '', this.apiPagination = ''});
  
  @override
  List<Object?> get props => [server, api];

  ParameterState copyWith({
    String? server,
    String? api,
    String? apiPagination,
  }) {
    return ParameterState(
      server: server ?? this.server,
      api: api ?? this.api,
      apiPagination: apiPagination ?? this.apiPagination,
    );
  }
}
