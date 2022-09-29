# PhDThesisTemplate_UEF_HealthSciences
This template was adapted by Juan Miguel Valverde in 2021 to resemble to the Ph.D. Dissertations from the Faculty of Health Sciences (UEF). The original template was for the Faculty of Sciences and Forestry (see: https://kamu.uef.fi/en/tietopankki/publishing-of-doctoral-dissertation/faculty-of-science-and-forestry-instructions-for-publishing-the-dissertation/).

If you want/need to change something regarding the style, edit either thesis.tex or UEF_thesis.sty

## There might be still some issues with this template ##
* If you use footnotes, check their number is correct.
* If you use subsubsections, check whether they appear in the Table of Contents.
You are welcome to correct them.

## Check the double clear pages ##
This should be okay, but verify that the Chapters and other relevant pages start in an odd (e.g., 1, 3, etc.) page. Compare side by side with a published thesis.

## The font ##
The official font that needs to be used is Open Sans. I did not manage to do this, but the font I used is, in practice, 99% similar to Open Sans, so it's not a problem; you can compare the same words from my thesis and another thesis, side by side. This was mentioned by the printing company but as long as the editor approves it should be fine.

## Technical problem regarding the (non) Embedded fonts ##
When I sent my thesis to the printing company, they couldn't print it because the fonts were not embedded. This means that when they open the PDF, some fonts won't render. You can easily check whether your fonts are embedded with Adobe Acrobat Reader:
    1. Generate a PDF and open it in Adobe Acrobat Reader.
    2. Go to File -> Properties -> Fonts.
    3. All fonts there must be either "Embedded" or "Embedded Subset".
If you there are some fonts that are not embedded, you need to find where are those. In my case, they were in my vector images (EPS, SVG), and in some equations. A painful way to identify where are those non-embedded fonts is by splitting the PDFs into smaller PDFs, check the fonts, and split again until you find the right page.

Solution:
If the non-embedded fonts are in the formulas, you can use slightly different symbols.
If the non-embedded fonts are in the vector graphic images, convert them into PDF and embedded the fonts. I did this with Inkscape and I guess it can be done with many other programs. Google something like this: eps to pdf embedded font. After you've converted the images into PDFs, double-check the fonts are embedded and they were rendered correctly; I also had issues here, i.e., some of my fonts were not generated correctly. Another (dirty) way to avoid this problem is by not using vector graphics, i.e., convert your images to PNGs.

