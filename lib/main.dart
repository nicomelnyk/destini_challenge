import 'package:destini_challenge/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DestiniApp());

StoryBrain storyBrain = StoryBrain();

class DestiniApp extends StatelessWidget {
  const DestiniApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: DestiniPage(),
    );
  }
}

class DestiniPage extends StatefulWidget {
  const DestiniPage({Key? key}) : super(key: key);

  @override
  State<DestiniPage> createState() => _DestiniPageState();
}

class _DestiniPageState extends State<DestiniPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destini Challenge'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStoryTitle(),
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(storyBrain.getStoryChoice1NextStory());
                    });
                  },
                  //color: Colors.red,
                  child: Text(
                    storyBrain.getStoryChoice1(),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
                //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(storyBrain.getStoryChoice2NextStory());
                      });
                    },
                    //color: Colors.blue,
                    child: Text(
                      storyBrain.getStoryChoice2(),
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}