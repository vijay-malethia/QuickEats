import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

//
import 'auth_viewmodel.dart';
import 'widgets/auth_fields.dart';
import 'package:quick_eats/ui/views/auth/layout/logo.dart';

class AuthView extends StackedView<AuthViewModel> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AuthViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: body(viewModel),
    );
  }

  SafeArea body(viewModel) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const AuthLogo(),
              AuthFields(viewModel),
            ],
          ),
        ),
      ),
    );
  }

  @override
  AuthViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AuthViewModel();
}
