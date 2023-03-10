import 'story.dart';
import 'choice.dart';

class StoryBrain {

  int storyNumber = 0;

  final List<Story> _storyData = [
    Story(
        storyTitle:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: Choice(choice: 'I\'ll hop in. Thanks for the help!', next: 2),
        choice2: Choice(choice: 'Better ask him if he\'s a murderer first.', next: 1)),
    Story(
        storyTitle: 'He nods slowly, unphased by the question.',
        choice1: Choice(choice: 'At least he\'s honest. I\'ll climb in.', next: 2),
        choice2: Choice(choice: 'Wait, I know how to change a tire.', next: 3)),
    Story(
        storyTitle:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: Choice(choice: 'I love Elton John! Hand him the cassette tape.', next: 5),
        choice2: Choice(choice: 'It\'s him or me! You take the knife and stab him.', next: 4)),
    Story(
        storyTitle:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: Choice(choice: 'Restart', next: 0),
        choice2: Choice(choice: '', next: -1)),
    Story(
        storyTitle:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: Choice(choice: 'Restart', next: 0),
        choice2: Choice(choice: '', next: -1)),
    Story(
        storyTitle:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: Choice(choice: 'Restart', next: 0),
        choice2: Choice(choice: '', next: -1)),
  ];

  String getStoryTitle() {
    return _storyData[storyNumber].storyTitle;
  }

  String getStoryChoice1() {
    return _storyData[storyNumber].choice1.choice;
  }

  String getStoryChoice2() {
    return _storyData[storyNumber].choice2.choice;
  }

  int getStoryChoice1NextStory() {
    return _storyData[storyNumber].choice1.next;
  }

  int getStoryChoice2NextStory() {
    return _storyData[storyNumber].choice2.next;
  }

  nextStory(int choiceNumber) {
    storyNumber = choiceNumber;
  }

  buttonShouldBeVisible() {
    return _storyData[storyNumber].choice2.next > 0;
  }
}