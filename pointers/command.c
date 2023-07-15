/**
 * CS 240 Pointers: A simple command parsing library
 *
 * Assignment description:
 * https://cs.wellesley.edu/~cs240/assignments/pointers/
 */
#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include "command.h"

/**
 * command_char_is_space:
 *
 * Determine whether a character is a space for purposes of command parsing.
 * Do not change this function.
 *
 * Notes:
 *
 * - This function is an example helper function to encourage you to
 *   define and use new helper functions where useful.
 * - To support optional extensions, this function checks a broader
 *   definition of "space" including tabs, newlines, and carriage
 *   returns. However, we will never evaluate your code on command
 *   lines containing the following characters.  Our tests will use
 *   only ' ' as a space character.
 * - C has no Boolean data type, but there is no reason one cannot be
 *   defined.  The "stdbool.h" library defines `bool` as an alias for
 *   an integer type and `true`/`false` as `1`/`0` under the hood.
 *
 * Parameters:
 *
 * - ch: character to inspect
 *
 * Return:
 *
 * - true if the given character is a space character for purposes of
 *   command parsing
 *
 * - false otherwise
 */
bool command_char_is_space(char ch) {
  switch (ch) {
  case ' ':
  case '\t':
  case '\n':
  case '\r':
    return true;
  default:
    return false;
  }
}



/**
 * command_parse:
 *
 * Parse a command-line string, report foreground/background status,
 * and return a command array.  Each element in the command array
 * corresponds to one word in the command string, in order.
 *
 * A command with '&' after the last word is a background command.
 * The '&' is not part of the resulting command array.  Repetitions or
 * other placements of '&' constitute invalid command lines.
 *
 * Parameters:
 *
 * - line: non-NULL pointer to a command-line string.
 *
 * - status: non-NULL pointer to the location where this function
 *   should store the (1) foreground or (0) background status of the
 *   given command line.
 * 
 * Return:
 *
 * - a pointer (char**) to a NULL-terminated array of strings if given
 *   a valid command-line string.
 *
 * - NULL if given a command-line string with invalid placement of '&'
 *
 * For valid commands, in addition to returning the command array
 * address, command_parse shall set the contents at the status address
 * given by the `status` pointer argument to the appropriate
 * foreground or background value.
 */
char** command_parse(char* line, int* status) {
  // Check arguments: must be non-NULL pointers.
  assert(line != NULL);
  assert(status != NULL);

  char* lineIterate = line;
  char prev = ' ';
  int countWords = 0;
  int countAmp = 0;
  bool sawAmp = false; // if we see & but encounter a char after it in line -> invalid string line
  while (*lineIterate != '\0') {
    // if the prev char is a space and the current char is start of a word the 
    if ((command_char_is_space(prev)) && (!command_char_is_space(*lineIterate)) && (*lineIterate != '&')) {
      countWords++;
    }

    // if the char we're at is an '&' and the next char is not a terminal and not a space (it's a char)
    if (sawAmp && !command_char_is_space(*lineIterate)) {
      return NULL;  // invalid command line
    } 

    // if the current char we're looking at is &, then mark the sawAmp var as true
    if (*lineIterate == '&') {
      countAmp++;
      sawAmp = true;
    }

    prev = *lineIterate; // update prev char
    lineIterate++; // go to next char
  }

  // set status depending on count of ampersands
  if (countAmp == 0) {
    *status = 1; // foreground command
  } else if (countAmp == 1) {
    *status = 0; // background command
  }

  // intializing array with the number of words (from line) it will hold  (+1 for NULL Address space)
  printf("before malloc: countWords = %d\n", countWords);
  char** commandArray = (char**) malloc((countWords + 1) * sizeof(char*)); 
  char** commandArrIter = commandArray;

  char* lineI = line;
  char* startOfWord = lineI;
  int countChar = 0;
 // printf("line is %s\n", lineI);

  while (*lineI != '\0' && (*lineI != '&')) {   // going through each character in the string 
    // count the char in each word
    // create a char subarray for that word 
    // insert chars into word subarray
    // put that subarray into commandArray

    countChar = 0;  // reset countChar for next word
    // get to start of word
    while (command_char_is_space(*lineI)) {
        lineI++;
    }
    startOfWord = lineI;
 //   printf("startOfWord = \"%c\"\n", *startOfWord);
 //   printf("line is %s\n", lineI);
    // move lineI pointer and subtract lineI - startOfWord = countChar in this word
    while ((*lineI != '\0') && !command_char_is_space(*lineI) && (*lineI != '&')) {  
      lineI++;
    } // lineI now points to space after end of word
  //  printf("end of word = \"%c\"\n", *lineI);

    countChar =  (int) (lineI - startOfWord);
    if (countChar > 0) {  // only make a string for the word if there are valid characters
      char* word = (char*) malloc((countChar + 1) * sizeof(char));  // (+1 for null char space)
      char* wordIterate = word;
     // printf("countChar = %d\n", countChar);
    

      // put the chars into the word subarray and put that subarray into commandArray
      while (startOfWord < lineI) {
        *wordIterate = *startOfWord;
        startOfWord++;
        wordIterate++;
      }
      *wordIterate = '\0';
    
    //  printf("word to add to command array = \"%s\"\n", word);
      // put the filled up subarray word into commandArray
      *commandArrIter = word;
      commandArrIter++; // go to next index of the command array
    }
}
  // at the end of the command array of words, put NULL address
  *commandArrIter = NULL; 
  return commandArray;
}

/**
 * command_show:
 *
 * Print the structure of a command array.
 *
 * Parameters:
 *
 * - command: a non-NULL pointer to the command array to print.
 */
void command_show(char** command) {
  // Check argument: must be non-NULL pointer.
  assert(command);

  // IMPLEMENT ME
  // iterate through each char pointer (to a char array)
  // array it points to until we reach the null address

  // while the contents of the elt of command array is not a NULL address
  printf("{\n");
  while (*command != NULL) {
    printf("  \"%s\",\n", *command);
    command++;  
  }
  printf("  NULL\n");
  printf("}\n");
}

/**
 * command_free:
 *
 * Free all parts of a command array created by command_parse.
 *
 * Parameters:
 *
 * - command: non-NULL pointer to the command array to free.
 */
void command_free(char** command) {
  // Check argument: must be non-NULL pointer.
  assert(command);

  // IMPLEMENT ME
  char** commandStart = command;

  while (*commandStart != NULL) {
    free(*commandStart);
    commandStart++;
  }

  free(command);
}