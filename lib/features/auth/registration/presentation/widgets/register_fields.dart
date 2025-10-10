import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/auth/registration/presentation/bloc/register_bloc.dart';
import 'package:to_do_app/features/auth/registration/presentation/bloc/register_event.dart';

import '../../../../../core/themes/dimens.dart';
import '../../../../../core/widgets/hint_text_widget.dart';
import '../../../../../core/widgets/text_field_widget.dart';

class RegisterFields extends StatelessWidget {
  const RegisterFields({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegisterBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height24),
        HintTextWidget(text: 'Name'),
        SizedBox(height: height8),
        TextFieldWidget(
          labelText: 'Lucas',
          inputType: TextInputType.name,
          onTyped: (value) => bloc.add(NameChanged(value)),
        ),
        SizedBox(height: height16),
        HintTextWidget(text: 'Email Address'),
        SizedBox(height: height8),
        TextFieldWidget(
          labelText: 'example@email.com',
          inputType: TextInputType.emailAddress,
          onTyped: (value) => bloc.add(EmailChanged(value)),
        ),
        SizedBox(height: height16),
        HintTextWidget(text: 'Password'),
        SizedBox(height: height8),
        TextFieldWidget(
          labelText: 'Create a Password',
          inputType: TextInputType.visiblePassword,
          onTyped: (value) => bloc.add(PasswordChanged(value)),
        ),
        SizedBox(height: height16),
        TextFieldWidget(
          labelText: 'Confirm Password',
          inputType: TextInputType.visiblePassword,
          onTyped: (value) => bloc.add(ConfirmPasswordChanged(value)),
        ),
      ],
    );
  }
}
