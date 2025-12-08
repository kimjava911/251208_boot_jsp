package kr.java.boot_jsp;

import kr.java.boot_jsp.model.entity.Customer;
import kr.java.boot_jsp.model.entity.Product;
import kr.java.boot_jsp.model.repository.CustomerRepository;
import kr.java.boot_jsp.model.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor // 의존성
public class DataInitializer implements CommandLineRunner {
    // repo 의존성 주입
    private final CustomerRepository customerRepository;
    private final ProductRepository productRepository;

    @Override
    public void run(String... args) throws Exception {
        if (customerRepository.count() > 0) return; // 데이터 존재 시 미 실행
        Customer customer1 = new Customer("하츄핑", "heart@ping.com");
        Customer customer2 = new Customer("시러핑", "dislike@ping.com");
        Customer customer3 = new Customer("코딩핑", "coding@ping.com");
        customerRepository.save(customer1);
        customerRepository.save(customer2); // 컨텍스트에 유지된 개념
        customerRepository.save(customer3);
        Product product1 = new Product("노트북", 1500000, customer1);
        Product product2 = new Product("마우스", 50000, customer1);
        Product product3 = new Product("키보드", 120000, customer2);
        productRepository.save(product1);
        productRepository.save(product2);
        productRepository.save(product3);
    }
}
