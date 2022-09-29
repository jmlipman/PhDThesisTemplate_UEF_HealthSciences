% BibTeX non-standard bibliography style `uefunsrt' 
    % version 0.99a for BibTeX versions 0.99a or later, LaTeX version 2e.
    % Modified from `plain.bst' by Jani Tervo 2000, citing to webpages modified by Markku Kuittinen 2011 and 2016.

ENTRY
  { address
    author
    booktitle
    chapter
    date
    urldate
    edition
    editor
    howpublished
    institution
    journal
    journaltitle
    key
    language
    month
    nameweb
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    url
    verb
    volume
    year
  }
  {}
  { label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

FUNCTION {fi.isFinnishLanguage} % added by MK
{
  language missing$
    {#0}
    {language "l" change.case$ "finnish" =}
  if$
}
FUNCTION {bbl.valid} % added by MK
{ 
  fi.isFinnishLanguage
    {"voimassa"}
    {"visited on"}
  if$ 
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
    { ", " * write$
      newline$
      "\newblock " write$
    }
    { output.state before.all =
        'write$
        {  " " * write$ }
      if$
    }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}
 
FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
    'skip$
    { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "}" * }
  if$
}

FUNCTION {bold}
{ duplicate$ empty$
    { pop$ "" }
    { "{\bfseries " swap$ * "}" * }
  if$
}

FUNCTION {typewriter} % add by MK
{ duplicate$ empty$
    { pop$ "" }
    { "\url{ " swap$ * "}" * }
  if$
}

FUNCTION {quote}
{ duplicate$ empty$
    { pop$ "" }
    { "{``" swap$ * ",''}" * }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't :=
      nameptr #1 >
        { namesleft #1 >
            { ", " * t * }
            { numnames #2 >
                { "," * }
                'skip$
              if$
              t "others" =
                { " et~al." * }
                { " and " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
    { ", eds." * }
    { ", ed." * }
      if$
    }
  if$
}

FUNCTION {format.editorsb}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
    { ", Editors" * }
    { ", Editor" * }
      if$
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "there's no title in " cite$ * warning$ "{\textbf{!!TITLE!!}}" quote}
    { title quote}
  if$
}

FUNCTION {format.spietitle}
{ title empty$
    { "there's no title in " cite$ * warning$ ""}
    { title emphasize}
  if$
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
    { t #1 #2 substring$ "--" = not
        { "--" *
          t #2 global.max$ substring$ 't :=
        }
        {   { t #1 #1 substring$ "-" = }
        { "-" *
          t #2 global.max$ substring$ 't :=
        }
          while$
        }
      if$
    }
    { t #1 #1 substring$ *
      t #2 global.max$ substring$ 't :=
    }
      if$
    }
  while$
}

FUNCTION {format.date}
{ year empty$
    { "there's no year in " cite$ * warning$
     "{\textbf{!!YEAR!!}}"  }
    'year
   if$
}

FUNCTION {format.urldate}
{ year empty$
    { "there's no year in " cite$ * warning$
     "{\textbf{!!YEAR!!}}"  }
    'year
   if$
}

FUNCTION {format.org}
{ organization empty$
    { "there's no organization in " cite$ * warning$ ""}
    { volume empty$
        { "Proc. " organization * }
        { "Proc. " organization *
          output
          new.sentence
          volume }
    if$
    }
if$
}

FUNCTION {format.year}
{ year empty$
    { "there's no year in " cite$ * warning$ "{\textbf{!! YEAR MISSING !!}}"}
    { "(" year * output ")" * }
      if$
}

FUNCTION {format.pyear}
{ year empty$
    { address empty$
        { organization empty$
            { "there's almost nothing ;-) in " cite$ * warning$ "({\textbf{!! YEAR MISSING !!}})"}
            { "there is no year or address in " cite$ * warning$
              "({\textbf{!! YEAR MISSING !!}})"}
        if$ }
        { organization empty$
            { "there's almost nothing 8-[ in " cite$ * warning$ ""}
            { "there is no year in " cite$ * warning$
              "({\textbf{!! YEAR MISSING !!}})"}
        if$ }
    if$ }
    { address empty$
        { organization empty$
            { "there's almost nothing ;-) in " cite$ * warning$
              format.year ""}
            { "there is no address in " cite$ * warning$
              "(" organization * ", " * year * ")" * }
        if$ }
        { organization empty$
            { "there's no organization in " cite$ * warning$
              format.year ""}
            { "(" organization * ", " * address * ", " * year * ")" * }
        if$ }
    if$ }
if$ }

FUNCTION {format.pryear}
{ year empty$
    { "there's almost nothing ;-) in " cite$ * warning$ "({\textbf{!! YEAR MISSING !!}})"}
    { publisher empty$
        { "there's no publisher in " cite$ * warning$ format.year ""}
        { address empty$
            { "there's no address in " cite$ * warning$ "(" publisher * ", " * year * ")" *}
            { "(" publisher * ", " * address * ", " * year * ")" *}
        if$ }
    if$ }
if$ }

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}


FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
    { edition "l" change.case$ " ed." * }
    { edition "t" change.case$ " ed." * }
      if$
    }
  if$
}

FUNCTION {format.btitle}
{ volume empty$
    { series empty$
        { edition empty$
            { title emphasize }
            { title emphasize ", " * format.edition * }
        if$
        }
        { edition empty$
            { "empty volume in "  cite$ * warning$ title emphasize }
            { "empty volume in "  cite$ * warning$ title emphasize ", " * format.edition * }
        if$
        }
    if$
    }
    { series empty$
        { edition empty$
            { title emphasize ", Vol. " * volume * ", " * }
            { title emphasize ", Vol. " * volume * ", " * format.edition * }
        if$
        }
        { edition empty$
            { title emphasize ", Vol. " * volume * " of " * series emphasize *}
            { title emphasize ", Vol. " * volume * " of " * series emphasize * ", " * format.edition *}
        if$
        }
    if$
    }
if$
}

FUNCTION {format.ptitle}
{ volume empty$
    { series empty$
            { title emphasize }
            { "empty volume in "  cite$ * warning$ title emphasize }
    if$
    }
    { series empty$
            { "empty series in "  cite$ * warning$ title emphasize }
            { title emphasize ", Vol. " * volume * " of " * series emphasize *}
    if$
    }
if$
}


INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
    { #1 'multiresult := }
    { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.organ}
{ organization empty$
    { "empty organization in " cite$ * warning$ "" }
    { organization }
  if$
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
    { "pp." pages n.dashify tie.or.space.connect }
    { "p." pages tie.or.space.connect }
      if$
    }
  if$
}


FUNCTION {format.vol.num.pages}
{ volume bold field.or.null
  pages empty$
    'skip$
    { duplicate$ empty$
    { pop$ pages }
    { ", " * pages n.dashify * }
      if$
    }
  if$
}

FUNCTION {format.proc.num.pages}
{ series empty$
    { volume empty$
        { booktitle empty$
            { "almost all relevant fields are empty in " cite$ * warning$ "" }
            { "in " booktitle emphasize * }
        if$ }
        { booktitle empty$
            { "many relevant fields are empty in " cite$ * warning$ "" }
            { "in " booktitle emphasize * ", Vol. " * volume * }
        if$ }
    if$ }
    { volume empty$
        { booktitle empty$
            { "there is no booktitle in " cite$ * warning$
              series }
            { "in " booktitle emphasize * ", " * series * }
        if$ }
        { booktitle empty$
            { "there is no booktitle in " cite$ * warning$
              " Vol. " * volume ", " * series * }
            { "in " booktitle emphasize * ", Vol. " * volume * ", " * series * }
        if$ }
    if$ }
if$ }

