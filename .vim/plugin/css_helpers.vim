function! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc


function! SetCSSAutocomplete()

  " I have never found a type of autocomplete I liked that works with SASS, so
  " I decided to make my own.
  "
  " There are a few interesting conventions that make writing css faster
  " and easier. Most commands are simply the first two or three letters
  " of a CSS property. Some let you define whole rules with three letters, like
  " 'ttu' for 'text-transform: underline'. 'x' means 'clear this property' or
  " '0'. The directional keys 'wasd' are used for up, down, left, and right,
  " when setting border, margin, padding, and positioning. Combining these two,
  " 'max' expands to 'margin-left: 0px'. I use directional keys, because
  " yes I play too many video games, but also I never have to think about the
  " words 'left, top, bottom, right'. You never mess up left/right, because you
  " just push the key in the right direction, you don't have to think about it.
  "
  " This is meant to be used with SASS. Should be easy to convert to SCSS or
  " another CSS syntax.

  " These are characters used by SASS, I want them to be keywords
  set iskeyword+=$,+

  " BORDERS
  " ---------------------------------------------
  iab <buffer> bb border: 1px solid
  iab <buffer> bw border-top: 1px solid
  iab <buffer> ba border-left: 1px solid
  iab <buffer> bs border-bottom: 1px solid
  iab <buffer> bd border-right: 1px solid
  iab <silent><buffer> bbx border: none<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> bwx border-top: none<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> bax border-left: none<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> bsx border-bottom: none<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> bdx border-right: none<C-R>=Eatchar('\s')<CR>

  iab <silent><buffer> ra border-radius:
  iab <silent><buffer> rax border-radius: 0px

  iab <buffer> ou outline:
  iab <silent><buffer> oux outline: none<C-R>=Eatchar('\s')<CR>


  " MARGIN
  " ---------------------------------------------
  iab <buffer> mm margin:
  iab <buffer> mw margin-top:
  iab <buffer> ma margin-left:
  iab <buffer> ms margin-bottom:
  iab <buffer> md margin-right:
  iab <silent><buffer> xx margin: 0px auto<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> mmx margin: 0px<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> mwx margin-top: 0px<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> max margin-left: 0px<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> msx margin-bottom: 0px<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> mdx margin-right: 0px<C-R>=Eatchar('\s')<CR>


  " PADDING
  " ---------------------------------------------
  iab <buffer> pp padding:
  iab <buffer> pw padding-top:
  iab <buffer> pa padding-left:
  iab <buffer> ps padding-bottom:
  iab <buffer> pd padding-right:
  iab <silent><buffer> ppx padding: 0px<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> pwx padding-top: 0px<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> pax padding-left: 0px<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> psx padding-bottom: 0px<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> pdx padding-right: 0px<C-R>=Eatchar('\s')<CR>


  " TEXT
  " ---------------------------------------------
  iab <buffer> ti text-indent:
  iab <buffer> ls letter-spacing:
  iab <buffer> fs font-size:
  iab <buffer> ff font-family:
  iab <buffer> lh line-height:
  iab <buffer> co color:

  iab <buffer> tt text-transform:
  iab <silent><buffer> ttu text-transform: uppercase<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> ttl text-transform: lowercase<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> ttc text-transform: captalize<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> ttx text-transform: none<C-R>=Eatchar('\s')<CR>

  iab <buffer> td text-decoration:
  iab <silent><buffer> tdu text-decoration: underline<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> tdx text-decoration: none<C-R>=Eatchar('\s')<CR>

  iab <buffer> ta text-align:
  iab <silent><buffer> tac text-align: center<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> tar text-align: right<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> tal text-align: left<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> taj text-align: justify<C-R>=Eatchar('\s')<CR>

  iab <silent><buffer> ts text-shadow:
  iab <silent><buffer> tsx text-shadow: none<C-R>=Eatchar('\s')<CR>

  iab <buffer> fw font-weight:
  iab <silent><buffer> fwb font-weight: bold<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> fwx font-weight: normal<C-R>=Eatchar('\s')<CR>

  iab <silent><buffer> fsi font-style: italic<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> fsn font-style: normal<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> fso font-style: oblique<C-R>=Eatchar('\s')<CR>

  iab <buffer> ly list-style:
  iab <silent><buffer> lyx list-style: none<C-R>=Eatchar('\s')<CR>


  " POSITIONING
  " ---------------------------------------------
  iab <silent><buffer> por position: relative<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> pos position: static<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> poa position: absolute<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> pof position: fixed<C-R>=Eatchar('\s')<CR>

  iab <buffer> ww top:
  iab <buffer> aa left:
  iab <buffer> ss bottom:
  iab <buffer> dd right:
  iab <silent><buffer> wwx top: 0px<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> aax left: 0px<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> ssx bottom: 0px<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> ddx right: 0px<C-R>=Eatchar('\s')<CR>

  iab <buffer> zi z-index:
  iab <buffer> va vertical-align:
  iab <silent><buffer> vam vertical-align: middle<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> vab vertical-align: baseline<C-R>=Eatchar('\s')<CR>


  " SIZE
  " ---------------------------------------------
  iab <buffer> he height:
  iab <buffer> hx max-height:
  iab <buffer> hm min-height:
  iab <buffer> wi width:
  iab <buffer> wx max-width:
  iab <buffer> wm min-width:


  " TRANSITIONS
  " ---------------------------------------------
  iab <silent><buffer> tr transition:
  iab <silent><buffer> trp transition-property:
  iab <silent><buffer> trd transition-duration:
  iab <silent><buffer> trf transition-timing-function:


  " TRANSFORMS
  " ---------------------------------------------
  iab <silent><buffer> tf transform:
  iab <silent><buffer> tfs transform: scale()<Left><C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> tfr transform: rotate()<Left><C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> tft transform: translate()<Left><C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> tfx transform: translateX()<Left><C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> tfy transform: translateY()<Left><C-R>=Eatchar('\s')<CR>


  " BACKGROUND
  " ---------------------------------------------
  iab <silent><buffer> bg background:
  iab <silent><buffer> bgx background: none<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> bgs background-size:
  iab <silent><buffer> bgp background-position:
  iab <silent><buffer> bgc background-color:
  iab <silent><buffer> bgi background-image: url()<Left><C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> bgg background: linear-gradient()<Left><C-R>=Eatchar('\s')<CR>


  " DISPLAY
  " ---------------------------------------------
  iab <silent><buffer> dx display: none<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> db display: block<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> di display: inline<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> dn display: inline-block<C-R>=Eatchar('\s')<CR>


  " PSUEDOSELECTORS
  " ---------------------------------------------
  iab <silent><buffer> af &:after<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> be &:before<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> lc &:last-child<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> fc &:first-child<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> ho &:hover<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> ac &:active, &:focus<C-R>=Eatchar('\s')<CR>


  " MISC
  " ---------------------------------------------
  iab <silent><buffer> fl float: left<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> fr float: right<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> fx float: none<C-R>=Eatchar('\s')<CR>

  iab <silent><buffer> ov overflow:
  iab <silent><buffer> ova overflow: auto<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> ovh overflow: hidden<C-R>=Eatchar('\s')<CR>
  iab <silent><buffer> ovv overflow: visible<C-R>=Eatchar('\s')<CR>

  iab <buffer> sh box-shadow:
  iab <buffer> shx box-shadow: none<C-R>=Eatchar('\s')<CR>

  iab <buffer> cn content:
  iab <buffer> op opacity:
  iab <buffer> cl clear:
  iab <buffer> vi visibility:
  iab <silent><buffer> cf +clearfix<C-R>=Eatchar('\s')<CR>
endfunction

