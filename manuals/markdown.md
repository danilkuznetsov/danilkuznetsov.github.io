---
layout: page
title: Links
permalink: /manuals/markdown
---

##### Document internal links

[Original answer](https://stackoverflow.com/questions/6695439/how-to-link-to-a-named-anchor-in-multimarkdown)

In standard Markdown, place an anchor `<a name="abcd"></a>` 
where you want to link to and refer to it on the same page by [link text](#abcd).

(This uses name= and not id=, for reasons explained in [this answer](https://stackoverflow.com/questions/5319754/cross-reference-named-anchor-in-markdown/7335259#7335259).)

Remote references can use [link text](http://...#abcd) of course.

This works like a dream, provided you have control over the source and target texts. 
The anchor can even appear in a heading, thus:

### <a name="head1234"></a>A Heading in this SO entry!

produces:
A Heading in this SO entry!

and we can even link to it so:

and we can even [link](#head1234) to it so:

(On SO, the link doesn't work because the anchor is stripped.)


### More information:
* [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#html)
