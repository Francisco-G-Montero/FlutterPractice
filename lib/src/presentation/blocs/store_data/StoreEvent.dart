import 'package:equatable/equatable.dart';

class StoreEvent extends Equatable {
  const StoreEvent();

  @override
  List<Object?> get props => [];
}

class GetText extends StoreEvent {
  const GetText();
}

class SaveText extends StoreEvent {
  final String saveText;
  const SaveText(this.saveText);
}