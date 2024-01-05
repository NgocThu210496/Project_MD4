package com.ra.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "categories")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Categories {
    @Id
    @Column(name = "catalog_id",columnDefinition = "char(5)")
    private String catalogId;

    @Column(name = "catalog_name")
    private String catalogName;

    @Column(name = "description")
    private String description;

    @Column(name = "status")
    private boolean status;

    @OneToMany(mappedBy = "catalog",fetch = FetchType.EAGER)
    private List<Product> listProduct;
}
