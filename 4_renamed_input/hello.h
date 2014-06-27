#include <stdio.h>

#include "other.h"

void printHello() {
  printf("printHello() calling printOther ...\n");
  printOther();
}
