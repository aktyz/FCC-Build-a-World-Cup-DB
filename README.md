# FCC-Build-a-World-Cup-DB
One of the projects to complete [FCC Relational Database Certification](https://www.freecodecamp.org/learn/relational-database/)

More SQL notest added in [FCC-Build-a-Celestial-Bodies-DB README.md](https://github.com/aktyz/FCC-Build-a-Celestial-Bodies-DB/blob/main/README.md)

## Bash Scripting

### Bash Commands
```sh
touch <file name>
sh <bash script name>
bash <bash script name>
which bash
ls -l
chmod +x <file name>
man <command name>
help <command name>>
help [[ expression ]]
help test
cat <file name>

echo $? #will show the exit status of the latest command run, where '0' stands for 'true'

[[ -a countdown.sh ]]; echo $?
[[ -a bad_file.txt ]]; echo $?
[[ -x countdown.sh ]]; echo $?
[[ -x countdown.sh && 5 -le 4 ]]; echo $?
[[ -x countdown.sh || 5 -le 4 ]]; echo $?
[[ ! 11 =~ ^[0-9]+$ ]]; echo $? #NOT matching RegEx

ls /  #lists what's in the root of the system
printenv #will print all environment variables
declare -p #will print all environment variables
declare -p <variable name>
type <command name> #will let you know the place where the command is running from
declare -p IFS #check Internal Field Separator

```

### Script Elements
```shebang```
```#!<path_to_interpreter>```
Example: ```#!/bin/bash```
- creating variables
```VARIABLE_NAME=VALUE```
Example: ```QUESTION1="What's your name?"```
			```I=$1```
- using variables
```$VARIABLE_NAME```
Example: ```echo $QUESTION1```
		```echo Hello $NAME.```
#### reading user input
``` read VARIABLE_NAME```
Example: ```read NAME```
- interpreting invisible chars
```echo -e "\nYour text with invissible signs usage goes here\n"```
Example: ```echo -e "\nHello $NAME from $LOCATION. I learned that your favorite coding website is $WEBSITE!"```
- comments
``` # <comment> ```
Example: ```# Program that counts down to zero from a given argument```
- print all script arguments: ```echo $*```
- print selected argument passed to the script
```echo $<number of argument>```
Example: ```echo $1```
#### if statement
```sh
if [[ CONDITION ]]
then
	STATEMENTS
```
```elif [[ CONDITION ]]``` (you can have as many elif parts as you want)
```sh
then
	STATEMENTS
else
	STATEMENTS
fi
```
Example:
```sh
If [[ $1 == arg1 ]]
then
  echo true
fi
```
```sh
if [[ $1 == arg1 ]]
then
  echo true
else
  echo false
fi

echo -e "\n~~ Bingo Number Generator ~~\n"
```
```NUMBER=$(( RANDOM%75+1 ))``` <- creating a random number from 1 to 75
```
TEXT="The next number is, "
if (( NUMBER <= 15 ))
  then
    echo $TEXT B:$NUMBER
elif [[ $NUMBER -le 30 ]]
  then
    echo $TEXT I:$NUMBER
elif (( NUMBER < 46 ))
  then
    echo $TEXT N:$NUMBER
elif [[ $NUMBER -lt 61 ]]
  then
    echo $TEXT G:$NUMBER
else
  echo $TEXT O:$NUMBER
fi
```
- You can compare integers inside the brackets (```[[ ... ]]```) of your if with:
	-```-eq``` (equal),
	-```-ne``` (not equal),
	-```-lt``` (less than),
	-```-le``` (less than or equal),
	-```-gt``` (greater than),
	-```-ge``` (greater than or equal)
-```[[ test ]]```
Example:
```
[[ -a countdown.sh ]]; echo $?
[[ -a bad_file.txt ]]; echo $?
```
#### case statement
```sh
case EXPRESSION in
  Pattern_Case_1)
   STATEMENTS
   ;;
 Pattern_Case_1)
   STATEMENTS
   ;;
 Pattern_Case_N)
   STATEMENTS
   ;;
 *)
   STATEMENTS
   ;;
esac
```

#### for statement
```sh
for (( i = 10; i > 0; i-- ))
	do
		echo $i
	done
```
Example:
```
for (( i = $1; i > 0; i--))
    do
      echo $i
    done
```
- multiline comment:
```
: ' <multiline
comment>
'
```
#### while statement
```
while [[ CONDITION ]]
do
  STATEMENTS
done
```
Example:
```
I=$1
while [[ $I -ge 0 ]]
	do
		echo $I
		(( I-- ))
		sleep 1
	done
```
#### until statement
```
until [[ CONDITION ]]
do
  STATEMENTS
done
```
Example:
```until [[ $QUESTION =~ \?$ ]]``` <- using RegEx in condition
```
do
  GET_FORTUNE
done
```

#### Calculations
- changing the value of a variable:
```(( I++ ))``` - use double parenthesis
Example: ```(( I+=10 ))```
- making the caluculation WITHOUT changing the variable value:
```$(( I++ ))``` - use double parenthesis with a $ sign
Example:
```
echo $(( I + 4 ))
J=$(( I-6 ))
```
So, as a reminder, ```(( ... ))``` will perform a calculation or operation and output nothing. ```$(( ... ))``` will replace the calculation with the result of it.
#### Arrays
- creating arrays: ```ARR=("a" "b" "c")```
- accessing array elements: ```echo ${ARR[1]}```
- print all array: ```echo ${ARR[@]}``` or ```echo ${ARR[*]}``` or ```declare -p ARR```
#### Functions
```
FUNCTION_NAME() {
  STATEMENTS
}
```
Example:
```
GET_FORTUNE() {
	echo "Your fortune"
}
```
- calling a function with one argument: ```GET_FORTUNE arg1```
- accessing the argument of a function: ``` $1```
#### Pipes: |
```
cat courses.csv | while read MAJOR COURSE
do
echo $MAJOR
done
```