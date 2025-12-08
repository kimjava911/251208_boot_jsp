package kr.java.boot_jsp.model.repository;

import kr.java.boot_jsp.model.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
    // customer -> products => findById -> Lazy -> N+1(?)
    @Query("SELECT c FROM Customer c LEFT JOIN FETCH c.products WHERE c.id = :id")
    Optional<Customer> findByIdWithProducts(@Param("id") Long id);

    @Query("SELECT c FROM Customer c LEFT JOIN FETCH c.products") // N+1
    List<Customer> findAllWithProducts();
}
