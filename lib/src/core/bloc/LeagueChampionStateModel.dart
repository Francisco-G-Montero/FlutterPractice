import 'package:equatable/equatable.dart';

class LeagueChampionStateModel extends Equatable{
  final bool isLoading;
  final String message;

  const LeagueChampionStateModel({this.message = "",this.isLoading = false});

  @override
  List<Object?> get props => [isLoading, message];

  LeagueChampionStateModel copyWith({
    bool? isLoading,
    String? message,
  }) {
    return LeagueChampionStateModel(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
    );
  }
}