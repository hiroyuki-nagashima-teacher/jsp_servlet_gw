package gw04.bean;

import java.io.Serializable;

/**
 * ユーザー情報を保持するシンプルな JavaBeans クラスです。
 * JavaBeansの規約に従って実装されています。
 */
public class UserBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private String name;
    private int age;
    private String role;

    /**
     * 引数なしのデフォルトコンストラクタ。
     * jsp:useBeanタグで自動生成されるために必須です。
     */
    public UserBean() {
    }

    public UserBean(String name, int age, String role) {
        this.name = name;
        this.age = age;
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
