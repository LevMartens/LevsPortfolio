import 'package:flutter/cupertino.dart';

class ValueProvider extends ChangeNotifier {

  bool aboutMeSelectedMobile = false;
  bool vocabexSelectedMobile = false;
  bool verossaSelectedMobile = false;
  bool aboutMeSelectedPortrait = false;
  bool vocabexSelectedPortrait = false;
  bool verossaSelectedPortrait = false;
  bool aboutMeSelectedTablet = false;
  bool verossaSelectedTablet = false;
  bool vocabexSelectedTablet = false;

  void changeAboutMeSelectedMobileTo(bool bool) {
    aboutMeSelectedMobile = bool;
    notifyListeners();
  }
  void changeVocabexSelectedMobileTo(bool bool) {
    vocabexSelectedMobile = bool;
    notifyListeners();
  }
  void changeVerossaSelectedMobileTo(bool bool) {
    verossaSelectedMobile = bool;
    notifyListeners();
  }
  void changeAboutMeSelectedPortraitTo(bool bool) {
    aboutMeSelectedPortrait = bool;
    notifyListeners();
  }
  void changeVocabexSelectedPortraitTo(bool bool) {
    vocabexSelectedPortrait = bool;
    notifyListeners();
  }
  void changeVerossaSelectedPortraitTo(bool bool) {
    verossaSelectedPortrait = bool;
    notifyListeners();
  }
  void changeAboutMeSelectedTabletTo(bool bool) {
    aboutMeSelectedTablet = bool;
    notifyListeners();
  }
  void changeVocabexSelectedTabletTo(bool bool) {
    vocabexSelectedTablet = bool;
    notifyListeners();
  }
  void changeVerossaSelectedTabletTo(bool bool) {
    verossaSelectedTablet = bool;
    notifyListeners();
  }
}