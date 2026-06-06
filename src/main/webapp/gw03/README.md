# GW03: JSP 蝓ｺ譛ｬ讒区枚繝ｻ繝・ぅ繝ｬ繧ｯ繝・ぅ繝悶・繧｢繧ｯ繧ｷ繝ｧ繝ｳ繧ｿ繧ｰ繝ｻ繧ｹ繧ｯ繝ｪ繝励ユ繧｣繝ｳ繧ｰ隕∫ｴ 讓｡遽・ｧ｣遲・
縺薙・繝輔か繝ｫ繝縺ｫ縺ｯ Q01縲弉10 縺ｮ隱ｲ鬘後ｒ螳溯｣・＠縺・JSP 縺ｨ蠢・ｦ√↑繧ｵ繝昴・繝医ヵ繧｡繧､繝ｫ繧帝・鄂ｮ縺励※縺・∪縺吶・蜷・ヵ繧｡繧､繝ｫ縺ｮ蜀帝ｭ縺ｫ **隗｣隱ｬ繧ｳ繝｡繝ｳ繝・* 繧定ｨ倩ｿｰ縺励√・繧､繝ｳ繝医ｄ豕ｨ諢冗せ繧定ｪｬ譏弱＠縺ｦ縺・∪縺吶・
### 驟咲ｽｮ
- **JSP**: `src/main/webapp/gw03/`
- **Java 繧ｯ繝ｩ繧ｹ**: `src/main/java/gw04/tag/HelloTag.java`, `src/main/java/gw04/bean/UserBean.java`
- **TLD**: `src/main/webapp/WEB-INF/tlds/sample.tld`

### 繝輔ぃ繧､繝ｫ荳隕ｧ
| 繝輔ぃ繧､繝ｫ | 蜀・ｮｹ |
|---|---|
| `basicPage.jsp` | Q01 蝓ｺ譛ｬ繝壹・繧ｸ |
| `datePage.jsp` | Q02 迴ｾ蝨ｨ譌･譎・|
| `commonHeader.jsp` | Q03 繝倥ャ繝繝ｼ |
| `commonFooter.jsp` | Q03 繝輔ャ繧ｿ繝ｼ |
| `layoutPage.jsp` | Q03 繝ｬ繧､繧｢繧ｦ繝・|
| `errorTest.jsp` | Q04 繧ｨ繝ｩ繝ｼ逋ｺ逕・|
| `errorPage.jsp` | Q04 繧ｨ繝ｩ繝ｼ陦ｨ遉ｺ |
| `tldHello.jsp` | Q05 繧ｿ繧ｰ菴ｿ逕ｨ |
| `productMain.jsp` | Q06 繝｡繧､繝ｳ |
| `productParts.jsp` | Q06 驛ｨ蜩・|
| `forwardCheck.jsp` | Q07 蛻､螳・|
| `adminPage.jsp` | Q07 邂｡逅・・|
| `guestPage.jsp` | Q07 繧ｲ繧ｹ繝・|
| `beanUserPage.jsp` | Q08 Bean 蛻ｩ逕ｨ |
| `scoreTable.jsp` | Q09 謌千ｸｾ陦ｨ |
| `implicitCommentPage.jsp` | Q10 繧ｳ繝｡繝ｳ繝医・證鈴ｻ吶が繝悶ず繧ｧ繧ｯ繝・|

蜷・JSP 縺ｯ UTF-8 繧呈・遉ｺ縺励∵枚蟄怜喧縺鷹亟豁｢縺ｮ縺溘ａ `pageEncoding="UTF-8"` 繧呈欠螳壹＠縺ｦ縺・∪縺吶・
### 蜷・JSP 縺ｮ讀懆ｨｼ逕ｨ URL

| 繝輔ぃ繧､繝ｫ | URL |
|---|---|
| `basicPage.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/basicPage.jsp](http://localhost:8080/jsp_servlet_gw/gw03/basicPage.jsp) |
| `datePage.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/datePage.jsp](http://localhost:8080/jsp_servlet_gw/gw03/datePage.jsp) |
| `commonHeader.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/commonHeader.jsp](http://localhost:8080/jsp_servlet_gw/gw03/commonHeader.jsp) |
| `commonFooter.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/commonFooter.jsp](http://localhost:8080/jsp_servlet_gw/gw03/commonFooter.jsp) |
| `layoutPage.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/layoutPage.jsp](http://localhost:8080/jsp_servlet_gw/gw03/layoutPage.jsp) |
| `errorTest.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/errorTest.jsp](http://localhost:8080/jsp_servlet_gw/gw03/errorTest.jsp) |
| `errorPage.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/errorPage.jsp](http://localhost:8080/jsp_servlet_gw/gw03/errorPage.jsp) |
| `tldHello.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/tldHello.jsp](http://localhost:8080/jsp_servlet_gw/gw03/tldHello.jsp) |
| `productMain.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/productMain.jsp](http://localhost:8080/jsp_servlet_gw/gw03/productMain.jsp) |
| `productParts.jsp` | [http://localhost:8080/jsp_servrent_gw/gw03/productParts.jsp](http://localhost:8080/jsp_servlet_gw/gw03/productParts.jsp) |
| `forwardCheck.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/forwardCheck.jsp](http://localhost:8080/jsp_servlet_gw/gw03/forwardCheck.jsp) |
| `adminPage.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/adminPage.jsp?role=admin](http://localhost:8080/jsp_servlet_gw/gw03/adminPage.jsp?role=admin) |
| `guestPage.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/guestPage.jsp?role=guest](http://localhost:8080/jsp_servlet_gw/gw03/guestPage.jsp?role=guest) |
| `beanUserPage.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/beanUserPage.jsp](http://localhost:8080/jsp_servlet_gw/gw03/beanUserPage.jsp) |
| `scoreTable.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/scoreTable.jsp](http://localhost:8080/jsp_servlet_gw/gw03/scoreTable.jsp) |
| `implicitCommentPage.jsp` | [http://localhost:8080/jsp_servlet_gw/gw03/implicitCommentPage.jsp](http://localhost:8080/jsp_servlet_gw/gw03/implicitCommentPage.jsp) |

窶ｻ Tomcat 縺ｮ繧ｳ繝ｳ繝・く繧ｹ繝医ヱ繧ｹ縺・`gw03` 繝・ぅ繝ｬ繧ｯ繝医Μ逶ｴ荳九↓繝槭ャ繝斐Φ繧ｰ縺輔ｌ縺ｦ縺・ｋ蜑肴署縺ｧ縺吶ょｮ滄圀縺ｮ迺ｰ蠅・↓蜷医ｏ縺帙※繝代せ繧定ｪｿ謨ｴ縺励※縺上□縺輔＞縲・
