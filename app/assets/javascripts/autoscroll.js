$(document).ready(function(){

var elemHeight = [],
    elemOffset = [],
    currentElement = 0,//the first element
    previousScroll,
    scrollPos,
    timerObject = {a:0};

$("div.element").each(function(index)
{
	var prevHeight = $(this).prev().outerHeight(),
      prevOffset = $(this).prev().offset();
	if(index > 0)
	{
		TweenMax.set($(this), {top:(prevHeight + prevOffset.top)});
	}
	elemHeight.push($(this).outerHeight());
	elemOffset.push($(this).offset().top);
});

$(window).scroll(function()
{
	scrollPos = $(this).scrollTop();
	//check scroll direction
	if(previousScroll < scrollPos)//scrolling down
	{
		if(scrollPos > ( (elemHeight[currentElement] / 2) + elemOffset[currentElement] / 2) )
		{
			currentElement++;//we passed to the next element of the collection because more than 50% of that element is visible now
		}
	}
	else if(previousScroll > scrollPos)//scrolling up
	{
		if(scrollPos < ( (elemHeight[currentElement - 1] * 2) + elemOffset[currentElement - 1] * 2) )
		{
			currentElement--;//we passed to the previuos element of the collection because more than 50% of that element is visible now
		}
	}
	previousScroll = scrollPos;
	TweenMax.to(timerObject, 2.9, {a:1, onComplete:timerComplete});
});

function timerComplete()
{
	//We scroll the window, or other element with an overflow property, to the top offset position of the current element
	//that has more than 50% showing on the screen.
	TweenMax.to(window, .75, {scrollTo:{y:elemOffset[currentElement]}, ease:Power4.easeOut});
}

});
