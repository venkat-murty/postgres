#include <ctype.h>
#include <stdio.h>


static char buffer[1024];
static int  b_idx = 0;


static int OPEN_BRACE = '{';


static int 
dec (int idx) {
  --idx;
  return idx < 0 ? sizeof (buffer) - 1 : idx;
}

static int 
skip_args (int idx) {
  while (buffer[idx] != '(') {
    idx = dec(idx);
    if (idx == b_idx) return idx;
  }
  idx = dec(idx);

  return idx;
}

static int 
skip_spaces (int idx) {
  while (isspace(buffer[idx])) {
    idx = dec(idx);
    if (idx == b_idx) return idx;
  }
  return idx;
}

static int
isnewline (int ch) {
  return ch == '\n' || ch == '\r';
}

static char* 
function ()
{
  static char name[1024];
  static int  n_idx = sizeof(name) - 1;
  name[n_idx] = '\0';

  int idx = skip_spaces (b_idx - 1);
  if (idx == b_idx) return NULL;

  if (buffer[idx] != ')') return NULL;

  idx = skip_args (idx);
  if (idx == b_idx) return NULL;

  idx = skip_spaces (idx);
  if (idx == b_idx) return NULL;

  while (!(isspace (buffer[idx])))
  {
    n_idx--;
    name[n_idx] = buffer[idx];

    idx = dec (idx);
    if (idx == b_idx) return NULL;
  }
  return &name[n_idx];
}

int
main ()
{
  int ch = -1;
  int last_ch = -1;

  int hashdefine = 0;
  int all_spaces = 1;

  char* func = NULL;


  while ((ch = getchar()) != EOF)
  {
    if (ch == OPEN_BRACE && isnewline (last_ch) && !hashdefine && (func = function ()) != NULL) {
      fprintf (stdout, "%c\tStackTrace(\"%s\");", ch, func);
    }
    else
      fprintf(stdout, "%c", ch);

    hashdefine = hashdefine || (all_spaces && ch == '#');

    if (!(hashdefine && last_ch == '\\' && isnewline(ch)))
    {
      last_ch = ch;

      hashdefine = !isnewline(ch);
      all_spaces = isnewline (ch) || (all_spaces && isspace(ch));
    }

    buffer[b_idx] = ch;
    ++b_idx;
    b_idx = b_idx >= sizeof (buffer) ? 0 : b_idx;
  }
}

