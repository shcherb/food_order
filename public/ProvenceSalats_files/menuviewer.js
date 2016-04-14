var MenuViewer = {
	prevItem: null,
	prevClass: '',
	urlBase: '',

	Move: function(right)
	{
		var nextItem;
		if(right)
			nextItem=$($(this.prevItem).nextAll(".item-wrap")[0]);
		else
			nextItem=$($(this.prevItem).prevAll(".item-wrap")[0]);
		
		if(nextItem.length==0)
		{
			if(right)
			{
				nextItem=$(".item-wrap").first();
			}
			else
			{
				nextItem=$(".item-wrap").last();
			}
		}
		nextItem.click();
	},

	ItemClick: function(event)
	{
		var $item=$(this);
		if(MenuViewer.prevItem!=this)
		{
			$item.addClass("active");
			//change img
			var cls=$item.children('.item').attr("class");
			if(cls!=MenuViewer.prevClass)
			{
				var match=cls.match(/img(\d+)/);
				//$(".image-wrapper img.hid").remove();
				if(match)
				{
					$(".image-wrapper .square").append('<img src="'+MenuViewer.urlBase+'/files/_thumbs/'+match[1]+'_272x260_dim0.jpg'+'" class="hid" width="272" height="260" alt="" title="" />');
					/*$(".image-wrapper img:not(.hid)").animate({opacity:0},500,function() { $(".image-wrapper img:not(.hid)").remove(); $(".image-wrapper img.hid").removeClass("hid"); });
					$(".image-wrapper img.hid").css("opacity","0.0").css("display","block").animate({opacity: 1.0},500);*/
				}
				else
				{
					$(".image-wrapper .square").append('<img src="'+MenuViewer.urlBase+'/templates/riviera/img/noimg.png'+'" class="hid" width="265" height="265" alt="" title="" />');
					/*$(".image-wrapper img:not(.hid)").animate({opacity:0},500,function() { $(".image-wrapper img:not(.hid)").remove(); $(".image-wrapper img.hid").removeClass("hid"); });
					$(".image-wrapper img.hid").css("opacity","0.0").css("display","block").animate({opacity: 1.0},500);*/
				}
				$(".image-wrapper .square img:not(:last-child)").animate({opacity:0},500,function () { 
					$.each($(".image-wrapper img"),function(i,v) {
						if(parseFloat($(v).css("opacity"))==0)
							$(v).remove();
					});
				});
				$(".image-wrapper .square img:last-child").css("opacity","0.0").css("display","block").animate({opacity:1},500);
				MenuViewer.prevClass=cls;
			}
			
			if(MenuViewer.prevItem)
				$(MenuViewer.prevItem).removeClass("active");

			var text=$item.find(".title").text().replace(/ (\([0-9]+.*$)/,"<br />$1");
			
			$(".image-wrapper .caption").html(text); 
			//alert(text);
			MenuViewer.prevItem=this;
		}
	}
};