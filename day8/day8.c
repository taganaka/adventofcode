#include <stdio.h>
#include <string.h>
// "t\"\"xpbdscmdoug" 14
// "\xa 8 b r \x8 b j r \" " [16 7]
int solve(const char *buff){
  int len = strlen(buff);
  int mem_size = len - 2;
  for (int i = 1; i < len - 1; i++){
    if (buff[i] == '\\') {
      if (buff[i + 1] == 'x') {
        mem_size -= 3;
        i += 3;
      } else {
        mem_size--;
        i++;
      }
    }
  }
  return mem_size;
}

int main(int argc, char const *argv[]) {
  FILE *fp = fopen(argv[1], "r");
  char buff[255];
  int total = 0;
  while (fgets(buff, 255, fp) != NULL) {
    buff[strlen(buff) - 1] = '\0';
    if (strlen(buff) == 0)
      break;
    total += strlen(buff) - solve(buff);
  }
  fclose(fp);
  printf("%d\n", total);
  return 0;
}
