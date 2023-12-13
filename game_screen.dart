import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Map<String, Object>> questions = [
    {
      'questionText': '¿En qué curso estás matriculado?',
      'answers': ['DAM1', 'Dam2', 'No lo sé', 'No me importa'],
      'correct': 1,

    },
    {
      'questionText': '¿Qué piensas regalar al profe de MP08?',
      'answers': ['Sesiones de Psicoterapia','Nada','Ansiolíticos','Antedepresivos' ],
      'correct': 1,
    }
  ];

  void answerQuestion(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex]['correct']) {
      setState(() {
        score++;
      });
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // No incrementar más y mostrar resultados
      _showScoreDialog();
    }
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Fin del Quiz'),
        content: Text('Tu puntuación es: $score/${questions.length}'),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Reiniciar'),
            onPressed: () {
              // Lógica para reiniciar el quiz
            },
          ),
          ElevatedButton(
            child: Text('Salir'),
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el diálogo
              Navigator.of(context).pop(); // Vuelve a la pantalla anterior
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              questions[currentQuestionIndex]['questionText'] as String,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: (questions[currentQuestionIndex]['answers'] as List<String>).length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purpleAccent,
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child: Text(
                      (questions[currentQuestionIndex]['answers'] as List<String>)[index],
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () => answerQuestion(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
