// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'lesQuestions.dart';
import 'Question.dart';
import 'dart:async';


 Element laQuestion = querySelector('#Question');
 List<Question> listeDesQuestions = listeQuestions();
 List<int> choixUtilisateur = new List<int>();
 int compteur = -1;
 Timer chrono = null;
 
 void main() {
   
 
   
   chargerQuestions();
   initChoixUtil();
   Element next = querySelector('#next'); 
   Element rep1 = querySelector('#rep1');
   Element rep2 = querySelector('#rep2');
   Element rep3 = querySelector('#rep3');
   Element rep4 = querySelector('#rep4');
   
             next.onClick.listen((event) => chargerQuestions());               
             rep1.onClick.listen((event) => choixUtilisateur[compteur] = 1 );
             rep2.onClick.listen((event) => choixUtilisateur[compteur] = 2 );
             rep3.onClick.listen((event) => choixUtilisateur[compteur] = 3 );
             rep4.onClick.listen((event) => choixUtilisateur[compteur] = 4 );
            
}

  
  void chargerQuestions(){
   compteur++;
   
   if(compteur<listeDesQuestions.length){
       
    Element rep1 = querySelector('#rep1');
    Element rep2 = querySelector('#rep2');
    Element rep3 = querySelector('#rep3');
    Element rep4 = querySelector('#rep4');    
    
    laQuestion.text = listeDesQuestions[compteur].la_question ; // on charge  la question 
    
   // listeDesQuestions[compteur].les_reponses.length; //on charge toutes les réponses de la question
   
    rep1.text = listeDesQuestions[compteur].les_reponses[0];
    rep2.text = listeDesQuestions[compteur].les_reponses[1];
    rep3.text = listeDesQuestions[compteur].les_reponses[2];
    rep4.text = listeDesQuestions[compteur].les_reponses[3];
     
  }else{
    afficherResultats();     
  }
    
  }
    
  
    void afficherResultats(){
     
      querySelector('#next').remove();
      querySelector('#Question').remove();
      querySelector('#reponses').remove();
      UListElement listeResultat = new UListElement();
      LIElement nouveau = new LIElement();
      listeResultat = querySelector('#result'); 
      
      print(choixUtilisateur.toString());   
      int trouvee = 0;
      for(int i =0 ; i< 10 ; ++i){
        int a = i+1; 

              if(choixUtilisateur[i] == listeDesQuestions[i].bonneReponse ){  
                trouvee++;
                nouveau.text = "Question$a : Bonne réponse";
                listeResultat.children.add(nouveau);
              }else if(choixUtilisateur[i] == 999){
                nouveau.text = "Question$a : Aucune réponse";
                listeResultat.children.add(nouveau); 
              }else{
                nouveau.text = "Question$a : Mauvaise réponse";
                listeResultat.children.add(nouveau);               
              }
              nouveau = new LIElement();
            }
      nouveau.text =" Votre Scrore : $trouvee / 10  " ;
      listeResultat.children.add(nouveau);
    }
    
    void initChoixUtil(){
      
      for(int i =0 ; i< 10 ; ++i){
        choixUtilisateur.add(999);
      }
    }
    
 /*   void debuterChrono() {
              // le temps diminue chaque seconde.
         var oneSecond = new Duration(seconds:1);
         timer = new Timer.periodic(oneSecond, _tick);
       }*/
     
            
       
  
  
  
