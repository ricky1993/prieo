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

function clear_selected(k){
    $(k).each(function()
    {
        var j=$(this);
        if (j.hasClass("selected"))
        {
            j.removeClass("selected");
        }
    })
}
function clear_active(k){
    $(k).each(function()
        {
            var j=$(this);
            if (j.hasClass("active"))
            {
                j.removeClass("active");
            }
        })
}
$(function(){
    $(".mat").click(function(){
        var i=$(this);
        if (i.hasClass("selected"))
        {
            i.removeClass("selected")
        }
        else{
            clear_selected(".mat");
            i.addClass("selected");
        }
        });

    $(".siz").click(function(){
        var i=$(this);
        if (i.hasClass("selected"))
        {
            i.removeClass("selected")
        }
        else{
            clear_selected(".siz");
            i.addClass("selected");
        }
    });

    $("#number_slider").blur(function()
        {
          var i=$(this);
          var i_value= i.val();
            if ((IsNumeric(i_value)) && (i_value != ''))
            {

            }
            else i.val(1);
        });
    $(".minus").click(function()
    {
        var i_value=parseInt($("#number_slider").val());
        if (i_value>1)
        {
            i_value=i_value-1;
        }
        $("#number_slider").val(i_value);
    });
    $(".add").click(function()
    {
        var i_value=parseInt($("#number_slider").val());
        if (i_value<99)
        {
            i_value=i_value+1;
        }
        $("#number_slider").val(i_value);
    })
    $(".indicator_img").click(function()
    {
       var i=$(this);
        clear_active(".indicator_img");
        i.addClass("active");
    });
});