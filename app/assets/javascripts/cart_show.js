/**
 * Created by Administrator on 2015/6/14.
 */
function IsNumeric(sText)
{
    var ValidChars="0123456789";
    var IsNumber=true;
    var Char;
    if (sText.length>2)
    {
        return false;
    }
    for (i = 0; i<sText.length && IsNumber ==true; i++)
    {
        Char=sText.charAt(i);
        if (ValidChars.indexOf(Char) ==-1)
        {
            return false;
        }
    }
    return true;
}

function calcProdSubTotal() {
    var prodSubTotal = 0;
    $(".cart_product_row_total_price_span").each(function(){
        var valString = $(this).text() || 0;
        prodSubTotal += parseFloat(valString);
    });
    $("#Cart_total_number_text").html(prodSubTotal.toFixed(2));
}

function calcTotalPallets() {
    var totalPallets = 0;
    $(".cart_product_number").each(function() {
        var thisValue = $(this).val();
        if ( (IsNumeric(thisValue)) &&  (thisValue != '') ) {
            totalPallets +=parseInt(thisValue);
        }
    });
    $("#total_product_num").html(parseInt(totalPallets));
}

$(function(){
    $('.cart_product_number').blur(function()
        {
            var $this = $(this);
            var numPallets = $this.val();
            var multiplier = $this
                .parent().parent()
                .find("h5.cart_product_per_price span")
                .text();

            //if ( (IsNumeric(numPallets)) && (numPallets != '') ) {
            if ((IsNumeric(numPallets)) && (numPallets != ''))
            {
                var rowTotal = numPallets * multiplier;
                $this
                    .css("background-color", "white")
                    .parent().parent()
                    .find("h5.cart_product_row_total_price span")
                    .html(rowTotal.toFixed(2));
            }
            else
            {
                $this
                    .parent().parent()
                    .find("#number_slider_out input")
                    .val(1);
                $this
                    .parent().parent()
                    .find("h5.cart_product_row_total_price span")
                    .html(multiplier.toFixed(2));
            }
            calcTotalPallets();
            calcProdSubTotal();
        })
});