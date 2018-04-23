Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub
    Protected Sub ASPxDataView1_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
        Session("CategoryID") = e.Parameter
        AccessDataSource1.SelectParameters("CategoryID").DefaultValue = e.Parameter
        TryCast(sender, ASPxDataView).DataBind()
    End Sub
    Protected Sub ASPxDataView1_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Session("CategoryID") Is Nothing Then
            Return
        End If
        AccessDataSource1.SelectParameters("CategoryID").DefaultValue = Session("CategoryID").ToString()
        TryCast(sender, ASPxDataView).DataBind()
    End Sub
End Class