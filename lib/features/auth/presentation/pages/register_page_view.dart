import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talkr_chat_app/features/auth/domain/entities/auth_helper.dart';
import 'package:talkr_chat_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:talkr_chat_app/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:talkr_chat_app/features/main/presentation/widgets/custom_text_field.dart';
import 'package:talkr_chat_app/injection.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  final AuthCubit authCubit = getIt<AuthCubit>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: authCubit,
        listener: (BuildContext context, state) {
          if (state is UserAuthenticated) {}
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/talkr_logo.svg",
                height: 100,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                controller: emailController,
                hintText: "Email",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: "Password",
                obscured: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextButton(
                text: "Register",
                onPressed: () async {
                  authCubit.register(AuthHelper(
                      email: emailController.text,
                      password: passwordController.text));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
