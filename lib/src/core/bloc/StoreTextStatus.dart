import 'package:equatable/equatable.dart';

class StoreTextStatus extends Equatable {
  final clearText;
  final loadingText;
  final loadedText;
  final savedText;

  const StoreTextStatus({
    this.clearText = false,
    this.loadingText = false,
    this.loadedText = "Sin cargar...",
    this.savedText = false,
  });

  StoreTextStatus copyWith({
    bool? cleanText,
    bool? loadingText,
    String? loadedText,
    bool? savedText,
  }) {
    return StoreTextStatus(
      clearText: cleanText ?? this.clearText,
      loadingText: loadingText ?? this.loadingText,
      loadedText: loadedText ?? this.loadedText,
      savedText: savedText ?? this.savedText,
    );
  }

  @override
  List<Object> get props => [clearText, loadedText, loadingText];
}
