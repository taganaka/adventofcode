#include <stdio.h>
#include <string.h>

int main(int argc, char const *argv[]) {
  FILE *fp = fopen(argv[1], "r");
  char c;
  int total = 0;
  int magik = -1;
  int count = 1;
  while (fscanf(fp, "%c", &c) != EOF) {
    switch (c) {
      case '(':
        total++;
      break;
      case ')':
        total--;
      break;
      default:
        fprintf(stderr, "Unk char [%c] ... Ignoring\n", c);
    }
    if (total == -1 && magik < 0) {
      magik = count;
    }
    count++;
  }
  fclose(fp);
  printf("%d %d\n", total, magik);
  return 0;
}
