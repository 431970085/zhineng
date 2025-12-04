package com.code.utils.wxyy;

import com.code.util.GlobalResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

@Controller
@CrossOrigin("*") //支持跨域请求
public class WXYYController {
    @ResponseBody
    @RequestMapping("/wxyy")
    public GlobalResult wxyy(String msg) {
        System.out.println("msg = " + msg);
        String compare = WXYY.compare(msg);
        return GlobalResult.ok(compare);
    }

}
