import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/share/required_text.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

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
  const LabeledField.password({
    required String label,
    required String hint,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
    TextInputAction? textInputAction,
    bool required = false,
    AutovalidateMode autoValidateMode = .onUserInteraction,
    Key? key,
  }) : this(
         label: label,
         hint: hint,
         controller: controller,
         textInputAction: textInputAction,
         required: required,
         validator: validator,
         autoValidateMode: autoValidateMode,
         obscureText: true,
         key: key,
       );

  @override
  State<LabeledField> createState() => _LabeledFieldState();
}

class _LabeledFieldState extends State<LabeledField> {
  late final _obscured = ValueNotifier(widget.obscureText);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 6,
      children: [
        RequiredText(text: widget.label, required: widget.required),
        ValueListenableBuilder(
          valueListenable: _obscured,
          builder: (_, obscured, _) {
            return TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              autovalidateMode: widget.autoValidateMode,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              textCapitalization: widget.textCapitalization,
              obscureText: obscured,
              decoration: InputDecoration(
                hintText: widget.hint,
                suffixIcon: widget.obscureText
                    ? IconButton(
                        onPressed: () {
                          _obscured.value = !obscured;
                        },
                        tooltip: obscured ? 'Mostrar senha' : 'Ocultar senha',
                        icon: Icon(
                          obscured
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 18,
                          color: AppColors.grayText,
                        ),
                      )
                    : null,
              ),
            );
          },
        ),
      ],
    );
  }
}
