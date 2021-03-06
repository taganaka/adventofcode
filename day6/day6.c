#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#define GRID_SIZE 1000
struct command {
  int type;
  int sx, sy, ex, ey;
};

bool parse_command(const char *line, struct command *command){
  // turn on 212,957 through 490,987
  // toggle 171,31 through 688,88
  // turn off 991,989 through 994,998
  if (sscanf(line, "turn on %d,%d through %d,%d", &command->sx, &command->sy, &command->ex, &command->ey)){
    command->type = 0;
    return true;
  }

  if (sscanf(line, "turn off %d,%d through %d,%d", &command->sx, &command->sy, &command->ex, &command->ey)){
    command->type = 1;
    return true;
  }

  if (sscanf(line, "toggle %d,%d through %d,%d", &command->sx, &command->sy, &command->ex, &command->ey)){
    command->type = 2;
    return true;
  }
  return false;
}

int main(int argc, char const *argv[]) {
  bool matrix[GRID_SIZE][GRID_SIZE] = {{false}, {false}};
  int matrix_2[GRID_SIZE][GRID_SIZE] = {{0}, {0}};
  char line[255];
  struct command current_command;
  int total = 0;
  int total_2 = 0;
  FILE *fp = fopen(argv[1], "r");

  while (fgets(line, 255, fp) != NULL) {
    if (parse_command(line, &current_command)) {
      for (int x = current_command.sx; x <= current_command.ex; x++){
        for (int y = current_command.sy; y <= current_command.ey; y++){
          switch (current_command.type) {
            case 0:
              matrix[x][y] = true;
              matrix_2[x][y]++;
            break;
            case 1:
              matrix[x][y] = false;
              matrix_2[x][y]--;
              if (matrix_2[x][y] < 0)
                matrix_2[x][y] = 0;
            break;
            case 2:
            matrix[x][y] = !matrix[x][y];
            matrix_2[x][y] += 2;
            break;
          }
        }
      }
    }
  }
  fclose(fp);

  for (int x = 0; x < GRID_SIZE; x++){
    for (int y = 0; y < GRID_SIZE; y++){
      if (matrix[x][y])
        total++;
      total_2 += matrix_2[x][y];
    }
  }
  printf("%d %d\n", total, total_2);
  return 0;
}
