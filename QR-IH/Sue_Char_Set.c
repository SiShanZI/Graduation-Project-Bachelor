/*The character set: {A~Z, 0~9, /}. '/' is the terminator needed by decoding.*/
#include "Sue_Hdr.h"

int N = 37; int MAX = 300;
int limit = 600;
/*int limit = MAX*((int)(ceil(log(N))));*/
char TAG = '\n'; char Terminator = '/';

int Gps_ec(char ec)
{
  int j = 0;
  if(ec >= 'A' && ec <= 'Z'){j = ec - 'A';}
  else if(ec >= '0' && ec <= '9'){j = ec - '0' + 26;}
  else if(ec == Terminator){j = 36;}
  else{;}
  return j;
}

char Gps_dc(int dc)
{
  char j;
  if(dc >= 0 && dc <= 25){j = dc + 'A';}
  else if(dc >= 26 && dc <= 35){j = dc + '0' - 26;}
  else if(dc == 36){j = Terminator;}
  else{;}
  return j;
}
