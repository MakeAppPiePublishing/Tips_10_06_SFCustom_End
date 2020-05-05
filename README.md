# Tips_10_06_SFCustom_End
Learn how to make your own SF Symbols for your applications. I'll use Affinity Designer, but the process will work the same for any graphics editor that can read and export .svg files. For some known problems with some editors including Affinity Designer, see the README below. 

**Extra Comments about exporting the SVG with custom margins**

I found with Affinity Designer I was getting bugs. 
When importing a custom SF Symbol to Xcode that I have changed the margins, I got the error

*Corrupt Content: The SVG file provided for the symbol image set `pie.fill` is not suitable: Symbol image file `(null)` has guide object right-margin of the wrong type, it must be a shape*

This is not an error when validated in the SF Symbol app.  It appears to be an issue with the XML tags. Xcode requires only a `rect`   tag with an id, while my export (from Affinity Designer) exports the  `rect` encompassed in a `g` tag that has the id.   

For example, my  original export from SF Symbol has for a right margin: 

`<rect id="right-margin" x="1494.79" y="1030.79" width="12.451" height="119.336" style="fill:rgb(0,174,239);fill-opacity:0.4;"/>`


But the exported Affinity designer .svg has 

`<g id="right-margin" transform="matrix(1.74652,0,0,1,-1115.89,0)"><rect x="1494.79" y="1030.79" width="12.451" height="119.336" style="fill:rgb(0,174,239);fill-opacity:0.4;"/></g>`

And will cause an error. If you edit the XML to

 `<rect id="right-margin" x="1494.79" y="1030.79" width="12.451" height="119.336" style="fill:rgb(0,174,239);fill-opacity:0.4;"/>`

It will add the symbol without errors. 

Remove any `<g><\g>` tags around the margin rects. 

I Put in a bug report to Apple who says the XML must be properly formed, and it is the exporting application's problem, so if you see this, change it manually. 
