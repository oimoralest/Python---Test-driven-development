#!/bin/bash
#
# Performing checks on the Test-driven development project

############################################################
# Print KO, in red, followed by a new line
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
############################################################
function print_ko()
{
	echo -e "[\033[31mFAIL\033[37m]"
}
############################################################
# Print OK in green, followed by a new line
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
############################################################
function print_ok()
{
    echo -e "[\033[32mPASS\033[37m]"
}
############################################################
# Check if a file exist
############################################################

function check_file()
{

FILENAME=$1

echo "
Checking if $1 exists
"

# waiting
sleep 4

if test -f "$FILENAME";
then
    print_ok
else
    print_ko
    echo -e "
\033[31m$FILENAME file does not exists\033[37m
    "
fi
}

############################################################
# Checks for PEP 8 styles in all Python files
############################################################

function check_pep8()
{

echo "
***********************************************************
                       CHECKING PEP 8
***********************************************************"

echo "
Checking PEP 8 for all Python files
"

# waiting
sleep 4

pep8 *.py > __tmp__.txt

LINES=$(wc -l  __tmp__.txt | cut -d" " -f1)

if test "$LINES" != 0;
then
    print_ko
    echo -e "
\033[31m Check pep8 in your files \033[37m
    "
else
    print_ok
fi

rm -f __tmp__.txt
}
############################################################
#
############################################################
# Checks for a word in a file
############################################################

function check_shebang()
{

echo "
Checking for $1
"

FILE=$2

if test -f "$FILE";
then
    WORD=$(grep -e $1 ./0-add_integer.py)
else
    echo -e "
\033[31m $FILE file does not exists\033[37m
    "
    return
fi

# waiting
sleep 4

if test "$WORD";
then
    print_ok
else
    print_ko
    echo -e "
\033[31mMissing $1\033[37m
"
fi
}
############################################################
# Checks if you are importing modules
############################################################
function check_import()
{

echo "
Checking if you are importing modules
"

FILE=$2

if test -f "$FILE";
then
    WORD=$(grep -e $1 ./0-add_integer.py)
else
    echo -e "
\033[31m $FILE file does not exists\033[37m
    "
    return
fi

# waiting
sleep 4

if test "$WORD";
then
    print_ko
    echo -e "
\033[31mYou are importing modules!\033[37m
"
else
    print_ok
fi
}
############################################################
# TESTS
############################################################
# Test for README.md
echo "
***********************************************************
                    CHECKING ./README.md
***********************************************************"
check_file ./README.md

#Test for PEP 8
check_pep8

# Test for 0-add_integer.py

echo "
***********************************************************
                CHECKING ./0-add_integer.py
***********************************************************"

# Checking if exists
check_file ./0-add_integer.py
# Checking for the shebang
check_shebang '#!/usr/bin/python3' ./0-add_integer.py
# Checking for importing modules
check_import import ./0-add_integer.py
# Checking for 0-add_integer.py test
check_file tests/0-add_integer.txt

# Continue?
echo "Do you want to continue [y/n]?"

read ANSWER

if test "$ANSWER" = "n" || test "$ANSWER" = "N";
then
    echo "Exiting..."
    sleep 1
    exit 0
fi

# Test for 2-matrix_divided.py

echo "
***********************************************************
              CHECKING ./2-matrix_divided.py
***********************************************************"

# Checking if exists
check_file ./2-matrix_divided.py
# Checking for the shebang
check_shebang '#!/usr/bin/python3' ./2-matrix_divided.py
# Checking for importing modules
check_import import ./2-matrix_divided.py
# Checking for 2-matrix_divided.py test
check_file tests/2-matrix_divided.txt

# Continue?
echo "Do you want to continue [y/n]?"

read ANSWER

if test "$ANSWER" = "n" || test "$ANSWER" = "N";
then
    echo "Exiting..."
    sleep 1
    exit 0
fi

# Test for 3-say_my_name.py

echo "
***********************************************************
                CHECKING ./3-say_my_name.py
***********************************************************"

# Checking if exists
check_file ./3-say_my_name.py
# Checking for the shebang
check_shebang '#!/usr/bin/python3' ./3-say_my_name.py
# Checking for importing modules
check_import import ./3-say_my_name.py
# Checking for 3-say_my_name.py test
check_file tests/3-say_my_name.txt

# Continue?
echo "Do you want to continue [y/n]?"

read ANSWER

if test "$ANSWER" = "n" || test "$ANSWER" = "N";
then
    echo "Exiting..."
    sleep 1
    exit 0
fi

# Test for 4-print_square.py

echo "
***********************************************************
                CHECKING ./4-print_square.py
***********************************************************"

# Checking if exists
check_file ./4-print_square.py
# Checking for the shebang
check_shebang '#!/usr/bin/python3' ./4-print_square.py
# Checking for importing modules
check_import import ./4-print_square.py
# Checking for 4-print_square.py test
check_file tests/4-print_square.txt

# Continue?
echo "Do you want to continue [y/n]?"

read ANSWER

if test "$ANSWER" = "n" || test "$ANSWER" = "N";
then
    echo "Exiting..."
    sleep 1
    exit 0
fi

# Test for 5-text_indentation.py

echo "
***********************************************************
               CHECKING ./5-text_indentation.py
***********************************************************"

# Checking if exists
check_file ./5-text_indentation.py
# Checking for the shebang
check_shebang '#!/usr/bin/python3' ./5-text_indentation.py
# Checking for importing modules
check_import import ./5-text_indentation.py
# Checking for 5-text_indentation.py test
check_file tests/5-text_indentation.txt

# Continue?
echo "Do you want to continue [y/n]?"

read ANSWER

if test "$ANSWER" = "n" || test "$ANSWER" = "N";
then
    echo "Exiting..."
    sleep 1
    exit 0
fi

# Test for tests/6-max_integer_test.py

echo "
***********************************************************
             CHECKING tests/6-max_integer_test.py
***********************************************************"

# Checking if exists
check_file tests/6-max_integer_test.py
# Checking for the shebang
check_shebang '#!/usr/bin/python3' tests/6-max_integer_test.py
# Checking for importing modules
check_import import tests/6-max_integer_test.py

# Continue?
echo "Do you want to continue [y/n]?"

read ANSWER

if test "$ANSWER" = "n" || test "$ANSWER" = "N";
then
    echo "Exiting..."
    sleep 1
    exit 0
fi

# Test for 100-matrix_mul.py

echo "
***********************************************************
               CHECKING ./100-matrix_mul.py
***********************************************************"

# Checking if exists
check_file ./100-matrix_mul.py
# Checking for the shebang
check_shebang '#!/usr/bin/python3' ./100-matrix_mul.py
# Checking for importing modules
check_import import ./100-matrix_mul.py
# Checking for 100-matrix_mul.py test
check_file tests/100-matrix_mul.txt

# Continue?
echo "Do you want to continue [y/n]?"

read ANSWER

if test "$ANSWER" = "n" || test "$ANSWER" = "N";
then
    echo "Exiting..."
    sleep 1
    exit 0
fi

# Test for 100-matrix_mul.py

echo "
***********************************************************
               CHECKING ./101-lazy_matrix_mul.py
***********************************************************"

# Checking if exists
check_file ./101-lazy_matrix_mul.py
# Checking for the shebang
check_shebang '#!/usr/bin/python3' ./101-lazy_matrix_mul.py
# Checking for importing modules
check_import import ./101-lazy_matrix_mul.py
# Checking for 101-lazy_matrix_mul.py test
check_file tests/101-lazy_matrix_mul.txt

# Continue?
echo "Do you want to continue [y/n]?"

read ANSWER

if test "$ANSWER" = "n" || test "$ANSWER" = "N";
then
    echo "Exiting..."
    sleep 1
    exit 0
fi

# Test for 102-python.c

echo "
***********************************************************
               CHECKING ./102-python.c
***********************************************************"

# Checking if exists
check_file ./102-python.c
# Checking for the betty

echo "
Checking betty for 102-python.c
"

# waiting
sleep 4

betty ./102-python.c > __tmp__.txt

LINES=$(wc -l  __tmp__.txt | cut -d" " -f1)

if test "$LINES" != 0;
then
    print_ko
    echo -e "
\033[31m Check betty in your file \033[37m
    "
else
    print_ok
fi

rm -f __tmp__.txt

echo "Exiting..."
sleep 1
exit 0