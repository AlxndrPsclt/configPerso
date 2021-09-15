// ==UserScript==
// @name          Facebook Nord Color (New Version)
// @namespace     http://userstyles.org
// @description	  Made for dark mode facebook
// @author        Đăng Vũ
// @homepage      https://userstyles.org/styles/186623
// @run-at        document-start
// @version       0.20200715192959
// ==/UserScript==
(function() {var css = [
	"/* i really want this to be global */",
	"",
	"#jsc_c_2 stop,",
	"#jsc_c_2 path,",
	".ms05siws stop {",
	"	stop-color: #2E3440;",
	"	background: #2E3440;",
	"}",
	"",
	".cddn0xzi {",
	"	background: #2E3440;",
	"}",
	"",
	"._6s5d {",
	"	background: #2E3440;",
	"}",
	"",
	".b3i9ofy5 {",
	"	background: linear-gradient(145deg, #353b4a, #3f4758);",
	"}",
	"",
	".s1i5eluu {",
	"	background: #2E3440;",
	"}",
	"",
	".q66pz984 {",
	"	color: #2E3440;",
	"}",
	"",
	".op6gxeva {",
	"	-webkit-filter: invert(0.7) sepia(0.22) saturate(2) saturate(2) saturate(2) saturate(1.89) hue-rotate(191deg) brightness(1.03) contrast(1.02);",
	"}",
	"",
	".eb18blue {",
	"	-webkit-filter: invert(0.9) sepia(0.9) saturate(9) saturate(2) saturate(2) saturate(1.89) hue-rotate(191deg) brightness(1.03) contrast(1.02);",
	"}",
	"",
	".b3i9ofy5 .tw6a2znq,",
	".b3i9ofy5 .tw6a2znq .oo9gr5id {",
	"	background: #2E3440;",
	"	border-radius: 18px;",
	"	color: #2E3440 !important;",
	"}",
	"",
	".nc684nl6 .pq6dq46d .oo9gr5id {",
	"	color: #2E3440 !important;",
	"}",
	"",
	".b3i9ofy5 .tw6a2znq .m9osqain {",
	"	color: #2E3440 !important;",
	"}",
	"",
	"#facebook ._-kb.segoe {",
	"	font-family: Iosevka, Verdana, Arial, Helvetica, sans-serif;",
	"}",
	"",
	".aaxa7vy3 path,",
	".sp_i1jxPDrLHjH_2x.sx_a8d620 {",
	"	fill: #8fbcbb;",
	"}",
	"",
	".ooq845xs {",
	"	border-bottom-color: #8fbcbb;",
	"}",
	"",
	"._1mj span,",
	"._7c_r ._1p1v,",
	"#facebook ._-kb button,",
	"#facebook ._-kb input,",
	"#facebook ._-kb label,",
	"#facebook ._-kb select,",
	"#facebook ._-kb td,",
	"#facebook ._-kb textarea {",
	"	color: #2E3440 !important;",
	"}",
	"",
	".em6zcovv {",
	"	fill: #fff;",
	"}"
].join("\n");
if (typeof GM_addStyle != "undefined") {
	GM_addStyle(css);
} else if (typeof PRO_addStyle != "undefined") {
	PRO_addStyle(css);
} else if (typeof addStyle != "undefined") {
	addStyle(css);
} else {
	var node = document.createElement("style");
	node.type = "text/css";
	node.appendChild(document.createTextNode(css));
	var heads = document.getElementsByTagName("head");
	if (heads.length > 0) {
		heads[0].appendChild(node);
	} else {
		// no head yet, stick it whereever
		document.documentElement.appendChild(node);
	}
}
})();
