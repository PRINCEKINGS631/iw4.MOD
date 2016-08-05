#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;


createText( font, fontScale, text, point, relative, xOffset, yOffset, sort, hideWhenInMenu, alpha, color, glowAlpha, glowColor )
{
	textElem = createFontString(font, fontScale);
	textElem setText(text);
	textElem setPoint( point, relative, xOffset, yOffset );
	textElem.sort = sort;
	textElem.hideWhenInMenu = hideWhenInMenu;
	textElem.alpha = alpha;
	textElem.color = color;
	textElem.glowAlpha = glowAlpha;
	textElem.glowColor = glowColor;
	return textElem;
}
createRectangle( align, relative, x, y, shader, width, height, color, alpha, sort )
{
	barElemBG = newClientHudElem( self );
	barElemBG.elemType = "bar";
	if ( !level.splitScreen )
	{
		barElemBG.x = -2;
		barElemBG.y = -2;
	}
	barElemBG.width = width;
	barElemBG.height = height;
	barElemBG.align = align;
	barElemBG.relative = relative;
	barElemBG.xOffset = 0;
	barElemBG.yOffset = 0;
	barElemBG.children = [];
	barElemBG.sort = sort;
	barElemBG.color = color;
	barElemBG.alpha = alpha;
	barElemBG setParent( level.uiParent );
	barElemBG setShader( shader, width , height );
	barElemBG.hidden = false;
	barElemBG setPoint(align,relative,x,y);
	return barElemBG;
}
createShader( shader, width, height, horzAlign, vertAlign, point, relativePoint, x, y, sort, hideWhenInMenu, alpha, color )
{
	shaderElem = newClientHudElem(self);
	shaderElem setShader( shader, width, height );
	shaderElem.horzAlign = horzAlign;
	shaderElem.vertAlign = vertAlign;
	shaderElem.alignY = point;
	shaderElem.alignX = relativePoint;
	shaderElem.x = x;
	shaderElem.y = y;
	shaderElem.sort = sort;
	shaderElem.hideWhenInMenu = hideWhenInMenu;
	if(isDefined(alpha)) shaderElem.alpha = alpha;
	else shaderElem.alpha = 1;
	shaderElem.color = color;
	return shaderElem;
}

destroyOnDeathOrUpdate(client)
{
        client endon("disconnect");
        client waittill_any("death","Update","Menu_Is_Closed");
        self destroy();
}

destroyOnAny( elem, a, b, c, d ) 
{ 
    if(!isDefined(a)) 
        a = ""; 
    if(!isDefined(b)) 
        b = ""; 
    if(!isDefined(c)) 
        c = ""; 
	if(!isDefined(d))
		d = "";
    self waittill_any("death",a,b,c,d); 
    elem destroy(); 
}

elemFade(time, newAlpha)
{
	self fadeOverTime(time);
	self.alpha = newAlpha;
}