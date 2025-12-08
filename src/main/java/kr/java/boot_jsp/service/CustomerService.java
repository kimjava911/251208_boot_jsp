package kr.java.boot_jsp.service;

import kr.java.boot_jsp.model.entity.Customer;
import kr.java.boot_jsp.model.repository.CustomerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor // final
public class CustomerService {
    private final CustomerRepository customerRepository; // -> 생성자 주입 @RequiredArgsConstructor

    // 모든 고객 조회 (상품 정보 포함)
    @Transactional(readOnly = true)
    public List<Customer> findAllWithProducts() {
        return  customerRepository.findAllWithProducts();
    }

    // 개별 고객 조회 (상품 정보 포함)
    @Transactional(readOnly = true)
    public Customer findByIdWithProducts(Long id) {
        return customerRepository.findByIdWithProducts(id).orElseThrow();
        // Optional 기능 -> orElseThrow -> 감싼 데이터가 null이면 이 기능 호출 시 throw
    }
}
