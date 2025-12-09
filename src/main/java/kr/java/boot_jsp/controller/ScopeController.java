package kr.java.boot_jsp.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.time.LocalDateTime;

@Controller
public class ScopeController {
    @GetMapping("/scope-check")
    public String scopeCheck() {
        return "scope-check";
    }

    @GetMapping("/model-demo")
    public String modelDemo(Model model, HttpSession session,
                            @SessionAttribute(required = false) String test) {
        model.addAttribute("message", "from controller");
        model.addAttribute("currentTime", LocalDateTime.now());
        session.setAttribute("message", "use session");
        model.addAttribute("test", test);
        return "model-demo";
    }
}
