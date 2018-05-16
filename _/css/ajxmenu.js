// Ajatix Advanced CSS Drop Down Menu
// Copyright (C) 2009-2016 Ajatix. All rights reserved.
// http://www.ajatix.com
(function($){var d=document,de=d.documentElement,name="AJXCSSMenuUdPLMDD",menu,hasTouch=("ontouchstart" in window||window.navigator.msMaxTouchPoints),mul,clickMode=false,active=new Array();if(!$){$=function(s, c){var out=[];if(typeof s!=="string")out=out.concat(s);else{var es=(c||d).querySelectorAll(s);for(var i=0;i<es.length;i++)out.push(es[i]);}var meths={css:function(p,v){var e=this;if(typeof p=="object"){for(var s in p)e.style[s]=p[s];}else{if(arguments.length>1){e.style[p]=v;}else{return [e.currentStyle? e.currentStyle[p]:window.getComputedStyle(e, "")[p]];}}},hide:function(){this.style.display="none";},show:function(){this.style.display="";}};for(var meth in meths)(function(n,m){out[n]=function(){var r=[];for(var i=0;i<this.length;i++)r.push(m.apply(this[i],arguments));return r[0]? r[0][0]:out;}}(meth, meths[meth]));return out;}}function onLoad(){var divs=$("div");for(var i=0;i<divs.length;i++){if(divs[i].className==name){menu=divs[i];mul=$("ul", menu)[0];var lis=$("li", menu);for(var n=lis[0];n;n=n.nextSibling)if(n.tagName=="LI"){n.ajxtop=true;}for(var j=0;j<lis.length;j++){var li=lis[j];var aa=$("a", li);if(aa.length>0){li.className=li.className;li.style.position="static";var subs=$("ul", li);if(subs.length>0){aa[0].setAttribute('aria-haspopup',true);$(subs[0]).hide();}li.shown=li.show=false;if(hasTouch){li.onmspointerdown=li.ontouchstart=function(e){e.stopPropagation();if(handleClick(this))return false;}}li.onmouseover=function(){if(clickMode)return;activate(this);};li.onmouseout=function(){if(clickMode)return;deactivate(this);};li.onclick=function(e){if(clickMode){e.stopPropagation();if(hasTouch&&this.skipClick)return false;if(handleClick(this))return false;mul.show=false;mul.style.height=0;mul.className="";}deactivateAll();}}}menu.ontouchstart=menu.onclick=function(e){if(!clickMode)return;mul.show=!mul.show;if(mul.show){mul.className="ajxover";showNarrowSub(mul);}else{mul.bheight=mul.offsetHeight;rollnarrow(mul,1,function(mul){deactivateAll();mul.style.height=0;mul.className="";mul.style.overflow="";});}return false;}}}if(window.addEventListener)window.addEventListener('resize',setClickMode,false);if(hasTouch)d.addEventListener('touchstart', function(){deactivateAll()}, false);}function setClickMode(){var newClickMode=false;window.innerWidth;if(window.getComputedStyle&&window.getComputedStyle(menu,':after').getPropertyValue('content').indexOf('narrow')!=-1)newClickMode=true;if(newClickMode!=clickMode){mul.show=false;mul.className="";deactivateAll();if(newClickMode){menu.className=name+"_n";mul.style.height=0;$("ul", menu).css("listStyleType","none");mul.step=0;}else{menu.className=name;mul.style.height="auto";}}clickMode=newClickMode;}function handleClick(o){var subs=$("ul", o);if(subs.length>0&&!o.show){var parents=new Array();var p=o;while(p!=menu){p=p.offsetParent;if(p.tagName=="LI")parents.push(p);}for(var i=active.length-1;i>=0;i--){var d=1;for(var j=0;j<parents.length;j++){if(parents[j]==active[i])d=0;}if(d){deactivate(active[i]);active.splice(i,1);}}active.push(o);activate(o);return true;}o.skipClick=false;return false;}function activate(o){clearTimeout(menu.timer);if(o.className.indexOf("ajxover")==-1)o.className+=" ajxover";o.show=true;o.skipClick=true;if(menu.clickMode)update();else menu.timer=setTimeout(update, 150);}function deactivate(o,i){clearTimeout(menu.timer);if(i||!o.shown)o.className=o.className.replace(new RegExp(" ?ajxover\\b"), "");o.show=false;o.skipClick=false;if(i)$("ul",o).hide();if(menu.clickMode)update();else menu.timer=setTimeout(update, 400);}function deactivateAll(){for(var i=0;i<active.length;i++)deactivate(active[i],1);active.length=0;update();}function hideSub(sub){$(sub).hide();var li=sub.parentNode;li.style.position="static";if(li.className.indexOf("ajxover")!=-1)li.className=li.className.replace(new RegExp(" ?ajxover\\b"), "");}function showNarrowSub(sub){$(sub).css({"position":"absolute","left":"-9999px","height":"auto","display":""});sub.bheight=sub.offsetHeight;$(sub).css({"height":0,"overflow":"hidden","position":"","left":""});rollnarrow(sub,0);}function hideNarrowSub(sub){sub.bheight=sub.offsetHeight;rollnarrow(sub,1,function(sub){hideSub(sub);$(sub).css({"height":"","overflow":""});});}function update(){var lis=$("li", menu);for(var i=lis.length-1;i>=0;i--){var li=lis[i];if(li.show){if(!li.shown){var subs=$("ul", li);if(subs.length>0){var sub=subs[0];li.style.position="relative";if(!clickMode){sub.style.clip="rect(0,0,0,0)";$(sub).css("display","block");if(typeof(sub.oleft)=="undefined")sub.oleft=parseInt($(sub).css("left"));var left=sub.oleft;sub.style.left=sub.oleft+"px";if(typeof(sub.otop)=="undefined")sub.otop=parseInt($(sub).css("top"));var rec=sub.getBoundingClientRect();var overflow=rec.right-getViewWidth();if(overflow>0){var altleft=li.getBoundingClientRect().width-sub.oleft-rec.width;var aoverflow=-(li.getBoundingClientRect().left+altleft);if(overflow>rec.width/2&&overflow>aoverflow){left=altleft+(aoverflow>0?aoverflow:0);}else{left=sub.offsetLeft-overflow;}sub.style.left=left+"px";}sub.aleft=left;slide(sub,li.ajxtop,0);}else showNarrowSub(sub);li.shown=true;}}}else{if(li.shown){li.shown=false;var subs=$("ul", li);if(subs.length>0){var sub=subs[0];if(!clickMode){$("ul", sub).hide();slide(sub,li.ajxtop,1,function(sub){hideSub(sub);});}else hideNarrowSub(sub);}}}}}function getViewWidth(){return!window.innerWidth||innerWidth<=screen.width ?de.clientWidth:de.scrollWidth*de.clientWidth/outerWidth;}function slide(o,d,r,cb){var h=o.offsetHeight;var w=o.offsetWidth;var c=d? h:w;var t=d?o.otop:o.aleft;animate(function(s){var v=c*s;o.style[d?"top":"left"]=v-c+t+"px";if(s<1){o.style.clip="rect("+(d?c-v+"px":"0")+","+w+"px,"+h+"px,"+(d?"0":c-v+"px")+")";}else{try{o.style.clip="";}catch(e){o.style.clip="inherit";}}if(cb&&s==(r?0:1))cb(o);}, 200, o, r, o.step);}function rollnarrow(o,r,cb){animate(function(s){if(s<1){o.style.overflow="hidden";o.style.height=o.bheight*((-Math.cos(s*Math.PI)/2)+0.5)+"px";}else{$(o).css({"height":"","overflow":""});}if(cb&&s==(r?0:1))cb(o);}, 400, o, r, o.step);}function animate(cb, d, o, r, ss){function getTime(){return window.performance&&performance.now&&performance.now()||new Date;}if(!ss)ss=r?1:0;var tstart=getTime();if(o)o.tstart=tstart;if(!d)d=1000;var requestAnimFrame=window.requestAnimationFrame||function(cb, element){window.setTimeout(cb, 1000/60);};function animloop(timestamp){if(typeof timestamp!=typeof tstart)timestamp=getTime();var s=(timestamp-tstart)/d+(r?1-ss:ss);if(s>1)s=1;if(r)s=1-s;if(o)o.step=s;if(!o||o.tstart==tstart){cb(s);if(r?s>0:s<1)requestAnimFrame(animloop);}}animloop(tstart);}function addOnReady(f,fu){var isReady=false;function ready(){if(!isReady){isReady=true;f();};setClickMode();}if(d.addEventListener){d.addEventListener('DOMContentLoaded',ready,false);window.addEventListener("load",ready,false);window.addEventListener("unload",fu,false);}if(window.attachEvent)window.attachEvent("onload",ready);if(de.doScroll&&window==top){(function(){if(!isReady){try{de.doScroll("left");}catch(E){setTimeout(arguments.callee,0);return;}ready();}})()}}addOnReady(onLoad, onLoad);})(window.jQuery);