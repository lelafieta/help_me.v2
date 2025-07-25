// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';

// import '../../../../app/app_entity.dart';
// import '../../../../config/routes/app_routes.dart';
// import '../../../../config/themes/app_colors.dart';
// import '../../../../core/resources/icons/app_icons.dart';
// import '../../../../core/utils/app_utils.dart';
// import '../cubit/auth_cubit.dart';
// import '../cubit/auth_state.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormBuilderState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: BlocConsumer<AuthCubit, AuthState>(
//           listener: (context, state) {
//             EasyLoading.dismiss();
//             if (state is AuthLoading) {
//               EasyLoading.show(
//                   status: "Autenticando...",
//                   maskType: EasyLoadingMaskType.black);
//             } else if (state is AuthFailure) {
//               EasyLoading.showError(state.failure);
//             } else if (state is Authenticated) {
//               AppEntity.uid = state.user!.id;
//               Get.toNamed(AppRoutes.solidaryRoute);
//             }
//           },
//           builder: (context, state) {
//             return Center(
//               child: SingleChildScrollView(
//                 child: FormBuilder(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Text(
//                         'Ajuda-me',
//                         style: TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.primaryColor,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(
//                         'Suas ações importam. Junte-se a nós em nossa missão de criar um impacto positivo e elevar vidas.',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       const SizedBox(height: 32),
//                       FormBuilderTextField(
//                         name: "email",
//                         decoration: InputDecoration(
//                           hintText: "Email",
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                           ),
//                           prefixIcon: Padding(
//                             padding: const EdgeInsets.all(12),
//                             child: SvgPicture.asset(
//                               AppIcons.envelope,
//                               width: 18,
//                               color: AppColors.grey,
//                             ),
//                           ),
//                         ),
//                         validator: FormBuilderValidators.compose([
//                           FormBuilderValidators.required(
//                               errorText: "Campo obrigatório"),
//                           FormBuilderValidators.email(
//                               errorText: "E-mail inválido"),
//                         ]),
//                       ),
//                       const SizedBox(height: 16),
//                       FormBuilderTextField(
//                         name: "password",
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           hintText: "Password",
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                           ),
//                           prefixIcon: Padding(
//                             padding: const EdgeInsets.all(12),
//                             child: SvgPicture.asset(
//                               AppIcons.key,
//                               width: 18,
//                               color: AppColors.grey,
//                             ),
//                           ),
//                         ),
//                         validator: FormBuilderValidators.required(
//                             errorText: "Campo obrigatório"),
//                       ),
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: true,
//                             onChanged: (bool? value) {},
//                           ),
//                           const Text('Enviar-me atualizações no WhatsApp')
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       const Row(
//                         children: [
//                           Expanded(child: Divider()),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 8.0),
//                             child: Text('Or'),
//                           ),
//                           Expanded(child: Divider()),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: IconButton(
//                               icon: SvgPicture.asset(
//                                 AppIcons.gmail,
//                                 width: 35,
//                               ),
//                               onPressed: () {
//                                 // context.read<AuthCubit>().loginWithGoogle();
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       GestureDetector(
//                         onTap: () {},
//                         child: const Text(
//                           'Já tem uma conta? Entrar',
//                           style: TextStyle(
//                             decoration: TextDecoration.underline,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 32),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             if (_formKey.currentState?.saveAndValidate() ??
//                                 false) {
//                               final email =
//                                   _formKey.currentState?.value['email'];
//                               final password =
//                                   _formKey.currentState?.value['password'];
//                               context.read<AuthCubit>().login(email, password);
//                             } else {
//                               AppUtils.errorToast(
//                                   "Por favor, preencha todos os campos corretamente.");
//                             }
//                           },
//                           child: const Text(
//                             'Continuar',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(
//                         'Ao continuar, você concorda com nossos Termos de Serviço e Política de Privacidade',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 12, color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../app/app_entity.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../core/resources/icons/app_icons.dart';
import '../../../../core/utils/app_utils.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isEmailTab = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF5EF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            EasyLoading.dismiss();
            if (state is AuthLoading) {
              EasyLoading.show(
                status: "Autenticando...",
                maskType: EasyLoadingMaskType.black,
              );
            } else if (state is AuthFailure) {
              EasyLoading.showError(state.failure);
            } else if (state is Authenticated) {
              AppEntity.uid = state.user!.id;
              Get.toNamed(AppRoutes.solidaryRoute);
            }
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      // Logo
                      Image.asset('assets/logo.png', height: 80),
                      const SizedBox(height: 8),
                      const Text(
                        'cha•cha',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 40),

                      const Text(
                        'Iniciar uma conta',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Abas Email / Telefone
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isEmailTab = true),
                              child: Column(
                                children: [
                                  Text(
                                    'Email address',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: isEmailTab
                                          ? Colors.green
                                          : Colors.grey[600],
                                    ),
                                  ),
                                  if (isEmailTab)
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      height: 2,
                                      color: Colors.green,
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isEmailTab = false),
                              child: Column(
                                children: [
                                  Text(
                                    'Mobile phone',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: !isEmailTab
                                          ? Colors.green
                                          : Colors.grey[600],
                                    ),
                                  ),
                                  if (!isEmailTab)
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      height: 2,
                                      color: Colors.green,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      FormBuilderTextField(
                        name: isEmailTab ? "email" : "phone",
                        keyboardType: isEmailTab
                            ? TextInputType.emailAddress
                            : TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: isEmailTab
                              ? "Entre com seu e-mail"
                              : "Enter your phone number",
                          prefixIcon: Container(
                            margin: EdgeInsets.all(8),
                            // padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(.1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SvgPicture.asset(
                                isEmailTab
                                    ? Assets.icons.email2
                                    : Assets.icons.mobile3,
                                width: 10,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        validator: isEmailTab
                            ? FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: "Campo obrigatório",
                                ),
                                FormBuilderValidators.email(
                                  errorText: "E-mail inválido",
                                ),
                              ])
                            : FormBuilderValidators.required(
                                errorText: "Campo obrigatório",
                              ),
                      ),
                      const SizedBox(height: 16),

                      FormBuilderTextField(
                        name: "password",
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          prefixIcon: Container(
                            margin: EdgeInsets.all(8),
                            // padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(.1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                Assets.icons.padlock,
                                width: 12,
                                color: Colors.yellow.shade700,
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        validator: FormBuilderValidators.required(
                          errorText: "Campo obrigatório",
                        ),
                      ),

                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (bool? value) {}),
                          const Text('Enviar-me atualizações no WhatsApp'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('Ou continue com'),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialButton(Assets.icons.google),
                          const SizedBox(width: 16),
                          _socialButton(Assets.icons.facebook2),
                        ],
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState?.saveAndValidate() ??
                                false) {
                              final email =
                                  _formKey.currentState?.value['email'];
                              final password =
                                  _formKey.currentState?.value['password'];
                              context.read<AuthCubit>().login(email, password);
                            } else {
                              AppUtils.errorToast(
                                "Por favor, preencha todos os campos corretamente.",
                              );
                            }
                          },
                          child: const Text(
                            'Entrar Agora',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {},
                        child: const Text.rich(
                          TextSpan(
                            text: 'Already have an account? ',
                            children: [
                              TextSpan(
                                text: 'Log in here.',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _socialButton(String assetPath) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
        icon: SvgPicture.asset(assetPath, width: 24),
        onPressed: () {
          // ex: context.read<AuthCubit>().loginWithGoogle();
        },
      ),
    );
  }
}
