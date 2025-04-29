import 'package:equatable/equatable.dart';

import 'hc_group.dart';

class UiConfig extends Equatable {
  const UiConfig({
    required this.id,
    required this.formattedDesc,
    required this.hcGroups,
    this.slug = '',
    this.title = '',
    this.description = '',
    this.assets = '',
    this.formattedTitle = '',
  });

  final int id;
  final String slug;
  final String title;
  final String formattedTitle;
  final String description;
  final String formattedDesc;
  final String assets;
  final List<HcGroup> hcGroups;

  @override
  List<Object?> get props => [id, slug];
}
