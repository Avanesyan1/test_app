class Question {
  final String question;
  final Map<String,String> option;
  final int correctAnswerIndex;
  final String infotext;

  Question({required this.question, required this.option, required this.correctAnswerIndex, required this.infotext});
}

List<Question> questions = [
  Question(
  question: '1. Почему не стоит делать гильотину?',
  option: {'A':'Травмируешь плечевой сустав',
           'Б':'Упражнение незффективно',
           'В': 'Изиашивается локтевой сустав'
  },
  correctAnswerIndex: 0,
  infotext: 'Когда локоть находится на уровне плечевого сустава, у нас начинает большой бугорок плечевой кости насаживаться на акрамеон.То есть кость трется об кость. Тем самым вы попучаете травму плечевого сустава.'
),
  Question(
  question: '2. Нужно ли прижимать поясницу к скамье и ставить на нее ноги?',
  option: {'А':'Да',
           'Б':'Нет',
           'В':'Только если не хватает инвентаря,либо есть проблемы со спиной'
  },
  correctAnswerIndex: 0,
  infotext: 'текст не виден на скринах'
)

];