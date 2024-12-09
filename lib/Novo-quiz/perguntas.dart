final List<Map<String, Object>> perguntas = [
  {
    'questionText': 'Quando o Bubble Sort pode ser mais eficiente?',
    'image': 'assets/images/b1.png',
    'answers': [
      {'text': 'A) Quando a lista é longa e aleatória', 'isCorrect': false},
      {'text': 'B) Quando a lista já está quase ordenada', 'isCorrect': true},
      {
        'text': 'C) Quando tem muitos elementos duplicados',
        'isCorrect': false
      },
      {'text': 'D) Nunca é eficiente', 'isCorrect': false},
    ],
    'explanation':
        'O Bubble Sort é mais eficiente quando a lista já está quase ordenada, pois, ao percorrer a lista, ele realiza poucas trocas. Isso acontece porque o algoritmo tenta "bubbling up" os elementos maiores para o final da lista, e se a lista já está parcialmente ordenada, o número de comparações e trocas diminui significativamente.',
  },
  {
    'questionText': 'Como o Bubble Sort compara elementos?',
    'image': 'assets/images/b2.png',
    'answers': [
      {
        'text': 'A) Compara pares adjacentes e os troca, se necessário',
        'isCorrect': true
      },
      {'text': 'B) Divide a lista em duas metades', 'isCorrect': false},
      {
        'text': 'C) Escolhe sempre o menor elemento restante',
        'isCorrect': false
      },
      {'text': 'D) Utiliza uma árvore de busca binária', 'isCorrect': false},
    ],
    'explanation':
        'O Bubble Sort compara elementos adjacentes em uma lista e os troca se estiverem fora de ordem. Ele faz isso em repetidas passagens pela lista, até que todos os elementos fiquem ordenados. Esse processo de "bubbling" pode ser ineficiente para listas grandes, mas funciona bem para listas pequenas ou quase ordenadas.',
  },
  {
    'questionText': 'Qual é a principal característica do Bubble Sort?',
    'image': 'assets/images/b3.png',
    'answers': [
      {'text': 'A) É um algoritmo de busca binária', 'isCorrect': false},
      {
        'text': 'B) Faz várias passagens para ordenar a lista',
        'isCorrect': true
      },
      {
        'text': 'C) É um algoritmo de ordenação por seleção',
        'isCorrect': false
      },
      {'text': 'D) Divide a lista em várias partes', 'isCorrect': false},
    ],
    'explanation':
        'A principal característica do Bubble Sort é que ele realiza várias passagens pela lista, comparando e trocando elementos adjacentes até que a lista esteja ordenada. A cada passagem, o maior elemento é movido para o final da lista, o que garante que a lista vá ficando mais ordenada a cada iteração.',
  },
];
