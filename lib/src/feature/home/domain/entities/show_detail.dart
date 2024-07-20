import 'package:equatable/equatable.dart';

class ShowDetail extends Equatable {
  const ShowDetail({
    required this.id,
    required this.name, 
    required this.url, 
    required this.type, 
    required this.language,
    required this.summary,
  });

  final int id;
  final String name;
  final String url;
  final String type;
  final String language;
  final String summary;
  
  @override
  List<Object?> get props => [
    id,
    name,
    url,
    type,
    language,
  ];
}
