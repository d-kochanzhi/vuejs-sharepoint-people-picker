<%@ Assembly Name="VueSharePointPeoplePicker, Version=1.0.0.0, Culture=neutral, PublicKeyToken=c43a68e30e3d4e27" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PickerDialog.aspx.cs" Inherits="VueSharePointPeoplePicker.Layouts.VueSharePointPeoplePicker.PickerDialog" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <link href="css/style.css" rel="stylesheet" />
    <script src="js/vue.js"></script>
    <script src="js/vue-resource.min.js"></script>
    <script src="js/lodash.min.js"></script>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">

    <div id="app">

        <div class="search">
            <input type="search" placeholder="Поиск" value="" v-model="searchText">
        </div>

        <table class="width100">
            <tr>
                <td>
                    <div class="tagcloud">
                        <ul>
                            <li v-for="item in selectedItems"><a href="#" v-on:click.prevent="removeItem(item)">{{item.Фамилия}} {{item.Имя0}}</a></li>
                        </ul>
                    </div>
                </td>            
                <td>
                    <div>
                        <input type="button" value="выбрать" v-if="selectedItems.length > 0" v-on:click.prevent="closeDialog()" />
                    </div>
                </td>
            </tr>
        </table>
        <span v-show="searchResults.length >0">Найдено: {{searchResults.length}}</span>
        <span>{{loadingText}}{{errorText}}</span>

        <div>
            <table class="width100">
                <template v-for="item in searchResults">
		  		<tr class="item-row">
		  				<td class="item-cell"><a href="#" class="link-item"  v-on:click.prevent="selectItem(item)">{{item.Фамилия}} {{item.Имя0}}</a></td>

		  				<td class="item-cell">{{item.Отдел}}</td>
		  		</tr>
		  	</template>
            </table>
        </div>
    </div>

    <script src="js/main.js"></script>
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Application Page
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server" >
My Application Page
</asp:Content>
