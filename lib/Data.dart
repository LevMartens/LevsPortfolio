import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


bool onMobile = false;

class Strings {
  static final fontSize = 15.0;
  static final vocabexSS2 = 'The words that will be filtered out are stored in Firebase FireStore and fetched on startup. The words that will be filtered are: the 5000 most common used words, 4000 common names, numbers, and close to 20.000 word forms derived from the 5000 most common words. After the scan completes, the words are presented and the user can choose to save the word, the words get saved in CoreData.';
  static final vocabexSS3 = 'Vocabex is a native IOS app that allows you to scan any page and filter out the most commonly used English words in order to help improve your English vocabulary.. The scanner comes from the Vision framework. Whenever a scan is made vision will read the page from the scan/photograph, then the page will be filtered through and you\'ll be left with the uncommon words that you can save in the app and study.   ';
  static final vocabexSS4 = 'I am working on incorporating added features including: word definitions, word difficulty levels, notes and word favoriting, a personalised filter as well as a personalised English level tracker. ';
  static final javaDescription = 'A small test to build your java knowledge';
  static final verossaDescription = 'Fully fledged webshop (demo) app';
  static final vocabexDescription = 'Vocabex is a page scanner and word filter that assists in expanding your English vocabulary';
  static final aboutMe = 'From the moment I printed my first “Hello World” I was hooked into app development. It’s provided an opportunity to challenge myself and continually learn to produce high quality code. What started as the curiosity to bring my first app idea to life has become a profound passion that instills more excitement everyday. ';
  static final personalLife = 'Good interpersonal and communication skills, organised and detail orientated, team work, highly motivated and eager to learn, able to survive a death adder bite, decent sense of humour.';
  static final workHistory = 'I used to work for DuPont de Nemours and Indorama Ventures as a process technician in their hydro-chemical plants. I did this for over 5 years while earning diploma’s in the field. ';
  static final hobbies = 'I spend most of my free time coding. When I’m not coding I like to make music and write songs or listen to podcasts.';
  static final screenshot1 = 'Verossa Valley is a fully fledged demo webshop app that depicts a fictional brand selling photographs and prints. The webshop app is completely functional and works like a real webshop however the payment process is in sandbox mode. The design is made by me with inspiration from other webshops. The item stock is regulated in firebase, where you can manually set item stock. Each purchase will cause the stock number to automatically subtract, and when an item is sold out this will block the user from adding the product to the cart and a pop up message will show up in the app saying “Sorry this item is sold out”. ';
  static final screenshot2 = 'Every page has a currency picker that updates all prices on the app to the chosen currency. The currency data is fetched from an api with real time exchange rates. The newsletter subscription box saves the users email address in firebase from which the store owner can then choose to add the email to their SendGrid or MailChimp. After every completed purchase, the user gets an automated order confirmation email (due to abuse of SendGrids free to use IP addresses, this email will most likely be caught by a spam filter).';
  static final screenshot3 = 'The checkout page has an order summary, the option to use a discount code as well as select express or standard shipping. On the checkout page the user is asked to fill in their contact details and address unless they have previously made a purchase or are logged into their account in which the app will autofill the data. When an order is made, all the purchase information is uploaded to firebase which allows the store owner to ship the product/s and keep track of orders.';
  static final screenshot4 = 'Users can login in or create an account with firebase auth. The account details will be shared across the app so the user doesn’t have to fill in their details when making a purchase and they can keep track of their order history.';
}

class Images {
  static final aboutMe = AssetImage('assets/lev_face.png');
  static final firstStackImage = AssetImage('assets/road.jpg');
  static final lastStackImage = AssetImage('assets/background1.png');
  static final personalLife = AssetImage('assets/climb.png');
  static final workHistory1 = AssetImage('assets/operator.png');
  static final workHistory2 = AssetImage('assets/indorama.png');
  static final hobbies = AssetImage('assets/busking.png');
  static final testFlightIcon = AssetImage('assets/testFlightRound.png');
  static final screenshotHomePage = AssetImage('assets/HomePageScreen.jpg');
  static final screenshot1 = AssetImage('assets/screenshot4.jpg');
  static final screenshot2 = AssetImage('assets/screenshot3.jpg');
  static final screenshot3 = AssetImage('assets/screenshot5.jpg');
  static final screenshot4 = AssetImage('assets/screenshot6.jpg');
  static final screenshotComingSoon = AssetImage('assets/CommingSoon.jpg');
  static final vocabexLogo = AssetImage('assets/VocabexLogo.png');
  static final vocabexSS1 = AssetImage('assets/test1.jpg');
  static final vocabexSS2 = AssetImage('assets/test2.jpg');
  static final availableOnAppStore = AssetImage('assets/AppleAvailable.png');
  static final availableOnGooglePlay = AssetImage('assets/googlePlayIcon.png');
  static final verossaLogo = AssetImage('assets/verossaLogo.png');
  static final javaSS1 = AssetImage('assets/javaSS1.jpg');
  static final javaLogo = AssetImage('assets/javaLogo.png');
  static final vocabexSS3 = AssetImage('assets/vocabexSS3.png');
  static final vocabexSS4 = AssetImage('assets/vocabexSS4.png');

}

class WordStyle {
  static final header = GoogleFonts.josefinSans(fontSize: onMobile == false ? 55 : 40,
      fontWeight: FontWeight.w500, color: Colors.white);
  static final headerSecond = GoogleFonts.montserrat(fontSize: onMobile == false ? 14 : 12,
      fontWeight: FontWeight.w300, color: Colors.white);
  static final style15_300 = GoogleFonts.josefinSans(fontSize: 15,
      fontWeight: FontWeight.w500, color: Colors.white);
  static final style20_300 =  GoogleFonts.josefinSans(fontSize:  20,
      fontWeight: FontWeight.w500, color: Colors.black);
  static final aboutMe = GoogleFonts.josefinSans(height: 1.5, fontSize:  14,
      fontWeight: FontWeight.w600, color: Colors.black);
  static final general = GoogleFonts.montserrat(height: 1.5, fontSize:  14 ,
      fontWeight: FontWeight.w300, color: Colors.black);
  static final more = GoogleFonts.montserrat(fontSize: 13,
      fontWeight: FontWeight.w300, color: Colors.black);
  static final portfolio = GoogleFonts.josefinSans(fontSize: onMobile == false ? 45 : 35,
      fontWeight: FontWeight.w500, color: Colors.black);
  static final linkedIn = GoogleFonts.josefinSans(decoration: TextDecoration.underline, fontSize: 14,
      fontWeight: FontWeight.w500, color: Colors.black);
  static final appTitle = GoogleFonts.josefinSans(fontSize: 35,
      fontWeight: FontWeight.w500, color: Colors.black);
  static final swift = GoogleFonts.montserrat( fontStyle: FontStyle.italic, fontSize: 12,
      fontWeight: FontWeight.w300, color: Colors.black);
  static final technologies = GoogleFonts.josefinSans(fontSize: 16,
      fontWeight: FontWeight.w500, color: Colors.black54);
  static final contact = GoogleFonts.josefinSans(fontSize: 35,
      fontWeight: FontWeight.w500, color: Colors.white);
  static final bottomHeader = GoogleFonts.josefinSans(fontSize: 18,
      fontWeight: FontWeight.w500, color: Colors.white);
  static final bottomHeaderMadeBy = GoogleFonts.josefinSans(fontSize: 12,
      fontWeight: FontWeight.w500, color: Colors.white);

}