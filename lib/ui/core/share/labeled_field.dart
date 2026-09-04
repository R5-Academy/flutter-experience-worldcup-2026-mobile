import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/share/required_text.dart';

class const LabeledField({
  super.key,
  required final String label,
  final String? hint,
  final TextEditingController? controller,
  final FormFieldValidator<String>? validator,
  final TextInputType? keyboardType,
  final TextInputAction? textInputAction,
  final TextCapitalization textCapitalization = .none,
  final bool obscureText = false,
  final bool required = false,
  final AutovalidateMode autoValidateMode = .onUserInteraction,
}) extends StatefulWidget {
  @override
  State<LabeledField> createState() => _LabeledFieldState();
}

class _LabeledFieldState extends State<LabeledField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 6,
      children: [
        RequiredText(text: widget.label, required: widget.required),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          autovalidateMode: widget.autoValidateMode,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          obscureText: widget.obscureText,
          decoration: InputDecoration(hintText: widget.hint),
        ),
      ],
    );
  }
}
