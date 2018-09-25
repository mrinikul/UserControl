using System.Web.UI.WebControls;
using System.Data;

public partial class Enroll_TransactionField : System.Web.UI.UserControl
{
    public string SqlDataSourceSelectCommandValue
    {
        set
        {
            SqlDataSourceTransactionsByUniqueKeyNumberFieldName.SelectCommand = value;
        }
    }

    void SetParameterName(int i, string value)
    {
        Parameter p = new Parameter();
        p = SqlDataSourceTransactionsByUniqueKeyNumberFieldName.SelectParameters[i];
        p.Name = value;
    }

    public string Parameter1Name
    {
        set
        {
            SetParameterName(0, value);
        }
    }

    public string Parameter2Name
    {
        set
        {
            SetParameterName(1, value);
        }
    }

    public string Parameter3Name
    {
        set
        {
            SetParameterName(2, value);
        }
    }

    void SetParameterValue(int i, string value, DbType dbType)
    {
        Parameter p = new Parameter();
        p = SqlDataSourceTransactionsByUniqueKeyNumberFieldName.SelectParameters[i];
        p.DbType = dbType;
        p.DefaultValue = value;
    }

    public string Parameter1Value
    {
        set
        {
            SetParameterValue(0, value, DbType.String);
        }
    }

    public string Parameter2Value
    {
        set
        {
            SetParameterValue(1, value, DbType.String);
        }
    }

    public string Parameter3Value
    {
        set
        {
            SetParameterValue(2, value, DbType.String);
        }
    }

    public string CurrentFieldTitle 
    { 
        set
        {
            LabelFieldTitle.Text = value + ":";
            AccordionLabelFieldTitle.Text = value + ":";
        }
    }

    public string CurrentFieldValue
    {
        set
        {
            LabelFieldValue.Text = value;
            AccordionLabelFieldValue.Text = value;
        }
    }

    protected void SqlDataSourceTransactionsByUniqueKeyNumberFieldName_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            PlaceHolderFieldName.Visible = true;
            PlaceHolderAccordionFieldName.Visible = false;
        }
        else
        {
            PlaceHolderFieldName.Visible = false;
            PlaceHolderAccordionFieldName.Visible = true;
        }
    }
}