
import 'package:bluetrack/sidebar/navigation_bloc.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget with NavigationStates {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String message = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var percentage = (100 * score / quiz.length).round() ;
    if(percentage >= 70){
      message = "Vos symptômes nécessitent une prise en charge rapide!";
    }else if (percentage > 30 && percentage < 70){
      message = "Votre situation peut relever d’un COVID 19. Pour s'assurer de votre état, faisez le test chaque jour!";
    }else if (percentage < 30){
      message = "Votre état ne semble pas préoccupant ou ne relève probablement pas du COVID 19!";
    }

  }
  int currentQuestion = 0;
  int score = 0;
  var quiz = [
    {
      "title": "Ces dernières 48 heures, est-ce-que votre température était plus élevée que 37 ?",
      "explication": "La température se mesure avec un thermomètre.\nLe thermomètre indique un nombre,c'est la température de votre corps.",
      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    },
    {
      "title": "Ces derniers jours, avez-vous une toux ou une augmentation de votre toux habituelle ?",
      "explication": " Une augmentation de votre toux veut dire \nque vous toussez plus que d'habitude.",

      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    },
    {
      "title": "Ces derniers jours, avez-vous noté une forte diminution ou perte de votre goût ou de votre odorat ?",
      "explication": " La perte du goût, c'est quand vous ne pouvez plus reconnaître le goût d'un aliment.\n\nLa perte de l'odorat, c'est quand vous ne sentez plus les odeurs.",

      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    },
    {
      "title": "Ces derniers jours, avez-vous eu un mal de gorge et/ou des douleurs musculaires et/ou des courbatures inhabituelles ?",
      "explication": "Un mal de gorge,c’est quand vous ressentez un irritation ou une gêne au niveau de votre gorge.\nLa courbature, c'est une douleur musculaire. On peut ressentir des courbatures quand on a fait trop de sport ou quand on est malade.Les muscles du corps sont fatigués,donc ils font mal.",
      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    },
    {
      "title": "Ces dernières 24 heures, avez-vous de la diarrhée ?\nAvec au moins 3 selles molles.",
      "explication": "La diarrhée, c'est aller aux toilettes plus souvent que d'habitude. Il faut être allé aux toilettes au moins 3 fois dans la journée.\nLa consistance de votre caca est molle ou liquide.\nLa quantité est plus importante.",
      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    },
    {
      "title": "Ces derniers jours, avez-vous une fatigue inhabituelle ?",
      "explication": "La fatigue inhabituelle, c'est une forme de fatigue que vous n'avez pas l'habitude de ressentir.\nVotre corps est plus faible.\nLes douleurs liées à cette fatigue sont plus importantes.",
      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    },

    {
      "title": "Depuis 24 heures ou plus, êtes-vous dans l'impossibilité de vous alimenter ou de boire ?",
      "explication": "Être dans l'impossibilité de manger ou de boire, c'est que vous n'arrivez plus à avaler ni nourriture ni boisson.\nVous ressentez du dégoût quand vous voyez de la nourriture.",
      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    },
    {
      "title": "Ces dernières 24 heures, avez-vous noté un manque de souffle inhabituel lorsque vous parlez ou faites un petit effort ? ",
      "explication": "Un manque de souffle est inhabituel, quand vous avez plus de mal à respirer que les autres jours.\nPar exemple vous êtes plus essouflé quand vous parlez ou quand vous montez l'escalier.",
      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    },
    {
      "title": " Avez-vous de l’hypertension artérielle mal équilibrée ?\n Ou avez-vous une maladie cardiaque ou vasculaire ? \n  Ou prenez vous un traitement à visée cardiologique ?",
      "explication": "Une hypertension artérielle mal équilibrée, c'est une augmentation importante de la tension artérielle. Ce qui cause des maladies cardiaques/vasculaires: maladies du cœur. Ce qui nécessite un traitement cardiologique.",
      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    },
    {
      "title": "Êtes-vous diabétique ?",
      "explication": "Être diabétique c'est avoir trop de sucre dans le sang. Quand vous avez du diabète, c'est que votre corps ne sait plus réguler le sucre dans le sang. Il a des difficultés à utiliser le sucre consommé.",
      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    },

    {
      "title": "Avez-vous une maladie respiratoire ? \n Ou êtes-vous suivi par un pneumologue ?",
      "explication": "Une maladie respiratoire, c'est une maladie qui empêche de bien respirer. Cela touche les organes qui sont nécessaires pour la respiration comme les poumons.\n Quand on a une maladie respiratoire, on va voir le pneumologue (médecin des poumons).",
      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    },
    {
      "title": "Avez-vous une insuffisance rénale chronique dialysée ?",
      "explication": "Une insuffisance rénale chronique, c'est une maladie des reins. Les reins ne fonctionnent plus correctement, ils filtrent mal le sang.\nCela nécessite un traitement par une dialyse.",
      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    },
    {
      "title": "Avez-vous une maladie chronique du foie ?",
      "explication": "La maladie chronique du foie, c'est lorsque notre foie ou une partie de notre foie ne fonctionne plus.",
      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    },
    {
      "title": "Avez-vous une maladie connue pour diminuer vos défenses immunitaires ?",
      "explication": "Les défenses immunitaires, ce sont les défenses du corps. Le corps a un système qui le protège contre toutes les infections, des microbes : bactéries, virus, ... C'est le système immunitaire.",
      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    },
    {
      "title": " Prenez-vous un traitement immunosuppresseur ?",
      "explication": "Un traitement immunosuppresseur, c'est un traitement qu'on donne pour certaines maladies. Ce traitement diminue les défenses immunitaires.",
      "answers": [
        {"answer": "Oui", "correct": true},
        {"answer": "Non", "correct": false},

      ]
    }

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //backgroundColor: Color (0xff143642),
      /*appBar: AppBar(
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.greenAccent, Colors.teal])),
      ),
    ),*/
        body: (this.currentQuestion >= quiz.length)//Condition une fois ktbdl currentqs kiji hna lhad condition
            ? Container(
          decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors:  [Color(0xff143642), Color(0xff0F8B8D)])),
              child: Center(


              child: Column(//cause 3ndna text et button i guess
                //mainAxisAlignment: MainAxisAlignment.center,//bash tweli lwest cause Center li lfo9 makhdmatsh dont know why
                children: <Widget>[
                  SizedBox(
                    width:80,
                    height: 50,

                  ),
                  DrawerHeader(//hia li fiha tsouira cause it s a header

                    child:Center(
                      child: CircleAvatar(

                        radius: 90,
                        backgroundImage: AssetImage('images/medical.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width:80,
                    height: 30,

                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:30.0, right: 30, top:50),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color:  Colors.white, width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "${message}",
                          style: TextStyle(fontSize: 25, color: Colors.white /*fontWeight: FontWeight.bold*/),
                          textAlign : TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width:80,
                    height: 170,

                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ButtonTheme(//nbdl size d button
                        minWidth: 320.0,
                        height: 50.0,
                        child: RaisedButton(

                          onPressed: (){
                            setState(() {
                              this.currentQuestion = 0;
                              this.score = 0;
                            });
                          },

                          color:Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color:Colors.transparent,)),

                          child: Text("Refaire le test", style:TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold),),
                          textColor: Colors.white,

                        )),
                  ),
                ],
              )
        ),
            )
            :
        Center(
          child: Container(

            /*decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors:  [Colors.white,Color(0xffedddd4)])),*/
            child: ListView(

              children: <Widget>[
                ListTile(

                  title: Center(
                      child:Row(
                        children: <Widget>[
                          SizedBox(
                            width:60,
                            height: 20,

                          ),
                         Container(
                           height: 50,
                           width: 50,
                           decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: AssetImage('images/patent.png'),
                                  //fit: BoxFit.fill
                               )
                           ),

                         ),
                          SizedBox(
                            width: 15,
                            height: 20,

                          ),
                          Text(
                            "${currentQuestion + 1}/${quiz.length} ",
                            style: TextStyle(color : Color(0xff0F8B8D),
                                fontSize: 27, fontWeight: FontWeight.w500),
                          ),
                             SizedBox(
                               //width: 5,
                               height: 100,
                             ),
                             Text(
                               "Question",
                               style: TextStyle(color : Color(0xff0F8B8D),
                                   fontSize: 25, fontWeight: FontWeight.w300),
                             )

                        ],
                      )

                    /*child: Text(
                    "${currentQuestion + 1}/${quiz.length}Question ",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )*/),
                ),
                ListTile(

                  title: Padding(
                    padding: const EdgeInsets.all(12.0),

                    child: Text(
                      quiz[currentQuestion]['title'],
                      style:
                      TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color :Colors.black/*Color(0xff0081a7)*/),
                      textAlign : TextAlign.justify,
                    ),
                  ),
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(20.0),

                    child: Container(
                      /*decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color:  Color(0xffF1FAEE), width: 2),
                          //color:  Color(0xff0F8B8D)
                      ),*/
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color:  Color(0xff0F8B8D), width: 4),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors:  [Color(0xfff8f8f8),Color(0xfff8f8f8)])),

                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          quiz[currentQuestion]['explication'],
                          style:
                          TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,  color :Colors.black /*Color(0xff0081a7)*/,
                          ),
                          //textAlign : TextAlign.justify,
                        ),
                      ),
                    ),

                  ),
                ),

                ...(quiz[currentQuestion]['answers']
                as List<Map<String, Object>>)


                    .map(
                        (answer) //khasna ngolo lih rah tableau answers thats why drna as list and 3 pts c est une copie du tableau answers so n9dro ndiro 3lih lmap
                    {
                      return ListTile(

                        title: Padding(
                          padding: const EdgeInsets.all(0.0),
                          //                                    padding: const EdgeInsets.only(top:20.0),
                          child: Center(
                            child: Container(

                              height: 60.0,
                              width: 400,
                              color: Colors.transparent,
                              //color: Color(0xff143642),
                              child: Container(


                                /*decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)
                            ),*/
                                /*decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [Color(0xff143642), Color(0xff0F8B8D)],
                                         /* begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,*/
                                        ),
                                        borderRadius: BorderRadius.circular(30.0)
                                    ),*/
                                /* decoration: new BoxDecoration(

                                        gradient: new LinearGradient(
                                          colors: [Color (0xff143642), Color (0xff0F8B8D)],

                                        )
                                        borderRadius: BorderRadius.circular(24)
                                    ),*/

                                padding: const EdgeInsets.all(10.0),


                                child: RaisedButton(

                                  color:  Color(0xff0F8B8D),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color:Color(0xff0F8B8D),)),
                                  child: Text(
                                    answer['answer'],
                                    style: TextStyle(fontSize: 22, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () { setState(() {
                                    if (answer['correct'] == true) {
                                      ++score;
                                    }
                                    if (currentQuestion < quiz.length)
                                      ++currentQuestion;
                                  });},
                                ),






                                /* child: RaisedButton(
                            //padding: EdgeInsets.symmetric(vertical: 12),
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.transparent,)),
                            child: Text(
                              answer['answer'],
                              style: TextStyle(fontSize: 22, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () { setState(() {
                              if (answer['correct'] == true) {
                                ++score;
                              }
                              if (currentQuestion < quiz.length)
                                ++currentQuestion;
                            });},

                                ),*/
                              ),
                            ),
                          ),




                          /*child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.greenAccent, Colors.teal],
                                  begin: FractionalOffset(0.0, 0.0),
                                  end: FractionalOffset(0.5, 0.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                            ),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.transparent,
                              child: Text(
                                answer['answer'],
                                style: TextStyle(fontSize: 22),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (answer['correct'] == true) {
                                    ++score;
                                  }
                                  if (currentQuestion < quiz.length)
                                    ++currentQuestion;
                                });
                              },
                            )), */

                          /* title: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RaisedButton(
                            color: Colors.greenAccent,
                            textColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                if (answer['correct'] == true) {
                                  ++score;
                                }
                                if (currentQuestion < quiz.length)
                                  ++currentQuestion;
                              });
                            },
                            child: Text(
                              answer['answer'],
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ), */
                        ), );
                    })
              ],
            ),
          ),
        )
    );
  }
}
