// ==UserScript==
// @name:ko           유튜브 풀스크린
// @name              Youtube Fullscreen Mode
// @name:ru           Youtube Полный режим
// @name:ja           Youtubeフルスクリーンモードの
// @name:zh-CN        优酷全屏模式
// @name:zh-TW        優酷全屏模式

// @description:ko    유튜브 화면을 자동으로 꽉 찬 화면으로 바꿉니다.
// @description       Automatically switch YouTube screens to 100 height and 100 width screens.
// @description:ru    Автоматическое переключение экрана на YouTube на экран высотой 100 и шириной 100.
// @description:ja    ユーチューブ画面を高さ100、広さ100画面に自動転換。
// @description:zh-CN YouTube画面自动转换成100高、100宽的画面。
// @description:zh-TW YouTube畫面自動轉換成100高、100寬的畫面。

// @namespace         https://ndaesik.tistory.com/
// @version           2023.08.23.1003
// @author            ndaesik
// @icon              https://lh3.googleusercontent.com/iLZyxGK7l1343U4E7eAfgKbRWW6qhzCJq-Z92M60JzCMntFyaFF2GUQVRxPhfGcy6qRISLjHv4fX1vtq0TZkZMAzBjM
// @match             *://*.youtube.com/*
// @downloadURL https://update.greasyfork.org/scripts/434075/Youtube%20Fullscreen%20Mode.user.js
// @updateURL https://update.greasyfork.org/scripts/434075/Youtube%20Fullscreen%20Mode.meta.js
// ==/UserScript==

const suggestBoxToDarkCSS = document.createElement("style");
suggestBoxToDarkCSS.innerText = `
[dark] {color-scheme: dark;}`.replaceAll(";", "!important;");

const fullscreenVideoCSS = document.createElement("style");
fullscreenVideoCSS.innerText = `
ytd-app:not([guide-persistent-and-visible]) [theater] #player video,
:is(ytd-watch-flexy[theater],ytd-watch-flexy[fullscreen]) #full-bleed-container {
height: 100vh; max-height: 100vh; min-height: 100vh;}`.replaceAll(
  ";",
  "!important;",
);

const autoHideTopCSS = document.createElement("style");
autoHideTopCSS.innerText = `
#masthead-container.ytd-app:hover, #masthead-container.ytd-app:focus-within {width:100%;}
#masthead-container.ytd-app,
#masthead-container.ytd-app:not(:hover):not(:focus-within) {width:calc(50% - 150px);}
#masthead-container.ytd-app:not(:hover):not(:focus-within) {transition:width 0.4s ease-out 0.4s;}
ytd-app:not([guide-persistent-and-visible]) :is(#masthead-container ytd-masthead, #masthead-container.ytd-app::after) {transform: translateY(-56px); transition: transform .1s .3s ease-out;}
ytd-app:not([guide-persistent-and-visible]) :is(#masthead-container:hover ytd-masthead, #masthead-container:hover.ytd-app::after, #masthead-container:focus-within ytd-masthead) {transform: translateY(0px);}
ytd-app:not([guide-persistent-and-visible]) ytd-page-manager {margin-top: 0;}`.replaceAll(
  ";",
  "!important;",
);
autoHideTopCSS.className = "autoHideTopCSS";

function isWatchPage() {
  return !(document.URL.indexOf("watch") == -1);
}

function isTheaterMode() {
  let scrollbarWidth =
    window.innerWidth - document.querySelector("ytd-app").offsetWidth;
  let playerWidth = document.querySelector("#ytd-player")?.offsetWidth;
  let isWidePlayer = scrollbarWidth + playerWidth == window.innerWidth;
  return isWatchPage() && isWidePlayer;
}

function alwaysTheaterMode() {
  let clickModeButtonRepeatly = setInterval((_) => {
    if (isTheaterMode()) {
      clearInterval(clickModeButtonRepeatly);
    } else {
      document.querySelectorAll(".ytp-size-button")?.forEach((e) => e.click());
      clearInterval(clickModeButtonRepeatly);
    }
  }, 100);
  setTimeout((_) => {
    clearInterval(clickModeButtonRepeatly);
  }, 10000);
}

["yt-navigate-finish", "load", "unload", "locationchange"].forEach((e) => {
  window.addEventListener(e, (_) => {
    isWatchPage() ? document.head.appendChild(autoHideTopCSS) : false;
    document.head.appendChild(suggestBoxToDarkCSS);
    document.head.appendChild(fullscreenVideoCSS);
    alwaysTheaterMode();
    window.scrollTo(0, 0);
  });
});

window.addEventListener("click", (_) => {
  setTimeout((_) => {
    if (!isWatchPage() || !isTheaterMode()) {
      document.querySelector(".autoHideTopCSS")?.remove();
    } else if (isTheaterMode()) {
      document.head.appendChild(autoHideTopCSS);
    }
  }, 100);
});
