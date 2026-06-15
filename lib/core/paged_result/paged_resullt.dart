//used in domain/entities
import 'package:equatable/equatable.dart';

class PagedResullt<T> extends Equatable{
  final int page;
  final List<T> results;
  final int totalPage;
  final int totalResults;
  const PagedResullt({
    this.page = 0,
    required this.results,
    this.totalPage = 0,
    this.totalResults = 0,
  });
  
  @override
  List<Object?> get props => [page,results,totalPage,totalResults];
}
