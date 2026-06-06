package gw05.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

/**
 * 独自タグ <badge:level level="..." /> の処理を行うカスタムタグクラス（タグハンドラ）です。
 * SimpleTagSupportを継承することで、ボディを持たない空タグなどのシンプルな独自タグを容易に作成できます。
 */
public class LevelBadgeTag extends SimpleTagSupport {
    
    /* JSP側から渡される属性値 (level="...") を保持するためのプライベート変数 */
    private String level;

    /**
     * level属性の setter メソッド。
     * JSPでタグが実行される際、サーブレットコンテナ（Tomcat）によって自動的に呼び出され、属性値がセットされます。
     * @param level JSP側で指定された属性値 (high, middle, low など)
     */
    public void setLevel(String level) {
        this.level = level;
    }

    /**
     * 独自タグが処理される際に呼び出されるメイン処理メソッドです。
     * 属性値の判定を行い、対応するHTMLの装飾タグ (spanタグ) を動的に出力します。
     */
    @Override
    public void doTag() throws JspException, IOException {
        // JSP画面へテキストを出力するための JspWriter オブジェクトを取得します
        JspWriter out = getJspContext().getOut();
        
        // デフォルト値 (属性値が未指定、または無効な値の場合)
        String badgeClass = "badge-none";
        String label = "重要度:未設定";

        // 引数の level の文字列に応じて、CSSクラス名と表示用ラベルを振り分けます
        // ※ NullPointerException を防ぐため、定数側から equalsIgnoreCase() を呼び出しています
        if ("high".equalsIgnoreCase(level)) {
            badgeClass = "badge-high";
            label = "重要度:高";
        } else if ("middle".equalsIgnoreCase(level)) {
            badgeClass = "badge-middle";
            label = "重要度:中";
        } else if ("low".equalsIgnoreCase(level)) {
            badgeClass = "badge-low";
            label = "重要度:低";
        }

        // HTML の span 要素として組み立てて出力します (style.css 内のバッジ用デザインが適用されます)
        out.write("<span class=\"badge " + badgeClass + "\">" + label + "</span>");
    }
}
