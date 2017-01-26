new Vue({
    el: '#app',
    data: {
        searchText: '',
        errorText: '',
        loadingText: '',
        searchResults: [],
        selectedItems: [],
        webUrl:''
    },
    mounted: function() {
        this.webUrl = _spPageContextInfo.siteAbsoluteUrl.replace(/\/$/, "");
    },
    watch: {
        searchText: function(newText) {
            this.loadingText = 'Загрузка данных...';
            this.getAnswer();
        }
    },
    methods: {
        loadData: function() {
            this.$http.get(this.searchUrl).then((response) => {

                /*       
                Если в url есть параметр $top то возвращается масив в response.data.d
                иначе response.data.d.results
                */
                this.searchResults = response.data.d; 
            this.errorText = "";
            this.loadingText = "";
            this.clearResults();

        }, (response) => {
            this.errorText = "Ошибка запроса.";
});


},
getAnswer: _.debounce(
  function() {
      this.loadData();
  },
  500
),
    selectItem: function(item) {
        if (_.indexOf(this.selectedItems, item) == -1) {
            this.selectedItems.push(item);
            this.searchResults.splice(_.indexOf(this.searchResults, item), 1);

        }
        this.clearResults();
    },
removeItem: function(item) {
    this.selectedItems.splice(_.indexOf(this.selectedItems, item), 1);
    this.searchResults.push(item);
    this.clearResults();
},
clearResults: function() {
    if (this.searchResults)
        this.searchResults.sort(function(a, b) {
            if (a.Фамилия > b.Фамилия) {
                return 1;
            }
            if (a.Фамилия < b.Фамилия) {
                return -1;
            }
            return 0;
        });

},
closeDialog: function(){
    if(commonModalDialogClose.frameElement !== null)
        window.frameElement.commonModalDialogClose(1, this.selectedItems);
}

},
computed: {
        searchUrl: function() {
            return this.webUrl + "/_vti_bin/ListData.svc/СписокСведенийОПользователях?$filter=(startswith(Фамилия,'" + this.searchText + "') or startswith(Имя0,'" + this.searchText + "'))&$top=100";
        }

}

});