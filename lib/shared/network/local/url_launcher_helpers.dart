import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper{
  UrlLauncherHelper._();
  static UrlLauncherHelper urlLauncherHelper = UrlLauncherHelper._();
  launchUrl(String url) async {
    await canLaunch(url) ? await launch(url,universalLinksOnly: true) : throw 'Could not launch $url';
  }
  openWebPage(){
    try {
      launchUrl('https://flutter.dev');
    } on Exception catch (e) {
      print(e);
    }
  }
  shareContent(){
    Share.share('hello how are you');
    // Share.shareFiles();
  }
  makeCall(){
    try {
      launchUrl('tel:+1 555 010 999');
    } on Exception catch (e) {
      print(e);
    }
  }
  sendSms(){
    try {
      launchUrl('sms:5550101234');
    } on Exception catch (e) {
      print(e);
    }
  }
  sendEmail(){
    try {
      launchUrl('mailto:smith@example.org?subject=News&body=New%20plugin');
    } on Exception catch (e) {
      print(e);
    }
  }
  openWhatsappChat(){
    try {
      launchUrl('https://wa.me/15551234567');
    } on Exception catch (e) {
      print(e);
    }
  }
  openInstagramPage(){
    try {
      launchUrl('https://www.instagram.com');
    } on Exception catch (e) {
      print(e);
    }
  }
}