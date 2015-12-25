#include <stdio.h>
#include <string.h>

int main(int argc, char const *argv[]) {
  FILE *fp = fopen(argv[1], "r");
  char c;
  int total = 1;
  int matrix[1000][1000] = {{0}, {0}};
  int x = 0, y = 0;
  matrix[x][y] = 1;
  while (fscanf(fp, "%c", &c) != EOF) {
    switch (c) {
      case '^':
        y += 1;
      break;
      case 'v':
        y -= 1;
      break;
      case '>':
        x -= 1;
      break;
      case '<':
        x += 1;
      break;
      default:
        fprintf(stderr, "Unk char [%c] ... Ignoring\n", c);
    }
    matrix[x][y] += 1;
    if (matrix[x][y] == 1)
      total += 1;
  }
  fclose(fp);
  printf("%d\n", total);
  return 0;
}
