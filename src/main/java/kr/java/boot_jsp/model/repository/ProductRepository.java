package kr.java.boot_jsp.model.repository;

import kr.java.boot_jsp.model.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
}
