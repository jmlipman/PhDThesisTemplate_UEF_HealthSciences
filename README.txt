



====== Original README ======

This package contains LaTeX-templates for generating PhD thesis according to the style defined for
UEF thesis during autumn 2016. The main files are thesis.tex for latex-bibtex and thesis_biblatex for
latex-biblatex. The final outcome is in both cases almost the same. When using bibtex sequence latex, bibtex, latex, latex,
dvips, ps2pdf is needed to create final pdf-file. With biblatex, the corresponding sequence is latex,
biber, latex, latex, dvips, ps2pdf. Note: biber/biblatex versions have to be compatible.

Package example files are:

thesis.tex              % main file for bibtex
thesis_biblatex.tex     % main file for biblatex
opening.tex             % layout settings for frontmatter with bibtex
opening_biblatex.tex    % layout settings for frontmatter with biblatex
examples.tex            % example file for typesettings
appendices.tex          % example file for appendices
coverpages.tex          % example file for generating cover pages for publications
biblio.bib		% example file for bibliography database
thesis.pdf		% final pdf-file
thesis_biblatex.pdf	% final pdf-file

Package style files are: PLEASE, DO NOT EDIT THESE! Miguel: Sorry, I just did!

UEF_thesis.sty		% local latex style formatting
UEF_biblatex.sty	% local biblatex style formatting for bibliographies
uefunsrt.bst            % local bibtex style formatting for bibliography
uefdm.dbx		% local entry definitions for biblatex

Figure files:

UEF_logo.eps            % UEF logo for first page
monitahokkaat.eps       % example figure


% Jukka Tuomela & Markku Kuittinen



