import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/password_bloc/password_bloc.dart';

class ToggleSelection extends StatelessWidget {
  const ToggleSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordCubit(),
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: BlocBuilder<PasswordCubit, bool>(
              builder: (context, state) {
                return TextField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<PasswordCubit>().changeVisibility();
                      },
                      icon: Icon(
                        state ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
