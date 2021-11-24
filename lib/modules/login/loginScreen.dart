import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:requset/modules/login/OTPController.dart';
import 'package:requset/modules/login/cubit/cubit.dart';
import 'package:requset/shared/components/components.dart';
import 'package:requset/shared/network/local/cache_helper.dart';
import 'package:requset/shared/styles/colors.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  String dialCodeDigits = '+00';
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                'S A I D',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Jannah',
                  fontWeight: FontWeight.bold,
                ),),
            ),
            SizedBox(width: 25.0,),
            Expanded(
              flex: 3,
              child: Text(
                'Sign In',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: BLACK,
                  fontSize: 14.0,
                ),),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
             myDivider(),
             Padding(
               padding: const EdgeInsets.all(16.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 8,),
                   Container(
                     margin: EdgeInsets.only(top: 10),
                     child: Text(
                       'Enter your mobile number',
                       style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: ColorText),
                     ),
                   ),
                   SizedBox(height: 16,),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 8.0),
                     child: Align(
                       alignment: Alignment.topLeft,
                       child: Text(
                         'Mobile Number',
                         style: Theme.of(context).textTheme.bodyText1.copyWith(
                           color: BLACK,
                           fontSize: 12.0,
                         ),
                       ),
                     ),
                   ),
                   Container(
                     height: 48.0,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8.0),
                       border: Border.all(
                           color: Colors.grey[300],
                           width: 1
                       ),
                       color: bgColor,
                     ),
                     child: Row(
                       children: [
                         Expanded(
                           flex:1,
                           child: CountryCodePicker(
                             onChanged: (country){
                               setState(() {
                                 dialCodeDigits = country.dialCode;
                               });
                             },
                             initialSelection: 'IT',
                             showCountryOnly: false,
                             showOnlyCountryWhenClosed: false,
                             favorite: ['+1', 'US', '+92', 'PAK'],
                           ),
                         ),
                         Expanded(
                           flex:2,
                           child: TextField(
                             controller: _controller,
                             decoration: InputDecoration(
                               border: InputBorder.none,
                               hintText: '595 123456',
                               hintStyle: TextStyle(
                                 fontSize: 14.0,
                                 color: ColorHintText,
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   SizedBox(height: 24.0,),
                   Container(
                     width: double.infinity,
                     height: 48,
                     child: ElevatedButton(
                       onPressed: (){
                         Navigator.of(context).push(MaterialPageRoute
                           (builder: (c) => OTPControllerScreen(
                           phone: _controller.text,
                           codeDigits: dialCodeDigits,
                         )));
                         CacheHelper.saveData(key: 'phone', value:  dialCodeDigits +'-'+ _controller.text);
                       },
                       child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 14.0),),
                     ),
                   ),
                    SizedBox(height: 12.0,),
                   RichText(
                     textAlign: TextAlign.center,
                     text: TextSpan(children: <TextSpan>[
                       TextSpan(
                         text: 'By clicking sign in you agree our ',
                         style: TextStyle(
                           fontSize: 12.0,
                           color: ColorText,
                         ),),
                       TextSpan(
                         text: 'terms & conditions',
                         style: TextStyle(
                           fontSize: 12,
                           color: Colors.blueAccent,
                         ),),
                       TextSpan(
                         text: ' And privacy policy ',
                         style: TextStyle(
                           fontSize: 12.0,
                           color: ColorText,
                         ),),
                     ]),
                   ),

                 ],
               ),
             ),
          ],
        ),
      ),
    );
  }
}
