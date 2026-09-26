import 'package:fitjournal/const/colors/appColors.dart';
import 'package:fitjournal/providers/login_provider.dart';
import 'package:fitjournal/widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key ,required this._formKey, required this._lastnamecontroller, required this._namecontroller});
  final TextEditingController _namecontroller;
  final TextEditingController _lastnamecontroller;
  final _formKey;
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: Appcolors.whiteOpacity30),
            right: BorderSide(color: Appcolors.whiteOpacity30),
          ),
          color: Appcolors.liquidglassColor,
          borderRadius: BorderRadius.circular(50),
        ),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 18),
          child: Form(
            key:widget._formKey,
            child: Column(
              children: [
                Row(
                  spacing: 6,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<LoginProvider>().onLoginChanged(0);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 0),
                        decoration: BoxDecoration(
                          border:
                              context.watch<LoginProvider>().loginnRegister == 1
                              ? Border(
                                  top: BorderSide(
                                    color: Appcolors.whiteOpacity65,
                                  ),
                                  bottom: BorderSide(
                                    color: Appcolors.whiteOpacity65,
                                  ),
                                )
                              : Border.all(color: Appcolors.primary),
                          boxShadow: [
                            BoxShadow(
                              color: Appcolors.whiteOpacity20,
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color:
                              context.watch<LoginProvider>().loginnRegister == 0
                              ? Appcolors.containerColor2
                              : Appcolors.containerColor,
                        ),
                        height: MediaQuery.sizeOf(context).height * 0.04,
                        width: MediaQuery.sizeOf(context).width * 0.38,
                        child: Center(
                          child: Text(
                            'Вход',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color:
                                  context
                                          .watch<LoginProvider>()
                                          .loginnRegister ==
                                      0
                                  ? Appcolors.lightWhite
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<LoginProvider>().onLoginChanged(1);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 0),
                        decoration: BoxDecoration(
                          border:
                              context.watch<LoginProvider>().loginnRegister == 0
                              ? Border(
                                  top: BorderSide(
                                    color: Appcolors.whiteOpacity65,
                                  ),
                                  bottom: BorderSide(
                                    color: Appcolors.whiteOpacity65,
                                  ),
                                )
                              : Border.all(color: Appcolors.primary),
                          boxShadow: [
                            BoxShadow(
                              color: Appcolors.whiteOpacity20,
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color:
                              context.watch<LoginProvider>().loginnRegister == 1
                              ? Appcolors.containerColor2
                              : Appcolors.containerColor,
                        ),
                        height: MediaQuery.sizeOf(context).height * 0.04,
                        width: MediaQuery.sizeOf(context).width * 0.38,
                        child: Center(
                          child: Text(
                            'Регистрация',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color:
                                  context
                                          .watch<LoginProvider>()
                                          .loginnRegister ==
                                      1
                                  ? Appcolors.lightWhite
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                context.watch<LoginProvider>().loginnRegister == 0
                    ? TextFormFeild(
                        hintText: 'Электронная почта',
                        notecontroller: null,
                      )
                    : TextFormFeild(
                        hintText: 'Имя',
                        notecontroller:widget._namecontroller,
                      ),
                SizedBox(height: 15),
                context.watch<LoginProvider>().loginnRegister == 0
                    ? TextFormFeild(hintText: 'Пароль', notecontroller: null)
                    : TextFormFeild(
                        hintText: 'Фамилия',
                        notecontroller:widget._lastnamecontroller,
                      ),
                context.watch<LoginProvider>().loginnRegister == 0
                    ? SizedBox()
                    : SizedBox(height: 15),
                context.watch<LoginProvider>().loginnRegister == 0
                    ? SizedBox()
                    : TextFormFeild(
                        hintText: 'Электронная почта',
                        notecontroller: null,
                      ),
                context.watch<LoginProvider>().loginnRegister == 0
                    ? SizedBox()
                    : SizedBox(height: 15),
                context.watch<LoginProvider>().loginnRegister == 0
                    ? SizedBox()
                    : TextFormFeild(hintText: 'Пароль', notecontroller: null),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
