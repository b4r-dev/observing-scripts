#!/bin/bash

file_freq_set='catalog/B4R_frequency_settings.txt'

for scr in $@; do
    original_freq_name=`printf ${scr} | awk ' BEGIN { FS="_";OFS="_" } { print $4 }'`
    make_dir=products/`basename $scr .scr`_allFreqs
    echo Make all freq setting for ${scr} in ${make_dir}.
    mkdir -p ${make_dir}
    chmod 770 ${make_dir}

    cat $file_freq_set | grep -v '^#.*' | while read freqID line_freq IF_freq comments; do
        freqID2=`printf "%02d" $freqID`
        printf "makeing for freqID %s " $freqID2
        printf "line %.1f GHz " $line_freq
        printf "IF %.1f GHz\n" $IF_freq
    cont_or_spec=`printf $scr| awk 'BEGIN{FS="_";OFS="_"}{print $4}' | cut -c 1-4`
    cont_or_spec_freqID2=$cont_or_spec$freqID2
    #echo ${cont_or_spec_freqID2}
    tmp_scr=`printf $scr| awk 'BEGIN { FS="_"; OFS="_" }{ $4="'${cont_or_spec_freqID2}'"; print $0 }'`
    tmp_scr=`basename $tmp_scr`
    new_scr=./${make_dir}/${tmp_scr}
    #echo $new_scr


    cat ${scr} | awk '
        { for(i=1;i<=NF;i++) { if($i=="-If2Freq[0]") {$(i+1)="'${IF_freq}'"} } }
        { for(i=1;i<=NF;i++) { if($i=="-If2Freq[1]") {$(i+1)="'${IF_freq}'"} } }
        { for(i=1;i<=NF;i++) { if($i=="-LineFreq[0]") {$(i+1)="'${line_freq}'"} } }
        { gsub("'${original_freq_name}'", "'${cont_or_spec_freqID2}'") }
        { print $0 }
        ' > $new_scr
    done

 done





