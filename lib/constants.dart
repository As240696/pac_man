int numberOfColumns = 11;
int numberOfSquares = numberOfColumns * 17;
int player = 166;
String direction = "Right";
String enemy1Direction = 'left';
String enemy2Direction = 'down';
String enemy3Direction = 'right';
int score = 0;
int enemy1 = 20;
int enemy2 = 119;
int enemy3 = 88;
List<int> map = [
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  21,
  32,
  43,
  54,
  65,
  76,
  87,
  86,
  85,
  84,
  83,
  72,
  61,
  59,
  70,
  81,
  80,
  79,
  78,
  77,
  66,
  55,
  44,
  33,
  22,
  11,
  24,
  35,
  46,
  57,
  26,
  37,
  38,
  39,
  28,
  30,
  41,
  52,
  63,
  125,
  114,
  103,
  102,
  101,
  100,
  99,
  110,
  121,
  132,
  143,
  154,
  165,
  176,
  177,
  178,
  179,
  180,
  181,
  182,
  183,
  184,
  185,
  186,
  175,
  164,
  153,
  142,
  131,
  120,
  109,
  108,
  107,
  106,
  105,
  116,
  127,
  123,
  134,
  145,
  156,
  158,
  147,
  148,
  149,
  160,
  162,
  151,
  140,
  129
];

List<int> food = [];
List<int> enemyP = [];
