" Language   : EDI file
" Maintainer : HongHao
" Last change: 2021-04-15

syn keyword exSegmnet UNT UNH COPRAR COPARN COREOR IFTMAN CUSCAR 95B 96B 98B 00B 04B contained
syn keyword e1Segmnet UNB UNOA UNA UNOB contained
syn match exSperatorC /[:']/ contained
syn match exSperatorD /?[+':]/ contained
syn match exPartnerS /\(UNB+.*+\)\@<=[^+:]*+\@=/ contained
syn match exPartnerR /\(UNB+.*+.*+\)\@<=[^+:']*[+]\@=/ 
syn match exSperatorP /+/ contained
syn match eaSegment /^.\{3}/ contained
syn match exAll /.*/ contains=exSperatorP,exSperatorC,eaSegment,exSegmnet,e1Segmnet,exSperatorD,exPartnerR,exPartnerS
hi exSegmnet guifg=#92fEfE gui=underline
hi exSperatorP guifg=#ED750D
hi exSperatorC guifg=#7De5eD gui=bold
hi eaSegment guifg=#12AD82
hi e1Segmnet guifg=#22fE4E
hi exAll guifg=#c6c575
hi exSperatorD guifg=#c6c575
hi exPartnerR guifg=#ff73f0
hi exPartnerS guifg=#f0430f