FUNCTION {format.proce.num.pages}
{ series empty$
    { volume empty$
        { title empty$
            { "almost all relevant fields are empty in " cite$ * warning$ "" }
            { "" title emphasize * }
        if$ }
        { title empty$
            { "many relevant fields are empty in " cite$ * warning$ "" }
            { "" title emphasize * ", Vol. " * volume * }
        if$ }
    if$ }
    { volume empty$
        { title empty$
            { "there is no title in " cite$ * warning$
              series }
            { "" title emphasize * ", " * series * }
        if$ }
        { title empty$
            { "there is no title in " cite$ * warning$
              " Vol. " * volume ", " * series * }
            { "" title emphasize * ", Vol. " * volume * ", " * series * }
        if$ }
    if$ }
if$ }

FUNCTION {format.spie.num.pages}
    { volume empty$
        { title empty$
            { "almost all relevant fields are empty in " cite$ * warning$ "" }
            { "" title emphasize * }
        if$ }
        { title empty$
            { "empty title in " cite$ * warning$ "" }
            { "" title emphasize * ", Vol. " * volume * }
        if$ }
    if$ }

FUNCTION {format.chapter.pages}
    { pages empty$
    { "" }
    {  format.pages  }
    if$
     }

FUNCTION {format.chapter.pagesb}
{chapter empty$
    { pages empty$
    { "" }
    {  format.pages  }
    if$
     }
    { "" }
    if$
    }


FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { volume empty$
        { edition empty$
            { chapter empty$
                { "in " booktitle emphasize * }
                { " Chap " * chapter  " in " * booktitle emphasize *}
            if$
            }
            { chapter empty$
                { "in " booktitle emphasize * ", " * format.edition * }
                { " Chap " * chapter " in " * booktitle emphasize * ", " * format.edition * }
            if$
            }
        if$
        }
        { edition empty$
            { chapter empty$
                { "in " booktitle emphasize * ", Vol. " * volume *}
                { " Chap " * chapter  " in " * booktitle emphasize * ", Vol. " * volume * }
            if$
            }
            { chapter empty$
                { "in " booktitle emphasize * ", " * format.edition * ", Vol. " * volume *}
                { " Chap " * chapter " in " * booktitle emphasize *  ", Vol. " * volume * ", " * format.edition *}
            if$
            }
        if$
        }
    if$
    }
  if$
}

FUNCTION {format.in.ed.proctitle}
    { "in "  booktitle * }

FUNCTION {format.in.booktitle}
    { edition empty$
        { chapter empty$
            { title emphasize  }
            { " Chap " chapter *  " in " * title emphasize *}
        if$
        }
        { chapter empty$
            { title emphasize  ", " * format.edition * }
            { " Chap "  chapter * " in " * title emphasize * ", " * format.edition * }
        if$
        }
    if$
    }

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Technical Report" }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.web} % added by MK
{ url empty$
    { "empty url in " cite$ * warning$ "{\bf URL MISSING!} see .blg for more information\ldots\ " date * }
    { urldate empty$
        { "empty urldate in " cite$ * warning$ url * "\ {\bf DATE MISSING!} see .blg for more information\ldots"  }
        {"  " url typewriter " (" * bbl.valid * " " * urldate * ")" * }
      if$
    }
  if$
}

