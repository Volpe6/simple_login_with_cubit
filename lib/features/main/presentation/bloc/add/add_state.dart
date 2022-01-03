part of 'add_cubit.dart';

class AddState {
  final String title;
  final String subtitle;
  final String content;
  
  AddState({ required this.title, required this.subtitle, required this.content});

  factory AddState.init() {
    return AddState(
      title: "",
      subtitle: "",
      content:""
    );
  }
  
  AddState copyWith({
    String? title,
    String? subtitle,
    String? content
  }) {
    return AddState(
      title: title??this.title,
      subtitle: subtitle??this.subtitle,
      content: content??this.content
    );
  }
}