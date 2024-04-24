#!/bin/bash
set -eu

file_freq_set='catalog/B4R_frequency_settings.txt'
file_Pointing_line='catalog/B4R_SiOmaser_list.txt'
original_scr='templates/b4r_Astigmatism_Ocet_spec02_v01.scr'
original_source_name=`echo ${original_scr} | awk 'BEGIN { FS="_"; OFS="_" } { print $3 }'`

make_dir=products/`basename $original_scr .scr`_all
echo Make all sources for ${original_scr} in ${make_dir}.
mkdir -p ${make_dir}

cat $file_Pointing_line | grep -v '^#.*' | while read source ra dec comments; do
    tmp_scr=`echo ${original_scr} | awk 'BEGIN { FS="_"; OFS="_" } { $3="'${source}'"; print $0 }'`
    tmp_scr=`basename $tmp_scr`
    new_scr=./${make_dir}/${tmp_scr}
    echo "Make $tmp_scr."

    cat ${original_scr} | awk '
        { gsub("'${original_source_name}'", "'${source}'") }
        { for(i=1;i<=NF;i++) { if($i=="-Dec[0]") {$(i+1)="'${dec}'"} } }
        { for(i=1;i<=NF;i++) { if($i=="-Dec[1]") {$(i+1)="'${dec}'"} } }
        { for(i=1;i<=NF;i++) { if($i=="-Ra[0]") {$(i+1)="'${ra}'"} } }
        { for(i=1;i<=NF;i++) { if($i=="-Ra[1]") {$(i+1)="'${ra}'"} } }
        { print $0 }
        ' > $new_scr

done
