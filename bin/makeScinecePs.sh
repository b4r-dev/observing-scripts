#!/bin/bash

file_freq_set='catalog/B4R_frequency_settings.txt'
file_Science='catalog/B4R_Science_list.txt'
original_scr='templates/b4r_SciencePs_PJ020941.3_spec02_v01.scr'
original_source_name=`echo ${original_scr} | awk 'BEGIN { FS="_"; OFS="_" } { print $3 }'`
original_freq_name=`echo ${original_scr} | awk 'BEGIN { FS="_"; OFS="_" } { print $4 }'`

make_dir=products/`basename $original_scr .scr`_all
echo Make all source and freq setting for ${original_scr} in ${make_dir}.
mkdir -p ${make_dir}

cat $file_Science | grep -v '^#.*' | while read source ra dec vlsr z freqs comments; do
    cat $file_freq_set | grep -v '^#.*' | while read freqID line_freq IF_freq comments; do
        if [ "${freqs}" = "${freqID}" ] ; then
            freqID2=`printf "%02d" $freqID`
            printf "making for %s: " $source
            printf "freqID %s: " $freqID2
            printf "line %.1f GHz: " $line_freq
            printf "IF %.1f GHz\n" $IF_freq

            cont_or_spec=`echo ${original_scr} | awk 'BEGIN { FS="_"; OFS="_" } { print $4 }' | cut -c 1-4`
            cont_or_spec_freqID2=$cont_or_spec$freqID2
            tmp_scr=`echo ${original_scr} | awk 'BEGIN { FS="_"; OFS="_" } { $4="'${cont_or_spec_freqID2}'"; $3="'${source}'"; print $0 }'`
            tmp_scr=`basename $tmp_scr`
            new_scr=./${make_dir}/${tmp_scr}

            cat ${original_scr} | awk '
                { for(i=1;i<=NF;i++) { if($i=="-If2Freq[0]") {$(i+1)="'${IF_freq}'"} } }
                { for(i=1;i<=NF;i++) { if($i=="-If2Freq[1]") {$(i+1)="'${IF_freq}'"} } }
                { for(i=1;i<=NF;i++) { if($i=="-LineFreq[0]") {$(i+1)="'${line_freq}'"} } }
                { gsub("'${original_source_name}'", "'${source}'") }
                { gsub("'${original_freq_name}'", "'${cont_or_spec_freqID2}'") }
                { for(i=1;i<=NF;i++) { if($i=="-Dec[0]") {$(i+1)="'${dec}'"} } }
                { for(i=1;i<=NF;i++) { if($i=="-Dec[1]") {$(i+1)="'${dec}'"} } }
                { for(i=1;i<=NF;i++) { if($i=="-Ra[0]") {$(i+1)="'${ra}'"} } }
                { for(i=1;i<=NF;i++) { if($i=="-Ra[1]") {$(i+1)="'${ra}'"} } }
                { print $0 }
                ' > $new_scr

        fi
    done
 done

