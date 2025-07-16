import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_me/config/theme_cubit/theme_cubit.dart';
import 'package:help_me/features/auth/presentation/cubit/user_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              return Row(
                children: [
                  if (state.avatarUrl != null && state.avatarUrl!.isNotEmpty)
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(state.avatarUrl ?? ''),
                    ),
                  const SizedBox(width: 8.0),
                  Text('Bem-vindo, ${state.firstName ?? 'Usuário'}!'),
                ],
              );
            } else if (state is UserLoading) {
              return const CircularProgressIndicator();
            } else if (state is UserError) {
              return Text('Erro: ${state.message}');
            }
            return const Text('Home Page');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        ],
      ),
      body: const Center(child: Text('You are on the Home Page!')),
    );
  }
}
