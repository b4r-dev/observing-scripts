# observing-scripts
Templates and commands for making B4R observing scripts (*.scr)

## Usage

1. Update frequency settings in `catalog/`
1. Update pointing/science lists in `catalog/`
1. Run commands (`*.sh`) to create observing scripts

## Frequecy/source lists (`catalog/*.txt`; tab-separated)

Filename | Description
--- | ---
`B4R_frequency_settings.txt` | List of frequency settings
`B4R_PointingCont_list.txt` | List of continuum sources for pointing
`B4R_Science_list.txt` | List of science targets
`B4R_SiOmaser_list.txt` | List of SiO maser sources for pointing
`B4R_catalog.cat` | (Not used for script making)
`B4R_point.cat` | (Not used for script making)

## Template observing scripts (`templates/*.scr`)

Filename | Description
--- | ---
`b4r_Astigmatism_3C84_cont02_v01.scr` | Observing script for astigmatism correction (cont mode)
`b4r_Astigmatism_Ocet_spec02_v01.scr` | Observing script for astigmatism correction (spec mode)
`b4r_Beammap_3C84_spec02_v01.scr` | Observing script for measuring beammap (spec mode)
`b4r_FocusXY_3C84_cont02_v01.scr` | Observing script for X/Y focus corection (cont mode)
`b4r_FocusZ_3C84_cont02_v01.scr` | Observing script for Z focus correction (cont mode)
`b4r_FocusZ_OCet_spec02_v01.scr` | Observing script for Z focus correction (spec mode)
`b4r_PointingCont_3C84_cont02_v01.scr` | Observing script for pointing correction (cont mode)
`b4r_PointingLine_OCet_spec02_v01.scr` | Observing script for pointing correction (spec mode)
`b4r_SciencePs_PJ020941.3_spec02_v01.scr` | Observing script for position switching (spec mode)
`b4r_Astigmatism_OriKL_spec02_v01.scr` | (Not used in commands)
`b4r_FocusZ_OriKL_spec02_v01.scr` | (Not used in commands)
`b4r_PointingLine_OriKL_spec02_v01.scr` | (Not used in commands)
`b4r_PointingLine_OriKL_spec02_v02.scr` | (Not used in commands)
`b4r_PointingLine_OriKL_spec02_v03.scr` | (Not used in commands)
`b4r_PointingLine_OriKL_spec02_v04.scr` | (Not used in commands)
`b4r_SciencePs_Borisov_spec02_v01.scr` | (Not used in commands)
`b4r_SciencePs_OriKL_spec02_v01.scr` | (Not used in commands)

## Commands

Command | Source catalog | Template observing script | Description
--- | --- | --- | ---
`makeAstigmatismCont.sh` | `B4R_PointingCont_list.txt` | `b4r_Astigmatism_3C84_cont02_v01.scr` | Make observing scripts for astigmatism correction (cont mode) with a combination of frequencies and continuum sources
`makeAstigmatismSpec.sh` | `B4R_SiOmaser_list.txt` | `b4r_Astigmatism_Ocet_spec02_v01.scr` | Make observing scripts for  astigmatism correction (spec mode) with a combination of frequencies and SiO maser sources
`makeBeammap.sh` | `B4R_PointingCont_list.txt` | `b4r_Beammap_3C84_spec02_v01.scr` | Make observing scripts for measuring beammap (spec mode) with a combination of frequencies and continuum sources
`makeFocusXY.sh` | `B4R_PointingCont_list.txt` | `b4r_FocusXY_3C84_cont02_v01.scr` | Make observing scripts for X/Y focus corection (cont mode) with a combination of frequencies and continuum sources
`makeFocusZcont.sh` | `B4R_PointingCont_list.txt` | `b4r_FocusZ_3C84_cont02_v01.scr` | Make observing scripts for Z focus corection (cont mode) with a combination of frequencies and continuum sources
`makeFocusZspec.sh` | `B4R_SiOmaser_list.txt` | `b4r_FocusZ_OCet_spec02_v01.scr` | Make observing scripts for Z focus corection (spec mode) with a combination of frequencies and SiO maser sources
`makePointingCont.sh` | `B4R_PointingCont_list.txt` | `b4r_PointingCont_3C84_cont02_v01.scr` | Observing scripts for pointing correction (cont mode) with a combination of frequencies and continuum sources
`makePointingLine.sh` | `B4R_SiOmaser_list.txt` | `b4r_PointingLine_OCet_spec02_v01.scr` | Observing scripts for pointing correction (spec mode) with a combination of frequencies and SiO maser sources
`makeScinecePs.sh` | `B4R_Science_list.txt` | `b4r_SciencePs_PJ020941.3_spec02_vdd01.scr` | Observing scripts for position switching (spec mode) with a combination of frequencies and science targets
`makeAllFreqIDs.sh <scr>` | - | `<scr>` | Make observing scripts from given observing script with changing frequencies
