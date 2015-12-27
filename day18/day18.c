#include <stdio.h>
#include <string.h>
#include <stdbool.h>

void dump_matrix(bool matrix[100][100]){
  for (int y = 0; y < 100; y++) {
    for (int x = 0; x < 100; x++) {
      if (matrix[y][x])
        putchar('#');
      else
        putchar('.');
    }
    putchar('\n');
  }
}

int main(int argc, char const *argv[]) {
  bool matrix[100][100] = {{false}, {false}};
  int op[100 * 100] = {false};
  int col = 0;
  int row = 0;
  int c;
  FILE *fp = fopen(argv[1], "r");

  while ((c = fgetc(fp)) != EOF) {
    if (c != '\n') {
      if (c == '#'){
        matrix[row][col++] = true;
      } else {
        matrix[row][col++] = false;
      }

    } else {
      row++;
      col = 0;
    }
  }
  fclose(fp);
  dump_matrix(matrix);
  int j = 0;
  int on = 0;
  int off = 0;
  for (int i = 0; i < 100; i++){
    for (int y = 0; y < 100; y++) {
      for (int x = 0; x < 100; x++) {
        on  = 0;
        off = 0;

        // -->
        if (x + 1 < 100 && matrix[y][x + 1])
          on++;
        else
          off++;
        // <--
        if (x - 1 >= 0 && matrix[y][x - 1])
          on++;
        else
          off++;

        // up
        if (y + 1 < 100 && matrix[y + 1][x])
          on++;
        else
          off++;
        // down
        if (y - 1 >= 0 && matrix[y - 1][x])
          on++;
        else
          off++;

        // up
        if (y + 1 < 100 && x + 1 < 100 && matrix[y + 1][x + 1])
          on++;
        else
          off++;
        // down
        if (y - 1 >= 0 && x - 1 >= 0 && matrix[y - 1][x - 1])
          on++;
        else
          off++;

          // up
        if (y + 1 < 100 && x - 1 >= 0 && matrix[y + 1][x - 1])
          on++;
        else
          off++;
        // down
        if (y - 1 >= 0 && x + 1 < 100 && matrix[y - 1][x + 1])
          on++;
        else
          off++;

        if (matrix[y][x]) {
          if (on != 2 && on != 3)
            op[j] = false;
          else
            op[j] = true;
        } else {
          if (on == 3) {
            op[j] = true;
          } else {
            op[j] = false;
          }
        }
        j++;
      }
    }
    printf("Step %d\n", i + 1);
    for (int k = 0; k < j; k++){
      matrix[k % 100][k / 100] = op[k];
    }
    dump_matrix(matrix);
    j = 0;
  }
  int total = 0;
  for (int y = 0; y < 100; y++) {
    for (int x = 0; x < 100; x++) {
      if (matrix[y][x])
        total++;
    }
  }
  printf("Total %d\n", total);
  return 0;
}
