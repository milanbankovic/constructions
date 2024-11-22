(define
  (problem A_B)
  (:domain constructions)


 (:objects
     A B C O I G H Ma Mb Mc Ta Tb Tc Ha Hb Hc
     Pa Pb Pc Na Nb Nc Ppa Ppb Ppc Sa Sb Sc Tpa Tpb Tpc - point
     
     la lb lc lma lmb lmc lsa lsb lsc lha lhb lhc lta ltb ltc
     lmta lmtb lmtc lspa lspb lspc lra lrb lrc lrpa lrpb lrpc lIMa
     lAPpa lhPa lIMb lBPpb lhPb lIMc lCPpc lhPc lhab lhac lhbc loa
     lob loc - line 

     kO kI kMa kMb kMc kNa kNb kNc kSa kSb kSc koIA koIB koIC koIMa koIMb
     koIMc koSaB koSaC koSbA koSbC koScA koScB koTaTpa koTbTpb koTcTpc
     locTaHbAlpha2 locTaHcAlpha2 locTbHcBeta2 locTbHaBeta2 locTcHaGamma2
     locTcHbGamma2  locTbTcAlpha2Pi2 locTaTbGamma2Pi2 locTaTcBeta2Pi2
     locTaTbGamma locTaTbAlpha2 locTaTbBeta2 locaTaTcBeta locTaTcAlpha2
     locTaTcGamma2 locTbTcAlpha locTbTcBeta2 locTbTcGamma2 locTbIAlpha2
     locTcIAlpha2 locTaIBeta2 locTcIBeta2 locTbIGamma2 locTaIGamma2 - circle

     Alpha Beta Gamma anHa anHb anHc anA anB anC - angle     

 )

 (:init
    (incident_point_line A lb)
    (incident_point_line A lc)
    (incident_point_line A lsa)
    (incident_point_line A lha)    
    (incident_point_line A lta)
    (incident_point_line A lspa)
    (incident_point_line A laPpa)
    (incident_point_line A loa)

    (incident_point_line B la)    
    (incident_point_line B lc)    
    (incident_point_line B lsb)
    (incident_point_line B lhb)
    (incident_point_line B ltb)
    (incident_point_line B lspb)
    (incident_point_line B lBPpb)
    (incident_point_line B lob)
    

    (incident_point_line C la)    
    (incident_point_line C lb)    
    (incident_point_line C lsc)
    (incident_point_line C lhc)
    (incident_point_line C ltc)
    (incident_point_line C lspc)
    (incident_point_line C lCPpc)
    (incident_point_line C loc)


    (incident_point_line O lma)    
    (incident_point_line O lmb)
    (incident_point_line O lmc)
    (incident_point_line O loa)
    (incident_point_line O lob)
    (incident_point_line O loc)        

    (incident_point_line I lsa)    
    (incident_point_line I lsb)    
    (incident_point_line I lsc)
    (incident_point_line I lra)    
    (incident_point_line I lrb)
    (incident_point_line I lrc)
    (incident_point_line I lIMa)
    (incident_point_line I lIMb)
    (incident_point_line I lIMc)
    
    (incident_point_line G lta)
    (incident_point_line G ltb)            
    (incident_point_line G ltc)

    (incident_point_line H lha)		 
    (incident_point_line H lhb)
    (incident_point_line H lhc)
    
    (incident_point_line Ma la)
    (incident_point_line Ma lma)		 
    (incident_point_line Ma lta)		 
    (incident_point_line Ma lmtb)
    (incident_point_line Ma lmtc)
    (incident_point_line Ma lIMa)		     


    (incident_point_line Mb lb)
    (incident_point_line Mb lmb)		 
    (incident_point_line Mb ltb)		 
    (incident_point_line Mb lmta)
    (incident_point_line Mb lmtc)
    (incident_point_line Mb lIMb)		     

    (incident_point_line Mc lc)
    (incident_point_line Mc lmc)		 
    (incident_point_line Mc ltc)		 
    (incident_point_line Mc lmta)
    (incident_point_line Mc lmtb)
    (incident_point_line Mc lIMc)		     

    (incident_point_line Ta la)		     
    (incident_point_line Ta lsa)		     

    (incident_point_line Tb lb)		     
    (incident_point_line Tb lsb)		     

    (incident_point_line Tc lc)		     
    (incident_point_line Tc lsc)		     

    (incident_point_line Ha la)
    (incident_point_line Ha lha)
    (incident_point_line Ha lhab)
    (incident_point_line Ha lhac)    


    (incident_point_line Hb lb)
    (incident_point_line Hb lhb)
    (incident_point_line Hb lhab)
    (incident_point_line Hb lhbc)    

    (incident_point_line Hc lc)
    (incident_point_line Hc lhc)
    (incident_point_line Hc lhac)
    (incident_point_line Hc lhbc)    

    (incident_point_line Pa la)
    (incident_point_line Pa lra)
    (incident_point_line Pa lhPa)

    (incident_point_line Pb lb)
    (incident_point_line Pb lrb)
    (incident_point_line Pb lhPb)

    (incident_point_line Pc lc)
    (incident_point_line Pc lrc)
    (incident_point_line Pc lhPc)

    (incident_point_line Na lsa)
    (incident_point_line Na lma)

    (incident_point_line Nb lsb)
    (incident_point_line Nb lmb)


    (incident_point_line Nc lsc)
    (incident_point_line Nc lmc)

    (incident_point_line Ppa la)
    (incident_point_line Ppa lrpa)
    (incident_point_line Ppa lAPpa)

    (incident_point_line Ppb lb)
    (incident_point_line Ppb lrpb)
    (incident_point_line Ppb lBPpb)

    (incident_point_line Ppc lc)
    (incident_point_line Ppc lrpc)
    (incident_point_line Ppc lCPpc)

    (incident_point_line Sa lspb)
    (incident_point_line Sa lspc)
    (incident_point_line Sa lrpa)
    (incident_point_line Sa lsa)
    
    (incident_point_line Sb lspa)
    (incident_point_line Sb lspc)
    (incident_point_line Sb lrpb)
    (incident_point_line Sb lsb)

    (incident_point_line Sc lspa)
    (incident_point_line Sc lspb)
    (incident_point_line Sc lrpc)
    (incident_point_line Sc lsc)

    (incident_point_line Tpa la)
    (incident_point_line Tpa lspa)

    (incident_point_line Tpb lb)
    (incident_point_line Tpb lspb)

    (incident_point_line Tpc lc)
    (incident_point_line Tpc lspc)

    (perp_lines la lma)
    (perp_lines la lha)
    (perp_lines la lra)
    (perp_lines la lrpa)

    (perp_lines lb lmb)
    (perp_lines lb lhb)
    (perp_lines lb lrb)
    (perp_lines lb lrpb)

    (perp_lines lc lmc)
    (perp_lines lc lhc)
    (perp_lines lc lrc)
    (perp_lines lc lrpc)

    (perp_lines lma la)
    (perp_lines lma lmta)

    (perp_lines lmb lb)
    (perp_lines lmb lmtb)

    (perp_lines lmc lc)
    (perp_lines lmc lmtc)

    (perp_lines lsa lspa)
    (perp_lines lsb lspb)
    (perp_lines lsc lspc)
    
    (perp_lines lha la)
    (perp_lines lha lmta)

    (perp_lines lhb lb)
    (perp_lines lhb lmtb)

    (perp_lines lhc lc)
    (perp_lines lhc lmtc)

    (perp_lines lmta lma)
    (perp_lines lmta lha)
    (perp_lines lmta lra)
    (perp_lines lmta lrpa)

    (perp_lines lmtb lmb)
    (perp_lines lmtb lhb)
    (perp_lines lmtb lrb)
    (perp_lines lmtb lrpb)

    (perp_lines lmtc lmc)
    (perp_lines lmtc lhc)
    (perp_lines lmtc lrc)
    (perp_lines lmtc lrpc)

    (perp_lines lspa lsa)
    (perp_lines lspb lsb)
    (perp_lines lspc lsc)

    (perp_lines lra la)
    (perp_lines lra lmta)
    
    (perp_lines lrb lb)
    (perp_lines lrb lmtb)

    (perp_lines lrc lc)
    (perp_lines lrc lmtc)

    (perp_lines lrpa la)
    (perp_lines lrpa lmta)

    (perp_lines lrpb lb)
    (perp_lines lrpb lmtb)

    (perp_lines lrpc lc)
    (perp_lines lrpc lmtc)

    (incident_point_circle A kO)
    (incident_point_circle A kMb)
    (incident_point_circle A kMc)
    (incident_point_circle A kNb)
    (incident_point_circle A kNc)
    (incident_point_circle A koIA)
    (incident_point_circle A koSbA)
    (incident_point_circle A koScA)
    (incident_point_circle A koTaTpa)
    (incident_point_circle A locTaHbAlpha2)
    (incident_point_circle A locTaHcAlpha2)
    (incident_point_circle A locTaTbAlpha2)
    (incident_point_circle A locTaTcAlpha2)
    (incident_point_circle A locTbTcAlpha)
    (incident_point_circle A locTbIAlpha2)
    (incident_point_circle A locTcIAlpha2)

    (incident_point_circle B kO)
    (incident_point_circle B kMa)
    (incident_point_circle B kMc)
    (incident_point_circle B kNa)
    (incident_point_circle B kNc)
    (incident_point_circle B koIB)
    (incident_point_circle B koSaB)
    (incident_point_circle B koScB)
    (incident_point_circle B koTbTpb)
    (incident_point_circle B locTbHcBeta2)
    (incident_point_circle B locTbHaBeta2)
    (incident_point_circle B locTaTbBeta2)
    (incident_point_circle B locaTaTcBeta)
    (incident_point_circle B locTbTcBeta2)
    (incident_point_circle B locTaIBeta2)
    (incident_point_circle B locTcIBeta2)

    (incident_point_circle C kO)
    (incident_point_circle C kMa)
    (incident_point_circle C kMb)
    (incident_point_circle C kNa)
    (incident_point_circle C kNb)
    (incident_point_circle C koIC)
    (incident_point_circle C koSaC)
    (incident_point_circle C koSbC)
    (incident_point_circle C koTcTpc)
    (incident_point_circle C locTcHaGamma2)
    (incident_point_circle C locTcHbGamma2)
    (incident_point_circle C locTaTbGamma)
    (incident_point_circle C locTaTcGamma2)
    (incident_point_circle C locTbTcGamma2)
    (incident_point_circle C locTbIGamma2)
    (incident_point_circle C locTaIGamma2)
    (incident_point_circle I kNa)
    (incident_point_circle I kNb)
    (incident_point_circle I kNc)
    (incident_point_circle I koIA)
    (incident_point_circle I koIB)
    (incident_point_circle I koIC)
    (incident_point_circle I koIMa)
    (incident_point_circle I koIMb)
    (incident_point_circle I koIMc)
    (incident_point_circle I locTbTcAlpha2Pi2)
    (incident_point_circle I locTaTbGamma2Pi2)
    (incident_point_circle I locTaTcBeta2Pi2)
    (incident_point_circle I locTbIAlpha2)
    (incident_point_circle I locTcIAlpha2)
    (incident_point_circle I locTaIBeta2)
    (incident_point_circle I locTcIBeta2)
    (incident_point_circle I locTbIGamma2)
    (incident_point_circle I locTaIGamma2)

    (incident_point_circle Ma koIMa)
    (incident_point_circle Mb koIMb)
    (incident_point_circle Mc koIMc)
    
    (incident_point_circle Ta koTaTpa)
    (incident_point_circle Ta locTaHbAlpha2)
    (incident_point_circle Ta locTaHcAlpha2)
    (incident_point_circle Ta locTaTbGamma2Pi2)
    (incident_point_circle Ta locTaTcBeta2Pi2)
    (incident_point_circle Ta locTaTbGamma)
    (incident_point_circle Ta locTaTbAlpha2)
    (incident_point_circle Ta locTaTbBeta2)
    (incident_point_circle Ta locaTaTcBeta)
    (incident_point_circle Ta locTaTcAlpha2)
    (incident_point_circle Ta locTaTcGamma2)
    (incident_point_circle Ta locTaIBeta2)
    (incident_point_circle Ta locTaIGamma2)
    
    (incident_point_circle Tb koTbTpb)
    (incident_point_circle Tb locTbHcBeta2)
    (incident_point_circle Tb locTbHaBeta2)
    (incident_point_circle Tb locTbTcAlpha2Pi2)
    (incident_point_circle Tb locTaTbGamma2Pi2)
    (incident_point_circle Tb locTaTbGamma)
    (incident_point_circle Tb locTaTbAlpha2)
    (incident_point_circle Tb locTaTbBeta2)
    (incident_point_circle Tb locTbTcAlpha)
    (incident_point_circle Tb locTbTcBeta2)
    (incident_point_circle Tb locTbTcGamma2)
    (incident_point_circle Tb locTbIAlpha2)
    (incident_point_circle Tb locTbIGamma2)

    (incident_point_circle Tc koTcTpc)
    (incident_point_circle Tc locTcHaGamma2)
    (incident_point_circle Tc locTcHbGamma2)
    (incident_point_circle Tc locTbTcAlpha2Pi2)
    (incident_point_circle Tc locTaTcBeta2Pi2)
    (incident_point_circle Tc locaTaTcBeta)
    (incident_point_circle Tc locTaTcAlpha2)
    (incident_point_circle Tc locTaTcGamma2)
    (incident_point_circle Tc locTbTcAlpha)
    (incident_point_circle Tc locTbTcBeta2)
    (incident_point_circle Tc locTbTcGamma2)
    (incident_point_circle Tc locTcIAlpha2)
    (incident_point_circle Tc locTcIBeta2)

    (incident_point_circle Ha kMb)
    (incident_point_circle Ha kMc)
    (incident_point_circle Ha locTbHaBeta2)
    (incident_point_circle Ha locTcHaGamma2)
    
    (incident_point_circle Hb kMa)
    (incident_point_circle Hb kMc)
    (incident_point_circle Hb locTaHbAlpha2)
    (incident_point_circle Hb locTcHbGamma2)
    
    (incident_point_circle Hc kMa)
    (incident_point_circle Hc kMb)
    (incident_point_circle Hc locTaHcAlpha2)
    (incident_point_circle Hc locTbHcBeta2)

    (incident_point_circle Pa kI)
    (incident_point_circle Pa koIB)
    (incident_point_circle Pa koIC)
    (incident_point_circle Pa koIMa)

    (incident_point_circle Pb kI)
    (incident_point_circle Pb koIA)
    (incident_point_circle Pb koIC)
    (incident_point_circle Pb koIMb)

    (incident_point_circle Pc kI)
    (incident_point_circle Pc koIA)
    (incident_point_circle Pc koIB)
    (incident_point_circle Pc koIMc)

    (incident_point_circle Na kO)
    (incident_point_circle Nb kO)
    (incident_point_circle Nc kO)

    (incident_point_circle Ppa kSa)
    (incident_point_circle Ppa koSaB)
    (incident_point_circle Ppa koSaC)
 
    (incident_point_circle Ppb kSb)
    (incident_point_circle Ppb koSbA)
    (incident_point_circle Ppb koSbC)

    (incident_point_circle Ppc kSc)
    (incident_point_circle Ppc koScA)
    (incident_point_circle Ppc koScB)

    (incident_point_circle Sa kNa)
    (incident_point_circle Sa koSaB)
    (incident_point_circle Sa koSaC)

    (incident_point_circle Sb kNb)
    (incident_point_circle Sb koSbA)
    (incident_point_circle Sb koSbC)

    (incident_point_circle Sc kNc)
    (incident_point_circle Sc koScA)
    (incident_point_circle Sc koScB)

    (incident_point_circle Tpa koTaTpa)

    (incident_point_circle Tpb koTbTpb)

    (incident_point_circle Tpc koTcTpc)


    (circle_center O kO)
    (circle_center I kI)
    (circle_center Ma kMa)
    (circle_center Mb kMb)
    (circle_center Mc kMc)
    (circle_center Na kNa)
    (circle_center Nb kNb)
    (circle_center Nc kNc)
    (circle_center Sa kSa)
    (circle_center Sb kSb)
    (circle_center Sc kSc)

    (circle_diameter B C kMa)
    (circle_diameter A C kMb)
    (circle_diameter A B kMc)
    (circle_diameter A I koIA)
    (circle_diameter B I koIB)
    (circle_diameter C I koIC)
    (circle_diameter I Ma koIMa) 
    (circle_diameter I Mb koIMb)
    (circle_diameter I Mc koIMc)
    (circle_diameter B Sa koSaB)
    (circle_diameter C Sa koSaC)
    (circle_diameter A Sb koSbA)
    (circle_diameter C Sb koSbC)
    (circle_diameter A Sc koScA)
    (circle_diameter B Sc koScB)
    (circle_diameter Ta Tpa koTaTpa)
    (circle_diameter Tb Tpb koTbTpb)
    (circle_diameter Tc Tpc koTcTpc)
                          

    (tangent_line kI la)
    (tangent_line kI lb)
    (tangent_line kI lc)
    (tangent_line kSa la)
    (tangent_line kSa lb)
    (tangent_line kSa lc)
    (tangent_line kSb la)
    (tangent_line kSb lb)
    (tangent_line kSb lc)
    (tangent_line kSc la)
    (tangent_line kSc lb)
    (tangent_line kSc lc)
    (tangent_line koIA lspa)
    (tangent_line koIB lspb)
    (tangent_line koIC lspc)
    (tangent_line koSaB lsb)
    (tangent_line koSaC lsc)
    (tangent_line koSbA lsa)
    (tangent_line koSbC lsc)                
    (tangent_line koScA lsa)
    (tangent_line koScB lsb)

    (parallel_lines la lmta)
    (parallel_lines lb lmtb)
    (parallel_lines lc lmtc)
    
    (parallel_lines lma lha)
    (parallel_lines lma lra)
    (parallel_lines lma lrpa)
    
    (parallel_lines lmb lhb)
    (parallel_lines lmb lrb)
    (parallel_lines lmb lrpb)

    (parallel_lines lmc lhc)
    (parallel_lines lmc lrc)
    (parallel_lines lmc lrpc)
    
    (parallel_lines lha lma)
    (parallel_lines lha lra)
    (parallel_lines lha lrpa)
    
    (parallel_lines lhb lmb)
    (parallel_lines lhb lrb)
    (parallel_lines lhb lrpb)

    (parallel_lines lhc lmc)
    (parallel_lines lhc lrc)
    (parallel_lines lhc lrpc)
    
    (parallel_lines lmta la)
    (parallel_lines lmtb lb)
    (parallel_lines lmtc lc)
  
    (parallel_lines lra lma)
    (parallel_lines lra lha)
    (parallel_lines lra lrpa)
    
    (parallel_lines lrb lmb)
    (parallel_lines lrb lhb)
    (parallel_lines lrb lrpb)

    (parallel_lines lrc lmc)
    (parallel_lines lrc lhc)
    (parallel_lines lrc lrpc)

    (parallel_lines lrpa lma)
    (parallel_lines lrpa lha)
    (parallel_lines lrpa lra)

    (parallel_lines lrpb lmb)
    (parallel_lines lrpb lhb)
    (parallel_lines lrpb lrb)

    (parallel_lines lrpc lmc)
    (parallel_lines lrpc lhc)
    (parallel_lines lrpc lrc)

    (parallel_lines lIMa lAPpa)
    (parallel_lines lIMa lhPa)
    (parallel_lines lAPpa lIMa)
    (parallel_lines lAPpa lhPa)
    (parallel_lines lhPa lIMa)
    (parallel_lines lhPa lAPpa)

    (parallel_lines lIMb lBPpb)
    (parallel_lines lIMb lhPb)
    (parallel_lines lBPpb lIMb)
    (parallel_lines lBPpb lhPb)
    (parallel_lines lhPb lIMb)
    (parallel_lines lhPb lBPpb)

    (parallel_lines lIMc lCPpc)
    (parallel_lines lIMc lhPc)
    (parallel_lines lCPpc lIMc)
    (parallel_lines lCPpc lhPc)
    (parallel_lines lhPc lIMc)
    (parallel_lines lhPc lCPpc)

    (known_ratio_triplets A B Mc)
    (known_ratio_triplets A C Mb)
    (known_ratio_triplets B C Ma)
    (known_ratio_triplets A G Ma)
    (known_ratio_triplets B G Mb)
    (known_ratio_triplets C G Mc)
    (known_ratio_triplets O G H)
    (known_ratio_triplets Ma Pa Ppa)
    (known_ratio_triplets Mb Pb Ppb)
    (known_ratio_triplets Mc Pc Ppc)          

    (known_ratio_quadruples A B Ma Mb)
    (known_ratio_quadruples A C Ma Mc)
    (known_ratio_quadruples B C Mb Mc)
    (known_ratio_quadruples A Ma Mb Mc)
    (known_ratio_quadruples B Ma Mb Mc)
    (known_ratio_quadruples C Ma Mb Mc)            

    (angle_def la lb Gamma)
    (angle_def la lc Beta)
    (angle_def lb lc Alpha)
    (angle_def la lsb Beta)
    (angle_def la lsc Gamma)
    (angle_def lb lsa Alpha)
    (angle_def lb lsc Gamma)
    (angle_def lc lsa Alpha)
    (angle_def lc lsb Beta)
    (angle_def la lmtc Beta)
    (angle_def la lmtb Gamma)
    (angle_def lb lmtc Alpha)
    (angle_def lb lmta Gamma)
    (angle_def lc lmta Beta)
    (angle_def lc lmtb Alpha)
    (angle_def lmta lmtb Gamma)
    (angle_def lmta lmtc Beta)
    (angle_def lmtb lmtc Alpha)
    (angle_def la lhab Alpha)
    (angle_def lb lhab Beta)
    (angle_def lc lhbc Gamma)
    (angle_def lb lhbc Beta)
    (angle_def la lhac Alpha)
    (angle_def lc lhac Gamma)
    (angle_def lsb lsc Alpha)
    (angle_def lsa lsb Gamma)
    (angle_def lsa lsc Beta)
    (angle_def lhab lhac anHa)
    (angle_def lha lhab anHa)
    (angle_def lha lhac anHa)
    (angle_def lhac lhbc anHc)
    (angle_def lhc lhac anHc)
    (angle_def lhc lhbc anHc)
    (angle_def lhab lhbc anHb)
    (angle_def lhb lhab anHb)
    (angle_def lhb lhbc anHb)
    (angle_def lsa lha anA)
    (angle_def lsa loa anA)
    (angle_def lsb lhb anB)
    (angle_def lsb lob anB)
    (angle_def lsc lhc anC)
    (angle_def lsc loc anC)
    
    (perp_bisector A B lmc)
    (perp_bisector A C lmb)
    (perp_bisector B C lma)
    (perp_bisector A Ha lmta)
    (perp_bisector B Hb lmtb)
    (perp_bisector C Hc lmtc)
    (perp_bisector Pa Ppa lma)
    (perp_bisector Pb Ppb lmb)
    (perp_bisector Pc Ppc lmc)


    (harmonic_quadruples B C Ta Tpa)
    (harmonic_quadruples A C Tb Tpb)
    (harmonic_quadruples A B Tc Tpc)

    (homothety_triples A lmta la)
    (homothety_triples B lmtb lb)
    (homothety_triples C lmtc lc)
    (homothety_triples Ma lAPpa lhPa)
    (homothety_triples Mb lBPpb lhPb)
    (homothety_triples Mc lCPpc lhPc)

    (locus_def Ta Hb Alpha locTaHbAlpha2)
    (locus_def Ta Hc Alpha locTaHcAlpha2) 
    (locus_def Tb Hc Beta locTbHcBeta2)
    (locus_def Tb Ha Beta locTbHaBeta2) 
    (locus_def Tc Ha Gamma locTcHaGamma2)
    (locus_def Tc Hb Gamma locTcHbGamma2) 
    (locus_def Tb Tc Alpha  locTbTcAlpha2Pi2) 
    (locus_def Ta Tb Gamma locTaTbGamma2Pi2) 
    (locus_def Ta Tc Beta locTaTcBeta2Pi2)
    (locus_def Ta Tb Gamma  locTaTbGamma) 
    (locus_def Ta Tb Alpha locTaTbAlpha2) 
    (locus_def Ta Tb Beta locTaTbBeta2) 
    (locus_def Ta Tc Beta locaTaTcBeta)
    (locus_def Ta Tc Alpha locTaTcAlpha2) 
    (locus_def Ta Tc Gamma locTaTcGamma2) 
    (locus_def Tb Tc Alpha locTbTcAlpha) 
    (locus_def Tb Tc Beta locTbTcBeta2) 
    (locus_def Tb Tc Gamma locTbTcGamma2) 
    (locus_def I Tb Alpha locTbIAlpha2) 
    (locus_def I Tc Alpha locTcIAlpha2) 
    (locus_def I Ta Beta locTaIBeta2) 
    (locus_def I Tc Beta locTcIBeta2) 
    (locus_def I Tb Gamma locTbIGamma2) 
    (locus_def I Ta Gamma locTaIGamma2)

    GIVEN
  )
  (:goal
    (and
      (constructed A)
      (constructed B)
      (constructed C)
    )
 )
)