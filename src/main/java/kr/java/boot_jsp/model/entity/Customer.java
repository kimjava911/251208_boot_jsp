package kr.java.boot_jsp.model.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "CUSTOMER") // naming: physical-strategy
@Data // @Getter, @Setter, ... @ToString(?)
@NoArgsConstructor // new Customer()
public class Customer {
    // ID
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // MySQL, MariaDB -> Auto Increment
    // @Column
    private Long id;

    private String name;
    private String email;

    @Column(name = "created_at") // SQL -> snake_case
//    @CreatedDate -> Audit 활성화가 필요. -> BaseEntity -> 상속.
    private LocalDateTime createdAt; // camel case

    @PrePersist
    public void onCreate() {
        createdAt = LocalDateTime.now();
        // Persist할 때 위의 시간을 삽입하는 코드가 발동
    }

    // 생성자
    public Customer(String name, String email) {
        this.name = name;
        this.email = email;
    }

    // 매핑
    // product -> customer
    @OneToMany(mappedBy = "customer", fetch = FetchType.LAZY)
    // 필요하다면 repository에서 fetch join을 사용해서 미리 불러진 상태로 받아오거나
    // controller, service 단에서 의도적으로 호출을 해서 불러오게 -> LAZY
    private List<Product> products = new ArrayList<>();
}
