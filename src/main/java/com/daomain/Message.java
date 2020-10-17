package com.daomain;




public class Message {
    private Integer flag;  //记录操作数据库的状态
    private String message; // 记录消息
   public static  Integer num;  //用来区分登录人的身份

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public static Integer getNum() {
        return num;
    }

    public static void setNum(Integer num) {
        Message.num = num;
    }

    @Override
    public String toString() {
        return "Message{" +
                "flag=" + flag +
                ", message='" + message + '\'' +
                '}';
    }
}
