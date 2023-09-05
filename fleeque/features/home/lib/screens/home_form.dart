import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:app_bar/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/bloc/home_bloc.dart';
import 'package:home/screens/widgets/bold_text.dart';
import 'package:home/screens/widgets/popular_button.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeForm();
}

class _HomeForm extends State<HomeForm> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(Init());
    super.initState();
  }

  clickk() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        backgroundColor: black,
        isOnline: true,
        isDiscontShown: true,
        isWalletShown: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Text('loading');
          }
          if (state is Error) {
            return const Text('error');
          }

          if (state is Success) {
            return _body();
          }
          return _body();
        },
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        const Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PopularButtonWidget(),
              BoldTextWidget(text: 'Swipe to explore Influencers'),
            ],
          ),
        ),

        ElevatedButtonWidget(
          width: 335,
          borderColor: black,
          backgroundColor: black,
          textColor: white,
          text: 'SEE MORE',
          onPressed: () => {clickk()},
        ),
        const Spacer(),
        //Image.network(urlImage),
      ],
    );
  }
}




// import 'package:authentification/sign_in_page/bloc/sign_in_bloc.dart';
// import 'package:authentification/sign_in_page/screens/widgets/forgot_password.dart';
// import 'package:authentification/widgets/google_sign_in_button.dart';
// import 'package:authentification/sign_in_page/screens/widgets/loading.dart';
// import 'package:authentification/widgets/change_page.dart';
// import 'package:authentification/widgets/home_screen.dart';
// import 'package:authentification/widgets/intro_text.dart';
// import 'package:authentification/widgets/submit_button.dart';
// import 'package:authentification/widgets/text_input.dart';
// import 'package:authentification/sign_in_page/screens/widgets/error.dart';
// import 'package:core/core.dart';
// import 'package:domain/entities/authentification/authentification_entities.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SignInForm extends StatefulWidget {
//   const SignInForm({Key? key}) : super(key: key);

//   @override
//   State<SignInForm> createState() => _SignInForm();
// }

// class _SignInForm extends State<SignInForm> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void initState() {
//     BlocProvider.of<SignInBloc>(context).add(Init());
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void submitSignIn() {
//     if (_emailController.text.isNotEmpty &&
//         _passwordController.text.isNotEmpty) {
//       BlocProvider.of<SignInBloc>(context).add(
//         SubmitSignIn(
//           UserEntity(
//             email: _emailController.text,
//             password: _passwordController.text,
//           ),
//         ),
//       );
//     }
//   }

//   void submitSignInGoogle() {
//     BlocProvider.of<SignInBloc>(context).add(SubmitGoogleSignIn());
//   }

//   void logOut() {
//     BlocProvider.of<SignInBloc>(context).add(
//       LoggedOut(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<SignInBloc, SignInState>(
//         builder: (context, state) {
//           if (state is Authenticated) {
//             return HomeScreen(
//               callback: () => logOut(),
//               uid: state.uid,
//             );
//           }
//           if (state is Unauthenticated) {
//             return _body();
//           }

//           if (state is Success) {
//             BlocProvider.of<SignInBloc>(context).add(
//               LoggedIn(),
//             );
//           }
//           return _body();
//         },
//       ),
//     );
//   }

//   Widget _body() {
//     return Scaffold(
//       body: SizedBox(
//         height: double.infinity,
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Spacer(),
//             const Expanded(
//                 flex: 6,
//                 child: IntroTextWidget(
//                   text: 'Login with your credentials',
//                 )),
//             const Spacer(),
//             const LoadingWidget(),
//             Expanded(
//               flex: 1,
//               child: TextInputWidget(
//                 obscureText: false,
//                 labelText: 'EMAIL',
//                 controller: _emailController,
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: TextInputWidget(
//                 obscureText: true,
//                 labelText: 'PASSWORD',
//                 controller: _passwordController,
//               ),
//             ),
//             const ErrorSignInWidget(),
//             ChangePageWidget(
//                 questionText: 'Don’t have an account ?',
//                 buttonText: 'Sign Up!',
//                 callback: () => Navigator.pushNamed(
//                       context,
//                       signUpRoute,
//                     )),
//             const ForgotPasswordWidget(),
//             const Spacer(),
//             const Spacer(),
//             GoogleSignInButtonWidget(
//               callback: () => submitSignInGoogle(),
//             ),
//             const Spacer(),
//             SubmitButtonWidget(text: 'LOGIN', callback: () => submitSignIn()),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }