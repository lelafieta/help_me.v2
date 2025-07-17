import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_me/config/router/app_router.dart';
import 'package:help_me/config/themes/theme_cubit/theme_cubit.dart';
import 'package:help_me/features/auth/presentation/cubit/user_cubit.dart';

class HomeTabContentPage extends StatelessWidget {
  const HomeTabContentPage({super.key});

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You are on the Home Page!!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.categoryRoute);
              },
              child: const Text('Ver Categorias'),
            ),
          ],
        ),
      ),
    );
  }
}
