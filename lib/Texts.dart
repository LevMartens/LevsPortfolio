import 'package:flutter/material.dart';


class Texts {
  static final fontSize = 14.0;
  static final aboutMe = 'I’ve started my programming journey early 2020 after becoming curious to see if I could bring my very own app idea to life. It was love at first sight and I haven’t stopped coding since. I recently finished a flutter project and am looking to turn this passion into a job.';
  static final personalLife = 'I’m 26 years of age, and I grew up on the flat lands of The Netherlands. In 2019 I moved to Melbourne Australia where me and my partner are building a life together. ';
  static final workHistory = 'In Holland I used to work as a process technician in hydro-chemical plants. I did this for over 5 years while earning diploma’s in the field. In Australia, I currently work in a plant nursery as a general labourer. For more information on my process technician past please click the LinkedIn link below.';
  static final hobbies = 'I spend most of my free time coding or reading documentation. When I’m not coding I like to make music and write songs or listen to podcasts.';
  static final screenshot1 = 'Verossa Valley is a fictional brand that sells prints. The webshop app works like a real webshop in detail, yet the payment process is in sandbox mode. The design is made by me with inspiration from other webshops. The item stock is regulated in firebase, where you can manually set item stock. Each purchase will cause the stock number to automatically subtract, and when an item is sold out this will block the user from adding the product to the cart and a pop up message will show up in the app saying “Sorry this item is sold out”. ';
  static final screenshot2 = 'Every page has a currency picker that updates all prices on the app to the chosen currency. The currency data is fetched from an api with real time exchange rates. The newsletter subscription box saves the email address in firebase from which the store owner can then choose to add the email to their sendGrid or MailChimp. After every completed purchase the user gets an automated  order confirmation email (Due to abuse of sendGrids free to use IP addresses this email will most likely be caught by a spam filter).';
  static final screenshot3 = 'The checkout page has an order summary, the option to use a discount code as well as select express or standard shipping. On the checkout page the user is asked to fill in their contact details and address unless they have previously made a purchase or are logged into their account in which the app will autofill the data. When an order is made, all the purchase information is uploaded to firebase which allows the store owner to ship the product/s and keep track of orders.';
  static final screenshot4 = 'Users can login in or create an account with firebase auth. The account details will be shared across the app so the user doesn’t have to fill in their details when making a purchase and they can keep track of their order history.';
}