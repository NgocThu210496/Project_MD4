package com.ra.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "orderProduct")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Order {
    @Id
    @Column(name = "order_id",columnDefinition = "char(5)")
    private String orderId;

    //Mỗi Order liên quan đến một Account (mối quan hệ nhiều-đến-một)
    @ManyToOne
    @JoinColumn(name = "account_id")
    private Account account;


    @Column(name = "created")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date created = new Date();

    @Column(name = "status")
    private String status;

    //Mỗi Order thuộc về một Bill (mối quan hệ nhiều-đến-một)
/*    @ManyToOne
    @JoinColumn(name = "bill_id", referencedColumnName = "bill_id")
   // private Bill bill;
    private List<Bill> listbill;*/

    @OneToMany(mappedBy = "order",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    private List<Bill> listBill;
}
