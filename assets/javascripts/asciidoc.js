// Elements definition ------------------------------------

// strong
jsToolBar.prototype.elements.strong = {
	type: 'button',
	title: 'Strong',
	fn: {
		wiki: function() { this.singleTag("*", "*") }
	}
}

// em
jsToolBar.prototype.elements.em = {
	type: 'button',
	title: 'Emphasized',
	fn: {
		wiki: function() { this.singleTag("_", "_") }
	}
}

// code
jsToolBar.prototype.elements.code = {
	type: 'button',
	title: 'Code',
	fn: {
		wiki: function() { this.singleTag('+', '+') }
	}
}

// spacer
jsToolBar.prototype.elements.space1 = {type: 'space'}

// headings
jsToolBar.prototype.elements.h0 = {
	type: 'button',
	title: 'Heading 0',
	fn: {
		wiki: function() {
		  return this.encloseLineSelection('', '', function(str) {
		    return str+"\n======================";
		  });
		}
	}
}
jsToolBar.prototype.elements.h1 = {
	type: 'button',
	title: 'Heading 1',
	fn: {
		wiki: function() {
		  return this.encloseLineSelection('', '', function(str) {
		    return str+"\n----------------------";
		  });
		}
	}
}
jsToolBar.prototype.elements.h2 = {
	type: 'button',
	title: 'Heading 2',
	fn: {
		wiki: function() {
		  return this.encloseLineSelection('', '', function(str) {
		    return str+"\n~~~~~~~~~~~~~~~~~~~~~~";
		  });
		}
	}
}
jsToolBar.prototype.elements.h3 = {
	type: 'button',
	title: 'Heading 3',
	fn: {
		wiki: function() {
		  return this.encloseLineSelection('', '', function(str) {
		    return str+"\n^^^^^^^^^^^^^^^^^^^^^^";
		  });
		}
	}
}
jsToolBar.prototype.elements.h4 = {
	type: 'button',
	title: 'Heading 4',
	fn: {
		wiki: function() {
		  return this.encloseLineSelection('', '', function(str) {
		    return str+"\n++++++++++++++++++++++";
		  });
		}
	}
}

// spacer
jsToolBar.prototype.elements.space2 = {type: 'space'}

// ul
jsToolBar.prototype.elements.ul = {
type: 'button',
      title: 'Unordered list',
      fn: {
        wiki: function() {
                this.encloseLineSelection('','',function(str) {
                  str = str.replace(/\r/g,'');
                  return str.replace(/((?:\n|^)\s*)(\*|\d+\.)?\s*/g,"$1* ");
                });
        }
      }
}

// ol
jsToolBar.prototype.elements.ol = {
type: 'button',
      title: 'Ordered list',
      fn: {
        wiki: function() {
                this.encloseLineSelection('','',function(str) {
                  str = str.replace(/\r/g,'');
                  return str.replace(/((?:\n|^)\s*)(\*|\d+\.)?\s*/g,"$11. ");
                });
        }
      }
}

// spacer
jsToolBar.prototype.elements.space3 = {type: 'space'}

// bq
jsToolBar.prototype.elements.bq = {
  type: 'button',
  title: 'Quote',
  fn: {
    wiki: function() {
      return this.encloseLineSelection('', '', function(str) {
        return "-------------------------------\n"+str+"\n-------------------------------";
      });
    }
  }
}

// unbq
jsToolBar.prototype.elements.unbq = {
  type: 'button',
  title: 'Unquote',
  fn: {
    wiki: function() {
      return  this.encloseLineSelection('','',function(str) {
        return str.replace(/\r/g,'').
                replace(/(<------------------------------->\n|\n-------------------------------)/g, '');
      });
    }
  }
}

// pre
jsToolBar.prototype.elements.pre = {
	type: 'button',
	title: 'Preformatted',
	fn: {
		wiki: function() {
			this.encloseLineSelection('','',function(str) {
				str = str.replace(/\r/g,'');
				return str.replace(/(\n|^)\s*/g,"$1    ");
			});
		}
	}
}

// unpre
// jsToolBar.prototype.elements.unpre = {
// 	type: 'button',
// 	title: 'Un-preformatted',
// 	fn: {
// 		wiki: function() {
// 			this.encloseLineSelection('','',function(str) {
// 				str = str.replace(/\r/g,'');
// 				return str.replace(/(\n|^)(\t|    )/g,"$1");
// 			});
// 		}
// 	}
// }

// spacer
jsToolBar.prototype.elements.space4 = {type: 'space'}

// wiki page
jsToolBar.prototype.elements.link = {
	type: 'button',
	title: 'Wiki link',
	fn: {
		wiki: function() { this.encloseSelection("[[", "]]") }
	}
}
// image
jsToolBar.prototype.elements.img = {
	type: 'button',
	title: 'Image',
	fn: {
          wiki: function() {
                  this.encloseSelection('', '', function(str) {
                    altText = str.replace(/^\/?(?:[^\/]*\/)*([^\/]*)$/, '$1');
                    return '!['+altText+']('+str+')';
                  });
                }
	}
}
