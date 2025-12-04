package com.code.utils.wxyy;

import com.baidubce.qianfan.Qianfan;
import com.baidubce.qianfan.core.auth.Auth;
import com.baidubce.qianfan.model.chat.ChatResponse;

public class WXYY {
    private static Qianfan qianfan;

    static {
        qianfan = new Qianfan(Auth.TYPE_OAUTH, "3vrmGP4Wwqz1L6kqEAuAdpsw", "YrkQLQaMTxcXwM89sc1gmTDJZGbRqZTz");
    }

    public static String compare(String message) {
        ChatResponse resp = qianfan.chatCompletion()
                .model("ERNIE-Bot")
                .addMessage("user", message)
                .execute();
        return resp.getResult();
    }


}
