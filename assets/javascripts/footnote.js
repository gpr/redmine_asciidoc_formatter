/* Based on footnote generation code from:
 * http://www.brandspankingnew.net/archive/2005/07/format_footnote.html
 */
 
footnotes: function () {
  var cont = document.getElementById("content");
  var noteholder = document.getElementById("footnotes");
  var spans = cont.getElementsByTagName("span");
  var refs = {};
  var n = 0;
  for (i=0; i<spans.length; i++) {
    if (spans[i].className == "footnote") {
      n++;
      // Use [\s\S] in place of . so multi-line matches work.
      // Because JavaScript has no s (dotall) regex flag.
      note = spans[i].innerHTML.match(/\s*\[([\s\S]*)]\s*/)[1];
      noteholder.innerHTML +=
        "<div class='footnote' id='_footnote_" + n + "'>" +
        "<a href='#_footnoteref_" + n + "' title='Return to text'>" +
        n + "</a>. " + note + "</div>";
      spans[i].innerHTML =
        "[<a id='_footnoteref_" + n + "' href='#_footnote_" + n +
        "' title='View footnote' class='footnote'>" + n + "</a>]";
      var id =spans[i].getAttribute("id");
      if (id != null) refs["#"+id] = n;
    }
  }
  if (n == 0)
    noteholder.parentNode.removeChild(noteholder);
  else {
    // Process footnoterefs.
    for (i=0; i<spans.length; i++) {
      if (spans[i].className == "footnoteref") {
        var href = spans[i].getElementsByTagName("a")[0].getAttribute("href");
        href = href.match(/#.*/)[0];  // Because IE return full URL.
        n = refs[href];
        spans[i].innerHTML =
          "[<a href='#_footnote_" + n +
          "' title='View footnote' class='footnote'>" + n + "</a>]";
      }
    }
  }
}
