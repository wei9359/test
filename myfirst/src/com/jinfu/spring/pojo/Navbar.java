package com.jinfu.spring.pojo;

/**
 * @ClassName Navbar
 * @auther 魏星
 * @DATE 2018/6/15
 */
public class Navbar {
    private String barID;
    private String fatherID;
    private String href;
    private int level;
    private String icon;
    private String barName;

    public String getBarID() {
        return barID;
    }

    public void setBarID(String barID) {
        this.barID = barID;
    }

    public String getFatherID() {
        return fatherID;
    }

    public void setFatherID(String fatherID) {
        this.fatherID = fatherID;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getBarName() {
        return barName;
    }

    public void setBarName(String barName) {
        this.barName = barName;
    }
}
