import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';

class NoteForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController bodyController;

  const NoteForm({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.bodyController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: titleController,
            validator: (String? val) => val == null || val.isEmpty
                ? AppStrings.noteTitleRequired
                : null,
            decoration: const InputDecoration(labelText: AppStrings.title),
          ),
          TextFormField(
            controller: bodyController,
            validator: (String? val) =>
                val == null || val.isEmpty ? AppStrings.noteBodyRequired : null,
            decoration: const InputDecoration(labelText: AppStrings.body),
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
