/**
 * Test cases
 *
 * The COMMAND_LINES array lists command-line test cases that will be
 * used as arguments for testing command_parse. Add more!
 */
#include <stdlib.h>

#include "command_lines.h"

char* COMMAND_LINES[] = {
  "Hello world!  Please parse    me.",  // valid
  "ls -l &",  // valid
   "a & b", // invalid" & needs to be last non-space char of command line
  
  // Add more test cases here!
  " ",  // invalid??
  "",   // invalid??
  "&",  // invalid
  "&hi", // invalid
  "& hi", // invalid
  "hello hi bye", // valid
  "  hello hi bye &  ", // valid
  "lilac bylac & &", // invalid
  "   lilac     bylac",  // valid 




  // Be adversarial. Test all possible corner cases of valid and
  // invalid command line shapes that you can imagine. Add small
  // simple cases. Add large complex cases.
  
  NULL // Keep NULL to mark the end.
};
