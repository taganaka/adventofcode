#include <stdio.h>
#include <string.h>

int main(int argc, char const *argv[]) {
  FILE *fp = fopen(argv[1], "r");
  char c;
  int total = 0;
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
  }
  fclose(fp);
  printf("%d\n", total);
  return 0;
}
