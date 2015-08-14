function share_change()
{
    var i=$("#share");
    if (i.hasClass("share_close"))
    {
        i.removeClass("share_close");
        i.addClass("share_open");
    }
    else if (i.hasClass("share_open"))
    {

        i.removeClass("share_open");
        i.addClass("share_close");
    }
}

function share_close()
{
    var i=$("#share");
    if (i.hasClass("share_open"))
    {

        i.removeClass("share_open");
        i.addClass("share_close");
    }
}