FUNCTION {format.nameweb} % added by MK
{
  nameweb empty$
    { "empty nameweb in " cite$ warning$ "{\textbf{NAMEWWW MISSING!}} see .blg more information\ldots " date * }
    { nameweb "," * write$ 
      note missing$ 
        { "" }
        { " " note * write$ "," write$ }
      if$
    }    
  if$
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.sentence
  journaltitle empty$
    {journal emphasize "journal" output.check}
    {journaltitle emphasize "journaltitle" output.check}
  if$  
  new.sentence
  format.vol.num.pages output
  new.sentence
  "("
  format.date * "year" output.check
  ")" *
  new.block
  note output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { organization empty$
        { format.editors "author and editor" output.check }
        { organization output }
    if$
    }
    { format.authors output.nonnull
    }
  if$
  new.block
  format.btitle "title" output.check
  new.sentence
  "("
  publisher * "publisher" output.check
  address output
  format.date "year" output.check
  ")" *
  new.block
  note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
    }
  if$
  new.block
  chapter empty$
  { }
  { "Chap " chapter * " in" * output new.sentence}
  if$
  format.btitle "title" output.check
  new.sentence
  "("
  publisher * "publisher" output.check
  address output
  format.date "year" output.check
  ")" *
  new.block
  chapter empty$
    { "pp. " pages * output}
    { }
  if$
  note output
  fin.entry
}
FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.sentence
  format.in.ed.booktitle "booktitle" output.check
  format.editors output
  new.sentence
  "("
  publisher * "publisher" output.check
  address output
  format.date "year" output.check
  ")" *
  new.block
  chapter empty$
    {pages empty$
    { }
    { "pp. " pages * output}
    if$}
    { }
  if$
  note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.sentence
  format.proc.num.pages output
  new.sentence
  format.pyear output
  new.block
  format.pages output
  note output
  fin.entry
}

FUNCTION {inspieproceedings}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.sentence
  booktitle empty$
    { format.org output }
    { booktitle emphasize "booktitle" output.check
      format.editorsb output
      format.org output }
    if$
  pages "pages" output.check
  new.sentence
  format.year
  note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.sentence
  "MSc thesis" format.thesis.type output.nonnull
  new.sentence
  "("
  school * "school" output.check
  address output
  format.date "year" output.check ")" *
  new.block
  note output
  fin.entry
}

FUNCTION {gradu}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.sentence
  "pro gradu -tutkielma" format.thesis.type output.nonnull
  new.sentence
  "("
  school * "school" output.check
  address output
  format.date "year" output.check ")" *
  new.block
  note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  title howpublished new.block.checkb
  format.title output
  howpublished new.sentence.checka
  new.sentence
  howpublished output
  new.sentence
  "("
  format.date * output
  ")" *
  new.block
  note output
  fin.entry
  empty.misc.check
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.btitle "title" output.check
  new.block
  "PhD thesis" format.thesis.type output.nonnull
  new.sentence
  "("
  school * "school" output.check
  address output
  format.date "year" output.check ")" *
  new.block
  note output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  format.organ "organization" output.check
  new.block
  format.ptitle "title" output.check
  new.sentence
  format.pryear output
  new.block
  note output
  fin.entry
}


FUNCTION {verbatim}
{ output.bibitem
  verb output
  fin.entry
}

FUNCTION {web} % added by MK
{ output.bibitem 
  format.nameweb output
  new.block
  format.web output
  fin.entry
}

FUNCTION {default.type} { misc }

MACRO {ao} {"Appl. Opt."}

MACRO {ap} {"Appl. Phys."}

MACRO {apb} {"Appl. Phys. B"}

MACRO {apl} {"Appl. Phys. Lett."}

MACRO {jap} {"J. Appl. Phys."}

MACRO {jmo} {"J. Mod. Opt."}

MACRO {josa} {"J. Opt. Soc. Am."}

MACRO {josaa} {"J. Opt. Soc. Am. A"}

MACRO {josab} {"J. Opt. Soc. Am. B"}

MACRO {oc} {"Opt. Commun."}

MACRO {oe} {"Opt. Eng."}

MACRO {ol} {"Opt. Lett."}

MACRO {opex} {"Opt. Express"}

MACRO {po} {"Progr. Opt."}

MACRO {spie} {"The International Society for Optical Engineering"}

MACRO {ieee} {"The Institute of Electrical and Electronics Engineers"}

MACRO {osa} {"The Optical Society of America"}

MACRO {eos} {"European Optical Society"}

READ

STRINGS { longest.label }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}

EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\newcommand{\http}{\texttt{http:$\sslash$}}\newcommand{\ftp}{\texttt{ftp:$\sslash$}}\newcommand{\place}[1]{}\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
