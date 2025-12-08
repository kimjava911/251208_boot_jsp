package kr.java.boot_jsp.controller;

import kr.java.boot_jsp.service.CustomerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.time.LocalDateTime;

@Controller // Dispacher Servlet에 연결
@RequiredArgsConstructor
public class MainController {
    private final CustomerService customerService;

    @GetMapping("/") // Mapping
    public String index(Model model) {
        model.addAttribute("customers",
                customerService.findAllWithProducts());
        model.addAttribute("serverTime", LocalDateTime.now());
        return "index"; // WEB-INF/views/{}.jsp
    }

    @GetMapping("/customer/{id}") // {변수명}
    public String customerDetail(@PathVariable Long id, Model model) {
        model.addAttribute("customer",
                customerService.findByIdWithProducts(id));
        return "customer/detail";
    }

    @GetMapping("/scriptlet-demo")
    public String scriptletDemo() {
        return "scriptlet-demo";
    }
}
