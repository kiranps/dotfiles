#!/bin/bash
# danialjose at gmail dot com
# Forked from ishan dot karve at gmail dot com hidu news paper downloading script
# This program comes with ABSOLUTELY NO WARRANTY;
# for details, visit http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
# Script to download Malayala Manorama Magazines
# No more subscription .. pls donate the money Free software development.
# As always /// Its free to use...
# Get user to select Magazine
edition_choice=([0]=MMFast [1]=MMKarshakasree [2]=MMSamp [3]=MMVanitha [4]=MMMan [5]=MMWeek [6]=MMBhasha [7]=MMWeekly )
edition_name=([0]=MMFast [1]=MMKarshakasree [2]=MMSamp [3]=MMVanitha [4]=MMMan [5]=MMWeek [6]=MMBhasha [7]=MMWeekly )
echo "MM Magazines are"
echo "-------------------------------------------------"
echo "0. Fast Track"
echo "1. Karshaka Sree"
echo "2. Sambathyam"
echo "3. Vanitha"
echo "4. The Man"
echo "5. The Week (Error with default date -01, change _01_ to _15_ or _30_ manualy)"
echo "6. Bashaposhini (Not working)"
echo "7. Manorama Weekly (Not working)"
echo "-------------------------------------------------"
while true; do
    read -p "Enter magazine you wish to selec[0-3]: " ed
    case $ed in
       [01234567]) 
 echo "Thanks." 
 break;;
        * ) echo "Please select the correct numeric serial.";;
    esac
done
#spider the selected edition using wget to estimate number of pages
#define max incremental page limit
max_spider=200
echo "Estimating number of pages in magazine edition"
#start spider for main editon
 for ((  j = 1 ;  j <= $max_spider;  j++  ))
    do
      #prepend zero to single digits
      _PR='_PR'
      pageno=`printf "%03d" $j`  
      echo "Searching for Page $pageno"
      I_FILE="http://eweekly.manoramaonline.com/ManoramaLibrary/${edition_choice[ed]}/`date +%Y`/`date +%m`/01/${edition_choice[ed]}_`date +%Y`_`date +%m`_01_$pageno_PR.jpg"
 debug=`wget --spider $I_FILE 2>&1`
 echo $debug
      if [[ $debug =~ .*link!!!.* ]]
      then
      break
      fi
done
clear
#decrement counter
(( j = j - 1 ))
npages_A=$j
echo "Estimating number of pages in magazine edition supplement"



#start spider for newapaper supplement
 for ((  j = 1 ;  j <= $max_spider;  j++  ))
    do
      #prepend zero to single digits
      pageno=`printf "%03d" $j`  
      echo "Searching for Page $pageno"
      I_FILE="http://eweekly.manoramaonline.com/ManoramaLibrary/${edition_choice[ed]}/`date +%Y`/`date +%m`/01/${edition_choice[ed]}_`date +%Y`_`date +%m`_01_$pageno$_PR.jpg"
 debug=`wget --spider $I_FILE 2>&1`
 
 echo $debug
      if [[ $debug =~ .*link!!!.* ]]
      then
      break
      fi
done
clear
#decrement counter
(( j = j - 1 ))
npages_B=$j

ty_dir="$HOME/Desktop/${edition_choice[ed]}`date +%m``date +%y`"
#mkdir to store individual pages
mkdir $ty_dir
echo "Please be patient..Bandwidth intensive operation starts..;-)"
echo "Downloading Main Paper .. total $npages_A pages"
    for ((  i = 1 ;  i <= npages_A;  i++  ))
    do
      #prepend zero to single digits
      pageno=`printf "%03d" $i`  
      echo "Downloading Page $pageno"
      O_FILE="$ty_dir/A$pageno.jpg"
      I_FILE="http://eweekly.manoramaonline.com/ManoramaLibrary/${edition_choice[ed]}/`date +%Y`/`date +%m`/01/${edition_choice[ed]}_`date +%Y`_`date +%m`_01_$pageno$_PR.jpg"
      wget -q -O $O_FILE $I_FILE 
      
    done
    
echo "Downloading Supplement .. total $npages_B pages"

  for ((  i = 1 ;  i <= npages_B;  i++  ))
    do
      #prepend zero to single digits
      pageno=`printf "%03d" $i`  
      echo "Downloading Page $pageno"
      O_FILE="$ty_dir/B$pageno.jpg"
      I_FILE="http://eweekly.manoramaonline.com/ManoramaLibrary/${edition_choice[ed]}/`date +%Y`/`date +%m`/01/${edition_choice[ed]}_`date +%Y`_`date +%m`_01_$pageno$_PR.jpg"
      wget -q -O $O_FILE $I_FILE 
      
    done
echo "All downloads are finished, Please close this window and enjoy reading!"

