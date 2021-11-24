import 'package:avoid_keyboard/avoid_keyboard.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:requset/layout/home_layout.dart';
import 'package:requset/modules/login/completeLogin_Screen.dart';
import 'package:requset/modules/login/cubit/cubit.dart';
import 'package:requset/modules/login/cubit/states.dart';
import 'package:requset/modules/login/loginScreen.dart';
import 'package:requset/shared/components/components.dart';
import 'package:requset/shared/components/constant.dart';
import 'package:requset/shared/network/local/cache_helper.dart';
import 'package:requset/shared/styles/colors.dart';

class OTPControllerScreen extends StatefulWidget
{
  final String phone;
  final String codeDigits;

  OTPControllerScreen({this.phone, this.codeDigits});

  @override
  _OTPControllerScreenState createState() => _OTPControllerScreenState();
}

class _OTPControllerScreenState extends State<OTPControllerScreen>
{
  final GlobalKey<ScaffoldState> _scafolkey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPCodeController = TextEditingController();
  final FocusNode _pinOTPCodeFoucus = FocusNode();
  String varificationCode;
 // String? varificationCode;

  final Decoration pinOTPCodeDecoration = BoxDecoration(
    color: bgColor,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: Colors.grey[300],
    )
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyPhoneNumber();
  }

  verifyPhoneNumber() async {

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${widget.codeDigits + widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async
        {
          await FirebaseAuth.instance.signInWithCredential(credential).then((value)async{
            if(value.user != null)
            {
              navigateAndFinish(context, HomeLayout());
            }
          });
        },
      verificationFailed: (FirebaseAuthException e){
        FocusScope.of(context).unfocus();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message.toString()),
            duration: Duration(seconds: 3),
          ),
        );
        print('Error: '+e.message.toString());
      },
      codeSent: (String vID, int resendToken)
        {
          setState(() {
            varificationCode = vID;
          });
        },
      codeAutoRetrievalTimeout: (String vID)
      {
         setState(() {
         varificationCode = vID;
        });
      },
      timeout: Duration(seconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state){
        if(state is LoginSuccessState)
          {
            if(state.loginModel.status)
            {
              var timToken = state.loginModel.data.token;
              CacheHelper.saveData(key: 'token', value: "Bearer $timToken",).then((value) => {
                token = "Bearer $timToken",
              });
              token = CacheHelper.getData(key: 'token');
           //   print('Token ' + token);

              if(state.loginModel.data.user.isNew == 0){
                navigateAndFinish(context, HomeLayout());
              }else{
                navigateAndFinish(context, CompleteLoginScreen());
              }
              print('isNew' + state.loginModel.data.user.isNew.toString());
              print(state.loginModel.data.token);
              print(state.loginModel.data.message);
             // CacheHelper.saveData(key: 'token', value: state.loginModel.data.token,).then((value){
             //    navigateAndFinish(context, CompleteLoginScreen());
             // });
            }else
             {
               print(state.loginModel.data.message);
               showToast(
                   text: state.loginModel.data.message,
                 state: ToastStates.ERROR,
               );
             }

          }
      },
      builder: (context, state){
        return Scaffold(
          key: _scafolkey,
          appBar: AppBar(
            title: Text('Verify', style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: BLACK,
              fontSize: 14.0,
            ),),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            leading: InkWell(
                child: Icon(
                 Icons.arrow_back_ios_rounded,
                 color: Colors.black,
                  size: 14.0,
            ),
              onTap: (){
                  navigateTo(context, LoginScreen());
              },
            ),
          ),
          body: AvoidKeyboard(
            child: Container(
              color: Colors.white,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      myDivider(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 38),
                              child: GestureDetector(
                                onTap: (){
                                  verifyPhoneNumber();
                                },
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'we’ve send a SMS code to your phone number ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: ColorText,
                                      ),),
                                    TextSpan(
                                      text: '${widget.codeDigits}-${widget.phone}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.blueAccent,
                                      ),),
                                  ]),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0,),
                            ConditionalBuilder(
                                condition: state is! LoginLoadingState,
                                builder: (context) => PinPut(
                                  fieldsCount: 6,
                                  textStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                                  eachFieldWidth: 40.0,
                                  eachFieldHeight: 55.0,
                                  focusNode: _pinOTPCodeFoucus,
                                  controller: _pinOTPCodeController,
                                  submittedFieldDecoration: pinOTPCodeDecoration,
                                  selectedFieldDecoration: pinOTPCodeDecoration,
                                  followingFieldDecoration: pinOTPCodeDecoration,
                                  pinAnimationType: PinAnimationType.rotation,
                                  onSubmit: (pin) async
                                  {
                                    try{
                                      await FirebaseAuth.instance
                                          .signInWithCredential(PhoneAuthProvider
                                          .credential(verificationId: varificationCode, smsCode: pin))
                                          .then((value)async{
                                        if(value.user != null && state is! LoginLoadingState)
                                        {
                                          LoginCubit.get(context).userLogin(
                                              firebaseToken: firebaseToken,
                                              fcmToken: fcmToken
                                          );
                                          print(firebaseToken);
                                          print(fcmToken);
                                          // Navigator.of(context).push(MaterialPageRoute(builder: (c) => CompleteLoginScreen()));
                                        }
                                      });
                                    }catch(e){
                                      FocusScope.of(context).unfocus();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Invalid OTP'),
                                          duration: Duration(seconds: 3),
                                        ),
                                      );
                                    }
                                  },
                                ),
                                fallback: (context) => Center(child: CircularProgressIndicator()),
                            ),
                            SizedBox(height: 24.0,),
                            Container(
                              height: 56.0,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: (){
                                 // Navigator.of(context).push(MaterialPageRoute(builder: (c) => CompleteLoginScreen()));
                                },
                                child: Center(
                                    child: Text('Verify', style: TextStyle(
                                      fontFamily: 'Jannah',
                                    ),)),
                              ),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'Didnt have the code yet?  ',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: ColorText,
                                  ),),
                                TextSpan(
                                  text: 'Resend',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.blueAccent,
                                  ),),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            ),
          ),
        );
      },
    );
  }
}
