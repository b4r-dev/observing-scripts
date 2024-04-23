#!/bin/bash
sh makeAstigmatismCont.sh &
sh makeAstigmatismSpec.sh &
sh makeBeammap.sh &
sh makeFocusXY.sh &
sh makeFocusZcont.sh &
sh makeFocusZspec.sh &
sh makePointingCont.sh &
sh makePointingLine.sh &
sh makeScinecePs.sh &
sh makeAllFreqIDs.sh b4r_PointingLine_OriKL_spec02_v01.scr &
sh makeAllFreqIDs.sh b4r_PointingLine_OriKL_spec02_v02.scr &
sh makeAllFreqIDs.sh b4r_PointingLine_OriKL_spec02_v03.scr &
sh makeAllFreqIDs.sh b4r_PointingLine_OriKL_spec02_v04.scr &
sh makeAllFreqIDs.sh b4r_SciencePs_Borisov_spec02_v01.scr &
sh makeAllFreqIDs.sh b4r_SciencePs_OriKL_spec02_v01.scr &
sh makeAllFreqIDs.sh b4r_FocusZ_OriKL_spec02_v01.scr &
sh makeAllFreqIDs.sh b4r_FocusZ_OriKL_spec02_v02.scr &
sh makeAllFreqIDs.sh b4r_Astigmatism_OriKL_spec02_v01.scr&
