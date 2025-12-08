package kr.java.boot_jsp.model.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Entity
@Table(name = "PRODUCT")
@Data
@NoArgsConstructor
// 순환참조를 방지
@ToString(exclude = "customer") // @Data -> Customer -> Product -> Customer...
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private Integer price;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @PrePersist
    public void onCreate() {
        createdAt = LocalDateTime.now();
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_id")
    private Customer customer;

    public Product(String name, Integer price, Customer customer) {
        this.name = name;
        this.price = price;
        this.customer = customer;
    }
}
