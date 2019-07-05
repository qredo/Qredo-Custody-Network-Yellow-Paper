% This style file has been adapted from the abbrv.bst for Networks:
% An International Journal.
% Revision was made in 2018
%
% Some notes:
% 0)  The following types have been coded for Networks:
%     article, book, incollection, inproceedings, techreport
%     mastersthesis, phdthesis, and misc (for the citation
%     of web pages).  
%     -- In citing web pages, use @misc. Fill in an author, title, and year as usual.
%        Use "note" to enter the URL, and after the website, put the following after
%	   the site:  "(Accessed January 30, 2018)" (with the correct date of course).
%     -- In citing an "inproceedings" where the proceedings title is
%        published in a journal (like Lecture Notes in Computer Science),
%        write TITLE = "Proceedings of the...Conference, Lecture Notes in
%        Computer Science",
%
% 1)  The process.journal command is used to automatically abbreviate journal
%     and proceedings titles.  Additionally, this function can also used to
%     provide abbreviations for common journals, whose standard abbreviation
%     might not be captured by the word-by-word analysis given in 
%     process.journal (the only example given is the abbreviation of ACM).
%     
% 2)  Abbreviations are added in "check.words.x" for x = 1,...,8.
%     Only 12 such words can fit in each function.  If new abbreviations are
%     needed, simply add them to check.words.8.  Add a function check.words.9
%     if needed, but make sure to add the command check.words.9 to the
%     "process.journal" command.
%
% 3)  Please check for errors in your output.  
%     a)  You can fix minor errors directly by cutting-and-pasting the bbl file
%         into your tex file in place of the \bibliography{} command.  It would
%         probably be best to do this for Wiley's typesetters anyway.
%     b)  I would appreciate it if you would either let me know what the problem
%         is (so that I can try to fix it), or even better, fix it and let me know
%         how to correct this file.  I will serve as the hub for collecting 
%         fixes and improvements.
%     c)  In particular, watch out for Journal/Proceeding title abbreviations,
%         especially if you've got special characters in the journal/proceedings title.
%         Also, there is no mechanism to change full state names to abbreviations,
%         and vice-versa.  Hence, if you write "Florida" but want "FL", you'll need
%         to make that change manually (either in the bib file or in the bbl output).
%                    
%
% December 22, 2018
% J. Cole Smith
% jcsmith@clemson.edu
% Clemson University 
%
%
%
% Original disclaimer:
% BibTeX standard bibliography style `abbrv'
        % version 0.99a for BibTeX versions 0.99a or later, LaTeX version 2.09.
        % Copyright (C) 1985, all rights reserved.
        % Copying of this file is authorized only if either
        % (1) you make absolutely no changes to your copy, including name, or
        % (2) if you do make changes, you name it something other than
        % btxbst.doc, plain.bst, unsrt.bst, alpha.bst, and abbrv.bst.
        % This restriction helps ensure that all standard styles are identical.
        % The file btxbst.doc has the documentation for this style.

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
  }
  {}
  { label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block 
  st.string end.string total.char while.flag i.flag end.of.line word.length}

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t abbreviated.journal}

FUNCTION {next.end.char}
{
  't :=
  #0 'i.flag :=
  #0 'while.flag :=
  
  {#0 while.flag =}
  { end.string total.char =
    { #1 'while.flag :=
      #1 'end.of.line := 
      #1 end.string + 'end.string :=
    }
    { t end.string #1 substring$ " " =
        {#1 'i.flag :=}
        'skip$
      if$
      t end.string #1 substring$ "," =
        {#1 'i.flag :=}
        'skip$ 
      if$
      t end.string #1 substring$ ":" =
        {#1 'i.flag :=}
        'skip$
      if$
      t end.string #1 substring$ ";" =
        {#1 'i.flag :=}
        'skip$
      if$
      
      #1 i.flag =
        { #1 'while.flag := }
        { #1 end.string + 'end.string := }
      if$
    }
    if$  
  }
  while$ 
  end.string
}

FUNCTION {check.words.1}
{
        s "Analysis" =
          { "Anal." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "And" =
          { "" 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "and" =
          { "" 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Annals" =
          { "Ann." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Annual" =
          { "Ann." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Applied" =
          { "Appl." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Applications" =
          { "Appl." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Canadian" =
          { "Can." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Colloquium" =
          { "Colloq." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Combinatorics" =
          { "Combin." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Combinatoria" =
          { "Combin." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Communications" =
          { "Commun." 's :=
            #1 'i.flag := }
          'skip$
        if$ 
}

FUNCTION {check.words.2}
{
        s "Communication" =
          { "Commun." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Computational" =
          { "Comput." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Computations" =
          { "Comput." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Computer" =
          { "Comput." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Computers" =
          { "Comput." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Computing" =
          { "Comput." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Congressus" =
          { "Congress." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Decision" =
          { "Dec." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Discrete" =
          { "Discr." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Distributed" =
          { "Distrib." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Engineering" =
          { "Eng." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "European" =
          { "Eur." 's :=
            #1 'i.flag := }
          'skip$
        if$
}

FUNCTION {check.words.3}
{
        s "For" =
          { "" 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "for" =
          { "" 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Fundamental" =
          { "Fundam." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Fundamentals" =
          { "Fundam." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Industrial" =
          { "Indus." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Information" =
          { "Informat." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "International" =
          { "Int." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Japan" =
          { "Jpn." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Japanese" =
          { "Jpn." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Journal" =
          { "J." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Letters" =
          { "Lett." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Logistics" =
          { "Logist." 's :=
            #1 'i.flag := }
          'skip$
        if$
}

FUNCTION {check.words.4}
{
        s "London" =
          { "Lond." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Management" =
          { "Manage." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Mathematical" =
          { "Math." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Mathematics" =
          { "Math." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Microcomputer" =
          { "Microcomput." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Microcomputers" =
          { "Microcomput." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Numerantium" =
          { "Numer." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Numerische" =
          { "Numer." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Numerical" =
          { "Numer." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Of" =
          { "" 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "of" =
          { "" 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "On" =
          { "" 's :=
            #1 'i.flag := }
          'skip$
        if$
}

FUNCTION {check.words.5}
{
        s "on" =
          { "" 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Operational" =
          { "Oper." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Operations" =
          { "Oper." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Optimization" =
          { "Optim." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Physics" =
          { "Phys." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Problem" =
          { "Prob." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Problems" =
          { "Prob." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Proceedings" =
          { "Proc." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Processing" =
          { "Process." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Programming" =
          { "Program." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Quality" =
          { "Qual." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Quarterly" =
          { "Q." 's :=
            #1 'i.flag := }
          'skip$
        if$
}

FUNCTION {check.words.6}
{
        s "Reliability" =
          { "Reliab." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Research" =
          { "Res." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Safety" =
          { "Saf." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Science" =
          { "Sci." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Scientific" =
          { "Sci." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Series" =
          { "Ser." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Society" =
          { "Soc." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Statistical" =
          { "Stat." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Statistics" =
          { "Stat." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Symposium" =
          { "Symp." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Systems" =
          { "Syst." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Technical" =
          { "Tech." 's :=
            #1 'i.flag := }
          'skip$
        if$
}

FUNCTION {check.words.7}
{
        s "The" =
          { "" 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "the" =
          { "" 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Theoretical" =
          { "Theor." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Transactions" =
          { "Trans." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Transportation" =
          { "Transp." 's :=
            #1 'i.flag := }
          'skip$
        if$        
        s "Electronic" =
          { "Electron." 's :=
            #1 'i.flag := }
          'skip$
        if$                
        s "In" =
          { "" 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "in" =
          { "" 's :=
            #1 'i.flag := }
          'skip$
        if$        
        s "Geographical" =
          { "Geogr." 's :=
            #1 'i.flag := }
          'skip$
        if$       
        s "Geographers" =
          { "Geogr." 's :=
            #1 'i.flag := }
          'skip$
        if$               
        s "Association" =
          { "Assoc." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Economics" =
          { "Econ." 's :=
            #1 'i.flag := }
          'skip$
        if$        
}

FUNCTION {check.words.8}
{
        s "Economic" =
          { "Econ." 's :=
            #1 'i.flag := }
          'skip$
        if$          
        s "American" =
          { "Am." 's :=
            #1 'i.flag := }
          'skip$
        if$
        s "Probability" =
          { "Prob." 's :=
            #1 'i.flag := }
          'skip$
        if$
	s "Academy" =
          { "Acad." 's :=
            #1 'i.flag := }
          'skip$
        if$
	s "Institute" =
          { "I." 's :=
            #1 'i.flag := }
          'skip$
        if$
	s "Marketing" =
          { "Mark." 's :=
            #1 'i.flag := }
          'skip$
        if$
	s "Policy" =
          { "Pol." 's :=
            #1 'i.flag := }
          'skip$
        if$
	s "Biology" =
          { "Biol." 's :=
            #1 'i.flag := }
          'skip$
        if$
	s "Geometry" =
          { "Geom." 's :=
            #1 'i.flag := }
          'skip$
        if$        
	s "Sciences" =
          { "Sci." 's :=
            #1 'i.flag := }
          'skip$
        if$                   
	s "Informational" =
          { "Informat." 's :=
            #1 'i.flag := }
          'skip$
        if$   
	s "\&" =
          { "" 's :=
            #1 'i.flag := }
          'skip$
        if$   
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "}" * }
  if$
}

FUNCTION {makebold}
{ duplicate$ empty$
    { pop$ "" }
    { "{\bf " swap$ * "}" * }
  if$
}

FUNCTION {process.journal}
{
  't :=  
  "" 'abbreviated.journal :=
  #0 'i.flag :=

  "Journal of the ACM" t =
  {  "J ACM" 'abbreviated.journal := 
     #1 'i.flag :=
  }
  'skip$
  if$
  
  "Journal of the Association for Computing Machinery" t =
  {  "J ACM" 'abbreviated.journal := 
     #1 'i.flag :=
  }
  'skip$
  if$
      
  #0 i.flag =
  { #1 'st.string :=
    #1 'end.string :=    
    #0 'while.flag :=  
    #0 'end.of.line :=
    t text.length$ 'total.char :=
    
    {#0 end.of.line =}
    {   t next.end.char 'end.string :=
        end.string st.string - 'word.length :=
        t st.string word.length substring$ 's :=
        
        #0 'i.flag :=
        
        check.words.1
        check.words.2
        check.words.3
        check.words.4
        check.words.5
        check.words.6
        check.words.7
        check.words.8        

        abbreviated.journal s * 'abbreviated.journal :=
        
        #1 end.of.line =
        'skip$
        { abbreviated.journal t end.string #1 substring$ * 'abbreviated.journal :=
          #1 end.string + 'end.string :=
          end.string 'st.string :=
        }
        if$
    }   
    while$
  }
  'skip$
  if$
  abbreviated.journal 
}

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { " " * write$ }                        % IF MID SENTENCE
    { output.state after.block =
        { ", " * write$                     % IF AFTER A BLOCK
        }
        { output.state before.all =
            'write$                         % IF BEFORE ALL
            { add.period$ " " * write$ }    % IF AFTER A SENTENCE
          if$
        }
      if$
      mid.sentence 'output.state :=   % (move to mid-sentence if not already there)
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



INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{f{.}.~}{vv~}{ll}{, jj}" format.name$ 't :=
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
        { " (eds.)" * }
        { " (ed.)" * }
      if$
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ emphasize}
  if$
}

FUNCTION {format.thesistitle}
{ title empty$
    { "" }
    { title "t" change.case$}
  if$
}

FUNCTION {format.journal}
{ journal "European Journal of Operations Research" =
    { "Eur. J. Oper. Res." }
    { journal }
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
    { month empty$
        { "" }
        { "there's a month but no year in " cite$ * warning$
          month
        }
      if$
    }
    { month empty$
        { year }
        { month " " * year * }
      if$
    }
  if$
}

FUNCTION {format.dateyearonly}
{ year empty$
    { month empty$
        { "" }
        { "there's a month but no year in " cite$ * warning$
          month
        }
      if$
    }
    { month empty$
        { year }
        { year }
      if$
    }
  if$
}

FUNCTION {format.dateyearonlypar}
{ year empty$
    { month empty$
        { "" }
        { "there's a month but no year in " cite$ * warning$
          month
        }
      if$
    }
    { month empty$
        { "(" year * ")" * }
        { "(" year * ")" * }
      if$
    }
  if$
}

FUNCTION {format.btitle}
{ title emphasize
}

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

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { "Vol." volume tie.or.space.connect
      series empty$
        'skip$
        { " of " * series emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { output.state mid.sentence =
            { "number" }
            { "Number" }
          if$
          number tie.or.space.connect
          series empty$
            { "there's a number but no series in " cite$ * warning$ }
            { " in " * series * }
          if$
        }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
        { edition "l" change.case$ " edition" * }
        { edition "t" change.case$ " edition" * }
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

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { "" pages n.dashify tie.or.space.connect }
        { "" pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume field.or.null 
  number empty$
    'skip$
    { "(" number * ")" * *
      volume empty$
        { "there's a number but no volume in " cite$ * warning$ }
        'skip$
      if$
    }
  if$
  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ":" * pages n.dashify * }
      if$
    }
  if$
}

FUNCTION {format.vol}
{ volume field.or.null makebold
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    {"pp. " format.pages *}
    { type empty$
        { "chapter" }
        { type "l" change.case$ }
      if$
      chapter tie.or.space.connect
      pages empty$
        'skip$
        { ", pp. " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.bvolume.chapter.pages}
{ 
  ""
  volume empty$
    'skip$
    { "Vol." volume tie.or.space.connect *
      series empty$
        'skip$
        { " of " * series * }
      if$
      ", " *
      "volume and number" number either.or.check
    }
  if$

  chapter empty$
    {"pp." format.pages tie.or.space.connect *}
    { "Chapter" chapter tie.or.space.connect *
      pages empty$
        'skip$
        { ", pp." format.pages tie.or.space.connect * }
      if$
    }
  if$
}

FUNCTION {format.pp.pages}
{ ""
    "pp." format.pages tie.or.space.connect *
}


FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
        { booktitle emphasize }
        { #1 editor num.names$ =
            { booktitle emphasize ", " * format.editors * }
            { booktitle emphasize ", " * format.editors * }
          if$
        }
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
    { "Tech.~Report" }
    'type
  if$
  "t" change.case$
  number empty$
    'skip$
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
        { "need key or journal for " cite$ * " to crossref " * crossref *
          warning$
          ""
        }
        { "In {\em " journal * "\/}" * }
      if$
    }
    { "In " key * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  editor num.names$ duplicate$
  #2 >
    { pop$ " et~al." * }
    { #2 <
        'skip$
        { editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            { " et~al." * }
            { " and " * editor #2 "{vv~}{ll}" format.name$ * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "In "
    }
    { "Volume" volume tie.or.space.connect
      " of " *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { series empty$
            { "need editor, key, or series for " cite$ * " to crossref " *
              crossref * warning$
              "" *
            }
            { "{\em " * series * "\/}" * }
          if$
        }
        { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { booktitle empty$
            { "need editor, key, or booktitle for " cite$ * " to crossref " *
              crossref * warning$
              ""
            }
            { "In {\em " booktitle * "\/}" * }
          if$
        }
        { "In " key * }
      if$
    }
    { "In " format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { journal process.journal "journal" output.check
      format.vol output
      "(" format.date * ")" * "year" output.check
      new.block
      format.pages output
      new.block
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  note output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check 
  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      new.block %new.sentence
      publisher "publisher" output.check
      new.block
      address output
      new.block
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  new.block
  format.title "title" output.check
  howpublished address new.block.checkb
  howpublished output
  address output
  format.date output
  new.block
  note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.chapter.pages "chapter and pages" output.check
      new.block
      format.number.series output
      new.sentence
      publisher "publisher" output.check
      address output
    }
    { format.chapter.pages "chapter and pages" output.check
      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  new.block
  "``" format.title * "," * quote$ * output

 format.in.ed.booktitle "booktitle" output.check 
      format.edition output          
      new.block
      publisher "publisher" output.check
      new.block
      address "," * output
      format.date "year" output.check      
      new.block
%      format.bvolume.chapter.pages output
      format.pp.pages output

  new.block
  note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block

     %booktitle process.journal "booktitle" output.check
     booktitle "booktitle" output.check
      new.block
      address empty$
        { format.bvolume output
          new.block
          publisher output
          new.block
%          organization output
%          new.block
          format.date "year" output.check
          new.block
        }
        { 
          format.bvolume output          
          new.block
          publisher output
          new.block
	  address output.nonnull          
          new.block
%          organization output
          format.date "year" output.check
          new.block
        }
      if$
      format.number.series output
    

  pages empty$
    'skip$
    {   "pp." format.pages tie.or.space.connect output }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
        'skip$
        { organization output.nonnull
          address output
        }
      if$
    }
    { format.authors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  author empty$
    { organization empty$
        { address new.block.checka
          address output
        }
        'skip$
      if$
    }
    { organization address new.block.checkb
      organization output
      address output
    }
  if$
  format.edition output
  format.date output
  new.block
  note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.thesistitle "title" output.check
  new.block
  "Master's thesis" format.thesis.type output.nonnull
  new.block
  school "school" output.check
  new.block
%  address output
  new.block
  format.dateyearonly "year" output.check
  new.block
%  note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  new.block
%  title howpublished new.block.checkb
  format.dateyearonly "year" output.check
  "." *
  format.thesistitle output
  "." *
%  new.block
%  "webpage." output
%  howpublished new.block.checka
%  howpublished output
%  format.date output
%  new.block
  note output
  fin.entry
  empty.misc.check
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.thesistitle "title" output.check
  new.block
  "Ph.D.~thesis" format.thesis.type output.nonnull
  new.block
  school "school" output.check
  new.block
%  address output
  new.block
  format.dateyearonly "year" output.check
  new.block
%  note output
  fin.entry  
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  address empty$
    { editor empty$
        { publisher new.sentence.checka }
        { organization publisher new.sentence.checkb
          organization output
        }
      if$
      publisher output
      format.date "year" output.check
    }
    { address output.nonnull
      format.date "year" output.check
      new.sentence
      editor empty$
        'skip$
        { organization output }
      if$
      publisher output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  format.tr.number output.nonnull
  new.block
  institution "institution" output.check
  new.block
  address output
  new.block
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  note "note" output.check
  format.date output
  fin.entry
}

FUNCTION {default.type} { misc }

MACRO {jan} {"Jan."}

MACRO {feb} {"Feb."}

MACRO {mar} {"Mar."}

MACRO {apr} {"Apr."}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"Aug."}

MACRO {sep} {"Sept."}

MACRO {oct} {"Oct."}

MACRO {nov} {"Nov."}

MACRO {dec} {"Dec."}

MACRO {acmcs} {"ACM Comput. Surv."}

MACRO {acta} {"Acta Inf."}

MACRO {cacm} {"Commun. ACM"}

MACRO {ibmjrd} {"IBM J. Res. Dev."}

MACRO {ibmsj} {"IBM Syst.~J."}

MACRO {ieeese} {"IEEE Trans. Softw. Eng."}

MACRO {ieeetc} {"IEEE Trans. Comput."}

MACRO {ieeetcad}
 {"IEEE Trans. Comput.-Aided Design Integrated Circuits"}

MACRO {ipl} {"Inf. Process. Lett."}

MACRO {jacm} {"J.~ACM"}

MACRO {jcss} {"J.~Comput. Syst. Sci."}

MACRO {scp} {"Sci. Comput. Programming"}

MACRO {sicomp} {"SIAM J. Comput."}

MACRO {tocs} {"ACM Trans. Comput. Syst."}

MACRO {tods} {"ACM Trans. Database Syst."}

MACRO {tog} {"ACM Trans. Gr."}

MACRO {toms} {"ACM Trans. Math. Softw."}

MACRO {toois} {"ACM Trans. Office Inf. Syst."}

MACRO {toplas} {"ACM Trans. Prog. Lang. Syst."}

MACRO {tcs} {"Theoretical Comput. Sci."}

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
        { "   " * }
        'skip$
      if$
      s nameptr "{vv{ } }{ll{ }}{  f{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = t "others" = and
        { "et al" * }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
        { key empty$
            { "to sort, need author, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
        { key empty$
            { "to sort, need editor, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
        'editor.organization.sort
        { type$ "manual" =
            'author.organization.sort
            'author.sort
          if$
        }
      if$
    }
  if$
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT

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
  "\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}





