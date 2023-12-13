import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int currentQuestionIndex = 0;
  List<Map<String, Object>> questions = [
    {
      'questionText': '¿Cuál es tu color favorito?',
      'answers': ['Rojo', 'Verde', 'Azul', 'Amarillo'],
    },
    // Agrega más preguntas aquí
  ];

  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.deepPurple,
      ),
      body: currentQuestionIndex < questions.length
          ? Column(
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
                    onPressed: answerQuestion,
                  ),
                );
              },
            ),
          ),
        ],
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Felicidades, has terminado el quiz!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Volver a empezar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                // Lógica para reiniciar el quiz
              },
            ),
          ],
        ),
      ),
    );
  }
}
