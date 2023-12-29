package com.ra.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.awt.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "product")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Product {
    @Id
    @Column(name = "product_id",length = 5)
    private String productId;
    @Column(name = "productName")
    private String productName;
    @Column(name = "price")
    private float price;
    @Column(name = "title")
    private String title;
    @Column(name = "description")
    private String description;
    @Column(name = "created")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date created;
    @Column(name = "image")
    private String image;
    @OneToMany(mappedBy = "product")
    private List<Image> imageList;
    @Column(name = "unit")
    private String unit;
    @Column(name = "status")
    private boolean status;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "catalog_id", referencedColumnName = "catalog_id")
    private Categories catalog;
}
