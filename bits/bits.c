/* 
 * CS 240 Bits
 * 
 * bits.c - Source file with your solutions.
 *
 * Do not add #include lines in this file.
 */

#if 0
CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int puzzle(arg1, arg2, ...) {
      /* Brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      // Inline comments explain specific steps if needed.
      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer literals 0 through 255 (0xFF), inclusive, using only decimal
     or hexadecimal notation.
       - Binary notation (0b11111111) is not accepted by the checker tools.
       - You are not allowed to use large literals such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. The list of "Legal ops" given in the function comment.
  
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  Your solution to a puzzle should use no more than the number of "Max ops"
  listed for the fuction.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:, not listed in the
     the "Legal ops" list for each function.
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.
 
  Assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts (>>) arithmetically on ints.
  3. Has unpredictable behavior when shifting an integer by more
     than the word size.

EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   * Legal ops: ! ~ & ^ | + << >>
   */
  int pow2plus1(int x) {
     /* Shifting left by n bits multiplies by 2^n. */
     return (1 << x) + 1;
  }
  int pow2plus1(int x) {
     /* Exploit ability of shifts to compute powers of 2. */
     int result = (1 << x);
     result = result + 1;
     return result;
  }
#endif


/* 
 * bitAnd: x&y using only ~ and | 
 *   Example: bitAnd(6, 5) = 4
 *   Legal ops: ~ |
 *   Max ops: 8
 *   Rating: 1
 *   Description: The bitwise operator AND will only return a 1 value if both of the
 *   bits at the same position are of value one as well. 
 *   An approach that can be taken would be to first perform bitwise negation of x and y. 
 *   Performing an OR statement on the negated x and y is equivalent to tthe flipped version of
 *   x AND y. 
 *   Hence, negating the OR statement results in bitwise AND. 
 */
int bitAnd(int x, int y) {
  return ~(~x|~y);
}

/* [INDEPENDENT PROBLEM]
 * bitXor: x^y using only ~ and & 
 *   Example: bitXor(4, 5) = 1
 *   Legal ops: ~ &
 *   Max ops: 14
 *   Rating: 1
 *   Description:  In XOR operations, anything XOR with itself returns 0, so we 
 *   used this information to come up with a solution by trial and error. If x 
 *   and y are equal, the XOR operation will return 0, so we first came up with 
 *   two cases. Case 1 is where we bitwise NOT x and use this to bitwise AND it 
 *   with y, which will return 0 since a value AND its complement is 0 (by the 
 *   complement’s law). Case 2 is similar but we bitwise NOT y instead of x. In 
 *   short, this is the operation: (~x & y) & (x & ~y).  If we add these cases 
 *   together using a bitwise AND operator, we’ll get 0 AND 0 which is 0. However, 
 *   this does not work for all cases. If we use two different values for x and y, 
 *   this operation will not work, so we tried two similar but different cases. 
 *   Case 1 is where we bitwise NOT x and y and put them in an AND operation. 
 *   Case 2 is where we bitwise AND x and y, giving us (~x & ~y) & (x & y) . 
 *   Using the same example where x and y inputs are the same, if we put a value 
 *   and itself in an AND operation, the result is itself (by the idempotency theorem). Case 1 and Case 2 will output results that are the exact opposite of each other (negated versions of each other), and if we put them in an AND operation, we’ll get a result of 0 as expected. However, we can get a result of 0 if we switch the order around as well. For example, let’s say Case 1’s result was 0110 and Case 2’s result was 1001. 0110 AND 1001 is 0 but 1001 AND 0110 is also 0, meaning that if we bitwise NOT (~x & ~y) and bitwise NOT (x & y) we’ll get the same result. In order to check this, we used example inputs where x and y were not the same, and came to the conclusion that the latter operation held true. 

 */
int bitXor(int x, int y) {
  return ~(~x & ~y) & ~(x & y);
}

/* 
 * thirdBits: return the int value where every third bit (including
 *            the LSB) is 1 and all other bits are 0.  This function
 *            takes no arguments and always returns the same result.
 *   Example: thirdBits() = 0b01001001001001001001001001001001
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 1
 *   Explanation: 
 *   The longest thirdBits pattern that can be formed fitting the 0xFF 
 *   constraint given is a = 0x49 = 0b01001001. We will use this value to
 *   start the pattern. We first decided to shift the value a to the left
 *   by 6 to increase the length of the value x. We then or that value with
 *   the previous value of a to incorporate the pattern onto the back 6 zeros. 
 *   We shifted by 6 instead of 8 which is the length of 0x49 because we do not
 *   want the leading 01 to mess up the thirdBits pattern. Now that we have variable
 *   x with a length of 14, we can perform the same steps but with a shift of 12. Lastly,
 *   since there is already 26 bits in the pattern, we only need to do the process with 
 *   a shift of 6 to get the final result of the pattern in 32 bits. 
 *   
 *  
 */
int thirdBits() {
  int x = 0x49;
  x = x<<6|x;
  x = x<<12|x;
  x = x<<6|x;
  return x; 
  // another solution: (((((0x49 << 9) | 0x49) << 9) | 0x49) << 6) | 0x9;
}

/* 
 * fitsBits: return 1 if x can be represented as an n-bit, two's
 *           complement integer, where 1 <= n <= 32.
 *   Examples: fitsBits(5,3) = 0, fitsBits(-4,3) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15 
 *   Rating: 2
 *   Hint: think about sign extension
 *   Description: In order to know if a value,x, can be represented 
 *   as an n-bit, two’s complement integer, we need first look at all
 *   the bits of x from the 2nd most significant bit. The reason for 
 *   this is because if x was extended from a n-bit integer, its first two 
 *   bits (from the MSB) will have the same value. For example, if there is
 *   a 3-bit integer that can be sign extended to x = 1110, then that 3-bit 
 *   integer would have a 1 at its MSB place that it extended to create the 
 *   two 1’s in the first two MSB places in x = 1110. Basically, 110 can be 
 *   extended to 1110 by extending its sign bit. We would need to create that 
 *   n-bit integer by taking the bits after the MSB and sign extend that integer 
 *   to see if it correctly represents x. 
 * 
 *   First, we would need to shift x to the left until it loses its sign bit or 
 *   MSB and becomes 32-bits (since an integer is 32 bits), and shift it again 
 *   to the right to sign extend its now MSB (that was x’s 2nd MSB). If x can 
 *   be represented by a n-bit integer, the sign extended integer should have 
 *   a commonality with the original x. In order to find how many places to shift,
 *   we would just need to do 32 - n = 32 + (~n + 1) since we are trying to shift 
 *   x until it holds the n-bit integer at its last few positions. 
 * 
 *   If we compare a sign extended x to its original value, the first few LSB places
 *   should be the same. For example, x = 1110 compared to the 3-bit, 110, they have 
 *   110 common. If we compare these two values using XOR, we will get a result of 0…0000 
 *   since if you XOR a value by itself, you will get 0 (you can only get a 1 if the two bits 
 *   that you’re comparing are different). Since we want to return a 1 for this example that 
 *   examines a x value that can be sign extended or represented as a n-bit, two’s complement 
 *   integer, we will need to logically negate this by using ! to get an answer of 1. If x holds
 *   a value that could not be represented by a n-bit, two’s complement integer, the two values 
 *   that we compare using XOR will have different bits that’ll result in at least one 1 bit and 
 *   if we logically NOT that using !, we’ll false = 0. 
 */
int fitsBits(int x, int n) {
  int nShift = (32 + (~n + 1)); 
  int potentialSignExtendedn = ((x << nShift) >> nShift);
 return !(x ^ potentialSignExtendedn);
}

/* [INDEPENDENT PROBLEM]
 * sign: return 1 if positive, 0 if zero, -1 if negative
 *   Examples: sign(130) = 1
 *             sign(-23) = -1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 10
 *   Rating: 2
 *   Hint: compute separate answers and combine
 *   Description: 
 *   !!x - the double logical negation of a value will return 1 
 *   if the value is nonzero. 
 *   (x>>31) is essentially sign extension. 32-bits of 0 will be returned for a positive
 *   x and 32-bits of 1 will be returned for a negative x.
 *   Performing bitwise OR on these 2 expressions will result in the return of values
 *   11111... (-1) for negative values, 0000000...1 (1) for positive values and 000000 (0) for zero.
 */
int sign(int x) {
    return (!!x)|(x>>31);
}

/* 
 * getByte: extract byte n from int x,
 *          where bytes numbered from 0 (LSB) to 3 (MSB)
 *   Examples: getByte(0x12345678,1) = 0x56
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 *   Description: First, you need to shift integer x by (8 x n)
 *   times to the right to lose the bits to the right of byte n.
 *   8 x n can be expressed as n << 3 since 8 = 23. The next step 
 *   would be to get rid of all the bits to the left (in front of) 
 *   of byte n. Our first approach was to shift the integer until we 
 *   lost all the bits to the left of byte n and then shift that integer 
 *   back the other way until the last two bits of the integer is byte n, 
 *   but this only works if byte n’s sign bit is 0, otherwise, we would get 
 *   a result with a bunch of 1’s in the front of byte n. By using the bitwise
 *   AND operator, we can filter all the numbers in front of byte n using the 
 *   identity theorem. The bitwise AND returns 1 only if the two bits we’re 
 *   comparing are both 1, so by using bitwise AND to our integer that was shifted
 *   8 times n to the right, we can either filter any 1’s that we don’t want in 
 *   our result by using 0 and bitwise AND or keep a bit we want by using 1 and 
 *   bitwise AND.  All we want to keep is our last 8 bits in the integer that was 
 *   shifted so we can bitwise AND this with 0000…0000 1111 1111. The last 8 bits 
 *   of our result will depend on the shifted x integer since we’re using bitwise 
 *   AND with 1 and all the bits in front of these last 8 bits will depend on the 
 *   integer we’re using to AND x, and since they’re all 0’s, the result must be 0. 
 *   0000…0000 1111 1111 expressed in hexadecimals is 0xFF. 
 */
int getByte(int x, int n) {
  int filter = 0xFF;
  //shift x by n*8 times then filter the bits on the left that you don't want to keep
  return (x >> (n<<3)) & filter;
}

/* 
 * logicalShift: logical shift x to the right by n,
 *               where 0 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3 
 *   Hint: Shifting a 32-bit value by 32 is undefined.
 *         Think about splitting a potentially undefined shift into
 *         smaller defined shifts.
 *  Description: First, we need to shift the integer, x, by n times to the right. From here,
 *  there are two cases. If the MSB of x is 0, the shift to the right will add 0's in the front,
 *  making it look like a logical shift, but if the MSB of x is 1, the shift to the right will
 *  add 1's to the front. In order to filter that or mask it, we would need to bitwise AND it with 
 *  a number that can preserve the original bits but mask the 1's in the front that was added after
 *  the shifting. This mask integer would need to have n number of 0 bits in the front and the rest 1's. 
 *  In order to get this number, we can use -1 since in two's complement number, -1 is 1111...1111 (32-bit of 1's).
 *  If we shift this number to the left by 32-n times, we would get n 1's in the front and the rest 0's,
 *  and we can then bitwise NOT this number to get the mask we want. 
 */
int logicalShift(int x, int n) {
  //int mask = ~((0x1 << 31) >> (n-1)) why doesn't this work

  int shift = (~0) << (31 + (~n+1)); //30-n, 2 didn't work? if I put 30, if n = 31 then I'll shift by -1 which I can't do. Need to use the highest possible n to avoid this
  int mask = ~(shift << 1);
  return (x >> n) & mask;
}

/* 
 * addOK: determine if x+y succeeds without overflow
 *   Example: addOK(0x80000000,0x80000000) = 0,
 *            addOK(0x80000000,0x70000000) = 1, 
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3
 *  Description: In two's complement, there will be overflow in two situations.
 *  If two negative numbers are added and output a positive value or if two
 *  positive numbers are added and output a negative value. To see if there's 
 *  overflow we can simply look at the MSB of x, y, and the output (the sum),
 *  For overflows, the MSB of the sum will not be the same as either x or y
 *  so if we compare the sum to x and the sum to y using bitwise XOR, we'll 
 *  get a value of 1. For sums with no overflows, there will be at least one 
 *  same bit between the sum and either or both x and y. If we bitwise XOR
 *  two same bits, it results in 0 so if we compare both x with the sum and 
 *  y with the sum and bitwise AND these combinations, a sum with no overflows
 *  will result in a 0. To get the correct output, we would just need to bitwise 
 *  NOT these results.  
 *  
 */
int addOK(int x, int y) {
  int sum = x + y;
  // get the MSB's to compare
  int x_MSB = x >> 31;
  int y_MSB = y >> 31;
  int sum_MSB = sum >> 31;
  // compare sum with x and with y
  return !((x_MSB ^ sum_MSB) & (y_MSB ^ sum_MSB));
}

/* [INDEPENDENT PROBLEM]
 * bang: compute !x without using !
 *   Examples: bang(3) = 0, bang(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4 
 *   Hint: 0 is the only int x for which both x >= 0 and -x >= 0
 *  Description: Using the hint, since 0 is the only int x for which both
 *  x >=0 and -x >= 0, we can compare -x with x. Depending on the input x
 *  either x or -x will be at least one 1 bit in the MSB since negative,
 *  two's complement numbers have a 1 bit in the MSB place.
 *  For non-zero inputs our goal is to make sure 
 *  that there's a number that will guarantee us a 1 bit in the MSB place 
 *  so that when we shift it to fit a 32-bit integer, all the bits will be
 *  111..111 = -1 (that we can then add 1 to make it a 0). If we compare
 *  x and -x with bitwise OR, we'll end up with a number that has a 1 bit
 *  as the MSB, and with this we'll be able to get a value of -1 by shifting it.
 *  For all these steps, input 0's will remain as a 0 until the final step, 
 *  where we add 1 to output the result. 
 */
int bang(int x) {
  return ~(~x&~(~x+1))+1;
  /*
  // compare -x and x then make that result into an integer (32 bits)
  int negativeX = ~x + 1;
  // the result will be a -1 (111...1111) if x is a non-zero input and 0 (000...0000) if x is a 0 input
  int comparedInt = (negativeX | x) >> 31;
  // -1 + 1 = 0, 0 + 1 = 1 -> comparedInt + 1 = answer
  return comparedInt + 1; */
}


/* 
 * conditional: same as x ? y : z 
 *   Example: conditional(2,4,5) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 *   Description: x represents a boolean expression, y is returned is x is true 
 *   and z is returned is x is false. So depending on the boolean value x, we want 
 *   to either mask y or z. If x is a non-zero number, it is true so we need to 
 *   mask z by canceling all its bits to 0 and mask y with 1's so that by the 
 *   identity law, we return y, itself. The opposite will be true for a zero number 
 *   input for x. By double logical NOT-ing x, we will get a 1 if x is a non-zero 
 *   number and 0 is x is zero. We can create a mask using this and -1. 
 *   -1 + 0 = -1 (which will give us 1111...1111) and -1 + 1 = 0 (which will give us
 *   0000....0000). If x is true, our mask will be -1 + 1 = 0, so we can cancel 
 *   the bits in z and use the negated mask (of 111..111) to return the y value. 
 *   The opposite is true is x is false (0). 
 *   
 */
 // expressions have value, statements perform and action
 // conditional (bool expression, then value, else value)
int conditional(int x, int y, int z) {
  // if x is true (any non-zero number is true in boolean value), return y, else return z 
  int mask = !!(x) + ~(0);
  return (y & (~mask)) ^ (z & mask);
}

/*
 * isPower2 - returns 1 if x is a power of 2, and 0 otherwise
 *   Examples: isPower2(5) = 0, isPower2(8) = 1, isPower2(0) = 0
 *   Note that no negative number is a power of 2.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 4
 *
 * SAMPLE DESCRIPTION AND SOLUTION:
 * This description is on the detailed side. Explains the properties
 * extensively and includes quick connections with the operators.
 * 
 * Use the property that, if x is the nth power of two, x has exactly
 * one 1 bit, followed by n zeros.  For example, 8 = 0b0...01000. The
 * predecessor of the nth power of 2 has exactly n ones, all in the n
 * least significant bits; all other bits are 0.  For example, 7 =
 * 0b0...00111. Any other pair of x and x-1 has at least one 1 bit in
 * common. Example: 6 (0b0...0110) and 5 (0b0...0101).  There are
 * actually two other values that are *not* powers of two that also
 * satisfy the property "x and x-1 share no 1 bits." Zero (=0...0 vs
 * -1 = 1...1) and the minimum twos complement value (=10...0 vs the
 * maximum twos complement value 01...1). In fact, no negative is a
 * power of, so we filter out all negatives, capturing the twos
 * complement minimum.
 */
int isPower2(int x) {
  return !(x & (x + ~0)) // x and its predecessor share no 1 bits
    & !!x               // AND x is nonzero
    & !(x >> 31);       // AND x is non-negative
}



#if 0
/* 
 * SAMPLE ALTERNATIVE DESCRIPTION:
 * This description reorganizes the ideas more incrementally. It
 * explains more about the connection to operators and mechanics,
 * making it a more comprehensive description.
 */
int isPower2_alt1(int x) {
  // A power of 2 has exactly one 1 bit among all its bits and shares
  // no 1 bits in common with the next smallest value (the predecessor).
  // This expression yields the value 1 if this property holds and 0
  // otherwise.
  int shares_no_ones_with_pred = !(x & (x + ~0));
  // But two other values share this property with powers of 2:
  //   A. zero also satisfies this property, so we must check for it.
  //      !! transforms 0 to 0 and transforms any nonzero number to 1.
  int nonzero = !!x;
  //   B. The most negative number, the twos complement minimum, also
  //      satisfies the same 1-sharing property. Since no power of 1
  //      is negative, isolate the sign bit and use Boolean NOT to
  //      yield 1 if x is non-negative.
  int nonnegative = !(x >> 31);
  // Overall, x is a power of two if and only if it shares no ones
  // with its predecessor and it is nonzero and it is non-negative.
  return shares_no_ones_with_pred & nonzero & nonnegative;
}

/* 
 * ALTERNATIVE SHORTER SOLUTION:
 * This version is reorganized vs alt1 to use fewer operators. It
 * still uses the same insights.
 */
int isPower2_alt2(int x) {
  // A power of 2 has exactly one 1 bit among all its bits and shares
  // no 1 bits in common with the next smallest value (the predecessor).
  // This expression yields the value 0 if this property holds and nonzero
  // otherwise.
  int shares_ones_with_pred = x & (x + ~0);
  // But two other values share this property with powers of 2:
  //   A. zero also satisfies this property, so we must check for it.
  //      ! transforms 0 to 1 and transforms any nonzero number to 0.
  int iszero = !x;
  //   B. The most negative number, the twos complement minimum, also
  //      satisfies the same 1-sharing property. Since no power of 1
  //      is negative, duplicate the sign bit to produce -1 or all
  //      negative x and 0 for all non-negative x.
  int negative = x >> 31;
  // Overall, x is a power of two if and only if it shares no ones
  // with its predecessor and it is nonzero and it is non-negative.
  // If any one of these three values carries any 1 bit, x is not a
  // power of 2.
  return !( shares_ones_with_pred | iszero | negative);
}
#endif
