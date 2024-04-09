<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemSach.aspx.cs" Inherits="WebBanSach.XemSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <style>
        /** brand **/
        .brand {
            padding-top: 60px;
            border-top: #db0000 solid 6px;
        }

        .brand-bg {
            background: #ebebeb;
            padding: 90px 0px;
            font-family: Myriad Pro;
        }

        .margin {
            margin-bottom: 30px;
        }


        .brand-bg .brand_box {
            background: #fff;
            text-align: center;
            padding: 80px 0px 30px 0px;
        }

            .brand-bg .brand_box > img {
                height: 200px;
                width: auto;
            }

            .brand-bg .brand_box h3 {
                font-size: 27px;
                font-weight: bold;
                color: #131313;
                padding: 17px 0px 0px 0px;
            }

        .red {
            color: #ff0000;
        }

        .brand-bg .brand_box span {
            display: block;
            color: #19449b;
            font-size: 16px;
            line-height: 16px;
            padding-bottom: 3px;
        }

        .brand-bg .brand_box i {
            padding: 0px 2px;
        }

        .read-more {
            font-family: poppins;
            max-width: 212px;
            margin: 0 auto;
            margin-top: 0px;
            display: block;
            background: #000;
            color: #fff !important;
            padding: 12px 0px;
            width: 100%;
            font-size: 17px;
            text-align: center;
            border-radius: 32px;
            margin-top: 40px
        }

            .read-more:hover {
                background: #ff0000;
            }

        
    </style>
    <div class="brand">
        <div class="brand-bg">
            <div class="">
                <div class="row">
                    <div class="col-2">
                        <div class="left-menu">
                            <ul class="list-group">
                                <li class="list-group-item active">Chủ đề sách</li>
                                <asp:Repeater runat="server" DataSourceID="dsChuDe">
                                    <ItemTemplate>
                                        <li>
                                            <a class="list-group-item list-group-item-action" href="XemSach.aspx?macd=<%#Eval("macd") %>"><%#Eval("TenCD") %></a>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </ul>
                        </div>
                    </div>
                    <div class="col-10 ">
                        <div class="row">
                            <asp:Repeater runat="server" DataSourceID="dsSach">
                                <ItemTemplate>
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 margin">
                                        <div class="brand_box">
                                            <img src="/Bia_sach/<%#Eval("Hinh") %>" alt="img" />
                                            <h3><strong class="red"><%#Eval("Dongia") %></strong>$</h3>
                                            <span><%#Eval("TenSach") %></span>
                                            <br />
                                            <asp:Button ID="btAddToCart" runat="server" CssClass="btn btn-danger" Text="Thêm vào giỏ" CommandArgument='<%# Eval("MaSach") %>' />
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <div class="col-md-12">
                            <a class="read-more">See More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="dsSach" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [Sach] WHERE ([MaCD] = @MaCD)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="5" Name="MaCD" QueryStringField="macd" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsChuDe" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" SelectCommand="SELECT * FROM [ChuDe]"></asp:SqlDataSource>
</asp:Content>

