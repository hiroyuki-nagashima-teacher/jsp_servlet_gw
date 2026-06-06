package gw04.tag;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 * カスタムタグ <sample:hello name="..." /> の処理を行うJavaクラス（タグハンドラ）です。
 * SimpleTagSupportを継承し、Tomcat9環境（javaxパッケージ）に対応しています。
 */
public class HelloTag extends SimpleTagSupport {

    private String name;

    /**
     * name属性の setter メソッド。
     * JSP側で指定された属性値が自動的にセットされます。
     * @param name 表示対象の名前
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * タグが実行されたときに呼び出される処理です。
     */
    @Override
    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();

        if (name == null || name.isEmpty()) {
            out.print("こんにちは、ゲストさん");
        } else {
            out.print("こんにちは、" + name + "さん");
        }
    }
}
