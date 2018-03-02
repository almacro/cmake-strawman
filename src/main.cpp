// A simple program that computes the square of a number
#include <stdio,h>
#include <stdlib.h>
#include "sqr.h"
int main(int argc, char *argv[])
{
  if (argc < 2)
    {
      fprintf(stdout, "Usage: %s number\n", argv[0]);
      return 1;
    }
  double inputValue = atof(argv[1]);
  double outputValue = sqr(inputValue);
  fprintf(stdout, "The square of %g is %g\n",
          inputValue, outputValue);
  return 0;
}
