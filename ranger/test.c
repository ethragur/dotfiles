/*
 * =====================================================================================
 *
 *       Filename:  test.c
 *
 *    Description:  Test project
 *
 *        Version:  1.0
 *        Created:  07/01/2015 02:15:59 AM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */


#include	<stdlib.h>
#include	<stdio.h>

void testfunc(int*);
/* 
 *
 * ===  FUNCTION  ======================================================================
 *         Name:  main
 *  Description:  
 * =====================================================================================
 */
	int
main ( int argc, char *argv[] )
{
	int test = 5;
	test++;
	testfunc(&test);	
	printf("%d\n", test);
	return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  testfunc
 *  Description:  
 * =====================================================================================
 */
	void
testfunc ( int *x )
{
	(*x)++;
	return;
}		/* -----  end of function testfunc  ----- */
