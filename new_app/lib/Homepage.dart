
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home',style: TextStyle(
          fontSize: 18,color: Colors.black
        ),),
          backgroundColor: Colors.white,
           shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10),
      topLeft: Radius.circular(10) ,
      topRight: Radius.circular(10)
    ), 
        
        ),
      ),
      body: SingleChildScrollView(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 90,
                width: 150,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 165, 203, 239),
                  borderRadius: BorderRadius.circular(10),
                   border: Border.all(
      color: Colors.blue, // Set the border color
      width: 1.0, // Set the border width
    ),    
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Column(
                      children: [
                         SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Current Second',
                          style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                          Divider( // Add a DividerS
      thickness: 1,
      color: Colors.black, // Set the color of the divider
    ),
                        Consumer<Widget1Provider>(
                          builder: (context, provider, _) {
                            return Text(
                              DateFormat('ss').format(DateTime.now()),
                              style: const TextStyle(fontSize: 14),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 90,
                width: 150,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 211, 193, 241),
                  borderRadius: BorderRadius.circular(10),
                   border: Border.all(
      color: Colors.deepPurple, // Set the border color
      width: 1.0, // Set the border width
    ),    

                  
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Column(
                      children: [
                         SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Random Number',
                          style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                         Divider( // Add a Divider
      thickness: 1, // Set the thickness of the divider
      color: Colors.black, // Set the color of the divider
    ),
                        Consumer<Widget2Provider>(
                          builder: (context, provider, _) {
                            return Text(
                              provider.randomNumber.toString(),
                              style: const TextStyle(fontSize: 14),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Consumer<Widget3Provider>(
  builder: (context, provider, _) {
    Color backgroundColor = Colors.orange; 
    String contentText;
    
    if (provider.message.contains('Success')) {
      backgroundColor = Colors.green;
      contentText = 'Success Score: ${provider.successfulAttempts} / ${provider.totalAttempts}';
    } else if (provider.message.contains('Sorry')) {
      contentText = 'Attempts: ${provider.totalAttempts}';
    } else {
      contentText = 'Attempts: ${provider.totalAttempts}';
    }

    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Color.fromARGB(255, 234, 116, 108), width: 1.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(provider.message,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10),
          Text(contentText,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
      actions: <Widget>[
      ],
    );
  },
  
),
Consumer<Widget4Provider>(
  builder: (context, provider, _) {
    int minutes = provider.timerCount ~/ 60;
    int seconds = provider.timerCount % 60;
    String formattedTime = '$minutes:${seconds.toString().padLeft(2, '0')}';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
       Stack(
          alignment: Alignment.center,
          
          children: [
            
             
            Container(
              width: 100, 
              height: 100, 
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                 color: Color.fromARGB(255, 115, 113, 113),
                border: Border.all(
                      color: Colors.black, 
                      width: 1, 
                    ),
              ),  
             ),
            Container(
              width: 140, 
              height: 90, 
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                 color: Colors.white,
               
                border: Border.all(
                      color: Colors.black, 
                      width: 1, 
                    ),
              ),      
            ),
            
            Text(
              formattedTime, 
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      
    ],
        
         );
  },
),


            const SizedBox(height: 20),
            
ElevatedButton(
  onPressed: () {
   
    Widget2Provider widget2Provider = Provider.of<Widget2Provider>(context, listen: false);
    Widget1Provider widget1Provider = Provider.of<Widget1Provider>(context, listen: false);
    Widget3Provider widget3Provider = Provider.of<Widget3Provider>(context, listen: false);
    Widget4Provider widget4Provider = Provider.of<Widget4Provider>(context, listen: false);
    
    widget4Provider.resetTimer(); // Reset the timer every time the button is clicked
    widget4Provider.startTimer(context);

    int newRandomNumber = Random().nextInt(60);
    widget2Provider.updateRandomNumber(newRandomNumber);

    int currentSeconds = DateTime.now().second;
    widget1Provider.updateSeconds();

    if (newRandomNumber == currentSeconds) {
      widget3Provider.updateMessage('Success:)');
      widget3Provider.incrementSuccessfulAttempts(); 
    } else {
      widget3Provider.updateMessage('Sorry Try Again!');
    }

    widget3Provider.incrementTotalAttempts(); 


   
  },
  child: const Text(' Click '),
),

               
        
      ])));
    
  }
}

class Widget1Provider extends ChangeNotifier {
  int _currentSeconds = DateTime.now().second;
  

  int get currentSeconds => _currentSeconds;

  void updateSeconds() {
    _currentSeconds = DateTime.now().second;
     print('Updated current seconds: $_currentSeconds'); 
    
    notifyListeners();
  }
}


class Widget2Provider extends ChangeNotifier {
  int randomNumber = 0;

  void updateRandomNumber(int number) {
    randomNumber = number;
    notifyListeners();
  }
}
class Widget3Provider extends ChangeNotifier {
  String message = '';
  int successfulAttempts = 0;
  int totalAttempts = 0;

  void updateMessage(String newMessage) {
    message = newMessage;
    notifyListeners();
  }

  void incrementSuccessfulAttempts() {
    successfulAttempts++;
    totalAttempts++;
    notifyListeners();
  }

  void incrementTotalAttempts() {
    totalAttempts++;
    notifyListeners();
  }

  double get successRate {
    if (totalAttempts == 0) {
      return 0.0; 
    }
    return (successfulAttempts / totalAttempts) * 100.0;
  }
}
class Widget4Provider extends ChangeNotifier {
  int _timerCount = 5; 
  int _failureAttempts = 0; // Number of failure attempts
  int _totalAttempts = 0; // Total number of attempts
  Timer? _timer;

  int get timerCount => _timerCount;
  int get failureAttempts => _failureAttempts;
  int get totalAttempts => _totalAttempts;

  void startTimer(BuildContext context) {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timerCount == 0) {
        _timer!.cancel();
        _failureAttempts++;
        _totalAttempts++;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Color.fromARGB(255, 234, 116, 108), width: 1.0),
      ),
              title: Text('Failure!',  style: TextStyle(
              fontSize: 18,
              color: Colors.red,
              fontWeight: FontWeight.bold
            ),),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sorry! Timeout and one attempt is considered for failure as penalty',  style: TextStyle(
              fontSize: 16,
              color: Colors.red,
            ),),
                  SizedBox(height: 10),
                  Text('Failure Score: $_failureAttempts/$_totalAttempts',  style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); 
                    resetTimer();
                  },
                  child: Text('Close',  style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.bold
            ),),
                ),
              ],
            );
          },
        );
      } else {
        _timerCount--;
        notifyListeners();
      }
    });
  }

  void resetTimer() {
    _timerCount = 5;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

