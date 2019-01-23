var width,height,frameCount=0,fillOn=true,strokeOn=true;;
function size(w, h){
  width=w;
  height=h;
  document.innerHTML+="<canvas id=\"pCanvas\" width=\""+w+"\" height=\""+h+"\"></canvas>";
  var c=document.getElementById("pCanvas");
  c.style.width=w;
  c.style.height=h;
}

function fullScreen(){
  var w = window.innerWidth;
  var h = window.innerHeight;
  document.innerHTML+="<canvas id=\"pCanvas\" width=\""+w+"\" height=\""+h+"\"></canvas>";
  var c=document.getElementById("pCanvas");
  c.style.width=w;
  c.style.height=h;
}
//document.getElementById("pCanvas").getContext("2d").
function line(x1,y1,x2,y2){
  if(strokeOn){
    document.getElementById("pCanvas").getContext("2d").line(x1,y1,x2,y2);
    document.getElementById("pCanvas").getContext("2d").stroke();
  }
}
function stroke(a,b,c,d){
  strokeOn=true;
  if(a&&b&&c&&d){
    document.getElementById("pCanvas").getContext("2d").strokeStyle="rgba("+a+","+b+","+c+","+d+")";
  }else if(a&&b&&c&&!d){
    document.getElementById("pCanvas").getContext("2d").strokeStyle="rgb("+a+","+b+","+c+")";
  }else if(a&&b&&!c&&!d){
    document.getElementById("pCanvas").getContext("2d").strokeStyle="rgba("+a+","+a+","+a+","+b+")";
  }else{
    document.getElementById("pCanvas").getContext("2d").strokeStyle="rgb("+a+","+a+","+a+")";
  }
}
function fill(a,b,c,d){
  fillOn=true;
  if(a&&b&&c&&d){
    document.getElementById("pCanvas").getContext("2d").fillStyle="rgba("+a+","+b+","+c+","+d+")";
  }else if(a&&b&&c&&!d){
    document.getElementById("pCanvas").getContext("2d").fillStyle="rgb("+a+","+b+","+c+")";
  }else if(a&&b&&!c&&!d){
    document.getElementById("pCanvas").getContext("2d").fillStyle="rgba("+a+","+a+","+a+","+b+")";
  }else{
    document.getElementById("pCanvas").getContext("2d").fillStyle="rgb("+a+","+a+","+a+")";
  }
}

function strokeWidth(a){
  ctx.lineWidth=a+"";
}
function noStroke(){
  strokeOn=false;
}
function noFill(){
  fillOn=false;
}
function rect(x,y,w,h){
  if(fillOn){
    document.getElementById("pCanvas").getContext("2d").fillRect(x,y,w,h);
  }
  if(strokeOn){
    document.getElementById("pCanvas").getContext("2d").rect(x,y,w,h);
    document.getElementById("pCanvas").getContext("2d").stroke();
  }
}
