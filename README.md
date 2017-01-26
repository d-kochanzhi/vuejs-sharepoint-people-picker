# vuejs-sharepoint-people-picker

PeoplePicker получает список пользователей SharePoint из "СписокСведенийОПользователях" через интерфейс oData.

 Зависимости:
 * vue.js
 * vue-resource.min.js
 * lodash.min.js

Для тестирования:


```javascript
<div style="text-align:center">
    <input type="button" value="Выбрать пользователя" onclick="showPeoplePicker();" /> <br />
    <span>Ваш выбор:</span> <br />
    <span id="result"></span>
        </div>
    <script>
   function showPeoplePicker()
        {
             
            var options = {
                title: "Выбор пользователя",
                width: 500,
                height: 600,
                url: "/_layouts/15/VueSharePointPeoplePicker/PickerDialog.aspx",
                dialogReturnValueCallback : closeCallback
            };
            
            SP.SOD.execute('sp.ui.dialog.js', 'SP.UI.ModalDialog.showModalDialog', options);
             
	};

        
	function closeCallback(result, target) {
            if (result == SP.UI.DialogResult.OK) {
                // Run OK Code
                var returnArray = target;
                returnArray.forEach(function (item) {
                    $('#result').append('<p>'+ item.Имя +'</p>');
                });
            }
            if (result == SP.UI.DialogResult.cancel) {
                // Run Cancel Code
            }
	};

    </script>
```

подробнее [в блоге на dzsoft.ru](http://dzsoft.ru/post/vue-js-people-picker-from-sharepoint-user-information-list) 
