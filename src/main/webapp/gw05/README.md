# GW05: JSP 蝓ｺ譛ｬ讒区枚繝ｻ繝・ぅ繝ｬ繧ｯ繝・ぅ繝悶・繧｢繧ｯ繧ｷ繝ｧ繝ｳ繧ｿ繧ｰ繝ｻ繧ｹ繧ｯ繝ｪ繝励ユ繧｣繝ｳ繧ｰ隕∫ｴ

縺薙・繝輔か繝ｫ繝縺ｫ縺ｯ Q01縲弉10 縺ｮ隱ｲ鬘後ｒ螳溯｣・＠縺・JSP 縺ｨ蠢・ｦ√↑繧ｵ繝昴・繝医ヵ繧｡繧､繝ｫ繧帝・鄂ｮ縺励※縺・∪縺吶・蜷・ヵ繧｡繧､繝ｫ縺ｮ蜀帝ｭ縺ｫ **隗｣隱ｬ繧ｳ繝｡繝ｳ繝・* 繧定ｨ倩ｿｰ縺励√・繧､繝ｳ繝医ｄ豕ｨ諢冗せ繧定ｪｬ譏弱＠縺ｦ縺・∪縺吶・
### 驟咲ｽｮ
- **JSP**: `src/main/webapp/gw05/`
- **Java 繧ｯ繝ｩ繧ｹ**: `src/main/java/gw5/tag/LevelBadgeTag.java`, `src/main/java/gw5/bean/BookBean.java`
- **TLD**: `src/main/webapp/WEB-INF/tlds/badge.tld`

### 繝輔ぃ繧､繝ｫ荳隕ｧ
| 繝輔ぃ繧､繝ｫ | 蜀・ｮｹ |
|---|---|
| `trainingGuide.jsp` | Q01 遐比ｿｮ譯亥・ |
| `receptionTime.jsp` | Q02 蜿嶺ｻ俶律譎・|
| `commonMenu.jsp` | Q03 蜈ｱ騾壹Γ繝九Η繝ｼ |
| `commonNotice.jsp` | Q03 蜈ｱ騾壽ｳｨ諢乗嶌縺・|
| `courseTop.jsp` | Q03 蜈ｱ騾壹Ξ繧､繧｢繧ｦ繝・|
| `priceCalc.jsp` | Q04 萓｡譬ｼ險育ｮ暦ｼ医お繝ｩ繝ｼ逋ｺ逕滂ｼ・|
| `systemError.jsp` | Q04 繧ｷ繧ｹ繝・Β繧ｨ繝ｩ繝ｼ・医お繝ｩ繝ｼ陦ｨ遉ｺ・・|
| `badgePage.jsp` | Q05 迢ｬ閾ｪ繝舌ャ繧ｸ繧ｿ繧ｰ菴ｿ逕ｨ |
| `noticeMain.jsp` | Q06 縺顔衍繧峨○繝｡繧､繝ｳ |
| `noticeParts.jsp` | Q06 縺顔衍繧峨○驛ｨ蜩・|
| `scoreCheck.jsp` | Q07 蜷亥凄蛻､螳・|
| `passPage.jsp` | Q07 蜷域ｼ繝壹・繧ｸ |
| `failPage.jsp` | Q07 荳榊粋譬ｼ繝壹・繧ｸ |
| `bookPage.jsp` | Q08 JavaBeans蛻ｩ逕ｨ |
| `productList.jsp` | Q09 蝠・刀荳隕ｧ |
| `accessCheck.jsp` | Q10 繧｢繧ｯ繧ｻ繧ｹ遒ｺ隱阪・繧ｳ繝｡繝ｳ繝医・證鈴ｻ吶が繝悶ず繧ｧ繧ｯ繝・|

蜷・JSP 縺ｯ UTF-8 繧呈・遉ｺ縺励∵枚蟄怜喧縺鷹亟豁｢縺ｮ縺溘ａ `pageEncoding="UTF-8"` 繧呈欠螳壹＠縺ｦ縺・∪縺吶・
### 蜷・JSP 縺ｮ讀懆ｨｼ逕ｨ URL

| 繝輔ぃ繧､繝ｫ | URL |
|---|---|
| `trainingGuide.jsp` | [http://localhost:8080/jsp_servlet_gw/gw05/trainingGuide.jsp](http://localhost:8080/jsp_servlet_gw/gw05/trainingGuide.jsp) |
| `receptionTime.jsp` | [http://localhost:8080/jsp_servlet_gw/gw05/receptionTime.jsp](http://localhost:8080/jsp_servlet_gw/gw05/receptionTime.jsp) |
| `courseTop.jsp` | [http://localhost:8080/jsp_servlet_gw/gw05/courseTop.jsp](http://localhost:8080/jsp_servlet_gw/gw05/courseTop.jsp) |
| `priceCalc.jsp` | [http://localhost:8080/jsp_servlet_gw/gw05/priceCalc.jsp](http://localhost:8080/jsp_servlet_gw/gw05/priceCalc.jsp) |
| `badgePage.jsp` | [http://localhost:8080/jsp_servlet_gw/gw05/badgePage.jsp](http://localhost:8080/jsp_servlet_gw/gw05/badgePage.jsp) |
| `noticeMain.jsp` | [http://localhost:8080/jsp_servlet_gw/gw05/noticeMain.jsp](http://localhost:8080/jsp_servlet_gw/gw05/noticeMain.jsp) |
| `scoreCheck.jsp` | [http://localhost:8080/jsp_servlet_gw/gw05/scoreCheck.jsp?score=80](http://localhost:8080/jsp_servlet_gw/gw05/scoreCheck.jsp?score=80) |
| `bookPage.jsp` | [http://localhost:8080/jsp_servlet_gw/gw05/bookPage.jsp](http://localhost:8080/jsp_servlet_gw/gw05/bookPage.jsp) |
| `productList.jsp` | [http://localhost:8080/jsp_servlet_gw/gw05/productList.jsp](http://localhost:8080/jsp_servlet_gw/gw05/productList.jsp) |
| `accessCheck.jsp` | [http://localhost:8080/jsp_servlet_gw/gw05/accessCheck.jsp?visitor=Sato](http://localhost:8080/jsp_servlet_gw/gw05/accessCheck.jsp?visitor=Sato) |

窶ｻ Tomcat 縺ｮ繧ｳ繝ｳ繝・く繧ｹ繝医ヱ繧ｹ縺・`jsp_servlet_gw` 繝・ぅ繝ｬ繧ｯ繝医Μ逶ｴ荳九↓繝槭ャ繝斐Φ繧ｰ縺輔ｌ縺ｦ縺・ｋ蜑肴署縺ｧ縺吶ょｮ滄圀縺ｮ迺ｰ蠅・↓蜷医ｏ縺帙※繝代せ繧定ｪｿ謨ｴ縺励※縺上□縺輔＞縲・
