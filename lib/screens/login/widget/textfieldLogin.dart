import 'package:flutter/material.dart';

class TextfieldLogin extends StatelessWidget {
  final String title;
  final String textHint;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  const TextfieldLogin(
      {Key? key,
      required this.title,
      required this.textHint,
      required this.keyboardType,
      this.validator,
      this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secondary = Theme.of(context).colorScheme.secondary;
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 8.0), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: secondary, fontSize: 16),
          ),
          const SizedBox(height: 8), 
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: textHint,
              contentPadding: const EdgeInsets.all(20),
            ),
            validator: validator,
            onSaved: onSaved,
          ),
        ],
      ),
    );
  }
}
