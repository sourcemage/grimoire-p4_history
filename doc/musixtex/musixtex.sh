#!/bin/bash
############################################################
#
#  musixtex.sh
#
#  MusixTeX processor, 
#  handles all 3 passes, and musixpss if required
#
#  Copyleft Joel Mayes 2002 <bluebird@optushome.com.au>
#
#  Written for the Sourcemage GNU/Linux musixtex spell
#  and contains code fragments and ideas from the cast 
#  script.
#  
#  <http://sourcemage.org>
#
#  Distributed under Version 2 or greater of the GPL
#  http://www.gnu.org/copyleft/gpl.txt
#
############################################################
#
#  TODO
#   write man page
#   add support for multiple files
#   seperate options to external config file
#
############################################################
#
#  You may need to customize the following
#  
############################################################

# Program you use to convert dvi files 
# leave this blank to view the dvi
CONVERTER="/usr/bin/dvips"

# Options to pass to your converter
# if you use dvips put -o here
CONVERTER_OPTIONS="-o"

# Format your program converts to
FORMAT="ps"

# Program used to view the final output
VIEWER="/usr/bin/gv"

############################################################
#
#  Anything below here shouldn't need changing
#  
############################################################

DEFAULT_COLOUR="\e[0m" 
HEADER_COLOUR="\e[32m"

VIEW="no"
KEEP="no"
PSS="no"

if [ -z $DEBUG ] 
then 
    DEBUG="/dev/null" 
fi

help()
{
    cat  <<  EOF

mx.sh processes MusixTeX files it handles all 3 passes and
will call any external programs required by inputed MusixTeX
entensions

-d  |  --display        Display the compiled file
-k  |  --keep           Don't clean up any created during the compilation

EOF
    exit 1
}


process_parameters() 
{
    header "running process_parameters()"    >>  $DEBUG   2>&1
    while [ -n "$1" ] 
    do 
        if echo "" $1 | grep -q "^ -"; 
        then 
            case $1 in 
                -d|--display) export VIEW="yes"; shift 1 ;;
                   -k|--keep) export KEEP="yes"; shift 1 ;;
                           *) help                       ;; 
            esac 
        else 
            shift 
        fi 
    done 
    echo "VIEW =" $VIEW    >>  $DEBUG   2>&1
    echo "KEEP =" $KEEP    >>  $DEBUG   2>&1
}

get_file_name() 
{ 
    header "running get_file_name()"     >>  $DEBUG   2>&1
    while [ -n "$1" ]; 
    do 
        if echo "" $1 | grep -q "^ -"; 
        then 
            case $1 in 
                -d|--display) shift 1 ;; 
                   -k|--keep) shift 1 ;;
                           *) shift 1 ;; 
            esac 
        else 
            FILE=`echo $1 | cut -d . -f 1` 
            echo "file name is" $FILE    >>  $DEBUG   2>&1
            shift 
        fi 
    done
}

read_texinputs() 
{
    header "running read_options()"     >>  $DEBUG   2>&1
    COUNT=0 
    for INPUT in `egrep "\input" $FILE.tex | cut -d ' ' -f 2` 
    do 
        OPTION[$COUNT]=$INPUT 
        COUNT=$(echo "$COUNT + 1" | bc) 
    done

    header "\inputs in tex file are" 
    echo ${OPTION[*]}     >>  $DEBUG   2>&1
}

parse_texinputs() 
{ 
    header "running parse_options()"    >>  $DEBUG   2>&1

    for i in ${OPTION[*]} 
    do 
        header $i 
        if [ $i = musixpss ] 
        then 
            PSS="yes" 
        fi 
    done 
}

header() 
{ 
    echo -e  "${HEADER_COLOUR}"     >>  $DEBUG   2>&1
    echo -n  "$2"                   >>  $DEBUG   2>&1
    echo -e  "${DEFAULT_COLOUR}"    >>  $DEBUG   2>&1
} 

clean_up()
{ 
    header "running clean_up ()"              >>  $DEBUG   2>&1
    echo "do you want to keep old files?" $KEEP     >>  $DEBUG   2>&1
    if [ ! $KEEP = "yes" ] 
    then 
        echo "Cleaning"                       >>  $DEBUG   2>&1
        rm  -fv  $FILE.mx?                    >>  $DEBUG   2>&1
        rm  -fv  $FILE.dvi                    >>  $DEBUG   2>&1
        rm  -fv  $FILE.log                    >>  $DEBUG   2>&1
        header "Cleaning slur files"          >>  $DEBUG   2>&1
        rm  -fv  $FILE.mp                     >>  $DEBUG   2>&1
        rm  -fv  $FILE.slu                    >>  $DEBUG   2>&1

        COUNT=1 
        while [ -e $FILE.$COUNT ] 
        do 
            rm -v $FILE.$COUNT                >>  $DEBUG   2>&1
            COUNT=$(echo "$COUNT + 1" | bc) 
        done 
    else 
        echo "Keeping old files"              >>  $DEBUG   2>&1
    fi
}

first_pass() 
{ 
    header "First pass"     >>  $DEBUG   2>&1
    tex $FILE               >>  $DEBUG   2>&1
    pss 
    musixflx $FILE          >>  $DEBUG   2>&1
}

pss() 
{ 
    header "running pss ()"             >>  $DEBUG   2>&1
    echo "shall I use musixpss?" $PSS   >>  $DEBUG   2>&1

    if [ $PSS = "yes" ] 
    then 
        header "Running musixpss"       >>  $DEBUG   2>&1
        musixpss $FILE                  >>  $DEBUG   2>&1
        header "Running METAPOST"       >>  $DEBUG   2>&1
        mpost $FILE                     >>  $DEBUG   2>&1
    else
        header "Not running musixpss"   >>  $DEBUG   2>&1
    fi 
}

second_pass() 
{ 
    header "Second pass"        >>  $DEBUG   2>&1
    tex $FILE                   >>  $DEBUG   2>&1
    musixflx $FILE              >>  $DEBUG   2>&1
}

third_pass() 
{ 
    header "Third pass"         >>  $DEBUG   2>&1
    tex $FILE                   >>  $DEBUG   2>&1
}

display() { 
    header "running display()"                      >>  $DEBUG   2>&1
    echo "do you want to view the output?" $VIEW    >>  $DEBUG   2>&1

    if [ $VIEW = "yes" ]
    then
        if [ -n $CONVERTER ] 
        then 
            echo "converting file"                      >>  $DEBUG   2>&1
            $CONVERTER $FILE.dvi $CONVERTER_OPTIONS     >>  $DEBUG   2>&1
        else
            echo "not converting file"                  >>  $DEBUG   2>&1
        fi
        if [ -n $VIEWER ]
        then
            echo "displaying file"                      >>  $DEBUG   2>&1
            $VIEWER  $FILE.$FORMAT                      >>  $DEBUG   2>&1
        else 
            echo "not displaying"                       >>  $DEBUG   2>&1
        fi
    fi 
}

process_parameters $*
get_file_name      $*
read_texinputs
parse_texinputs
clean_up
first_pass
second_pass
third_pass
display
clean_up

exit 0
