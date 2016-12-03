(function() {
       var path = '//easy.myfonts.net/v2/js?sid=211102(font-family=Didot+LT+Pro+Bold)&sid=218035(font-family=Didot+LT+Pro+Roman)&sid=255247(font-family=Didot+LT+Std+Bold+Italic)&key=pdflvts6Rz',
           protocol = ('https:' == document.location.protocol ? 'https:' : 'http:'),
           trial = document.createElement('script');
       trial.type = 'text/javascript';
       trial.async = true;
       trial.src = protocol + path;
       var head = document.getElementsByTagName("head")[0];
       head.appendChild(trial);
   })();
