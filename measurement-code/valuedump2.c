// averaging past 32k samples
// by fetching every 8k samples
// for processing `csdr fmdemod_atan_cf/amdemod_cf` output
// usage:
//    cc -O3 -o valuedump2 valuedump2.c

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <math.h>
#include <stdbool.h>

#define SAMPLES (8000)

int main(int argc, char* argv[]) {

  union {
    unsigned char byte[4];
    float f;
  } v;
  size_t n;
  double d, ds[4], dav, av;
  float s[SAMPLES];
  unsigned int p, q;
  uint64_t count;
  bool dsq_init = false; 

  // Initialize float/double work area
  for (q = 0; q < SAMPLES; q++) {
    s[q] = 0.0;
  }

  p = 0;
  count = 0;

  while ((n = fread(&s, sizeof(float), SAMPLES, stdin)) > 0) {

      d = 0.0;
      for (size_t i = 0; i < n; i++) {
	  d += (double)s[i];
      }
      dav = d / (double)n;

      if (!dsq_init) {
        for (q = 0; q < 4; q++) {
          ds[q] = dav;
        }
	dsq_init = true;
      }

      ds[p] = dav;
      p++;
      if (p > 3) {
	 p = 0;
      }

      av = (ds[0] + ds[1] + ds[2] + ds[3]) / 4.0;

      fprintf(stdout, "%" PRIu64 " %16.8f\n", count, av);

      count++;

  }
  exit(0);
}  

