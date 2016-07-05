var module = angular.module('app');
module.component('addSpec', {
    require: {
        parent: '^^specs'
    },
    bindings: {
        spec: '<?'
    },
    templateUrl: 'specs/add-spec/add-spec.template.html',
    controller: function() {
            
       var self = this;
       self.text = '';
       
       self.indent = function(){
           var input = angular.element("textarea")[0];
           var start = input.selectionStart;
           
           //self.text = '\t' + self.text;
           //.match(/([^\n | $]+)(?:$|\n)/g)
           //text from beginning of string to selectionStart
           var firstString = self.text.substr(0, start);
           //find last newline
           var lastNIndex = 0;
           var match;
           var regex = /\n/g
           while ((match = regex.exec(firstString)) != null) {
               // +1 because we want to include newline in substring
                lastNIndex = match.index + 1;
            }
            //add \t after it
            self.text = self.text.substring(0, lastNIndex) + '\t' + self.text.substring(lastNIndex);
            
           //find every newline between selectionStart and
           // selectionEnd and add \t after it
           
            input.selectionStart = start + 1;
            input.focus();
       };
       
       self.cancelAdd = function() {
           self.parent.cancelAdd(self.spec);
       };
    }
});