package com.ra.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Formula;

import javax.persistence.*;
import java.util.List;
@Entity
@Table(name = "bill")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Bill {
    @Id
    @Column(name = "bill_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int billId;

    @ManyToOne
    @JoinColumn(name="productId")
    private Product product;

    @Column(name = "price")
    private float price;

    @Column(name = "quantity")
    private int quantity;

    @Formula("price * quantity")
    private float total;

    // Mỗi Bill có nhiều Order (mối quan hệ một-đến-nhiều)
    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

}
