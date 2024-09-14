package dev.anhkiet.sportstore.service;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import dev.anhkiet.sportstore.domain.Product;
import dev.anhkiet.sportstore.domain.Product_;

public class ProductSpecs {
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public static Specification<Product> checkBrand(String brand) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get(Product_.BRAND), brand);
    }

    public static Specification<Product> checkMAXPrice(String price) {
        Double real_Price = Double.parseDouble(price);
        return (root, query, criteriaBuilder) -> criteriaBuilder.lessThan(root.get(Product_.PRICE), real_Price);
    }

    public static Specification<Product> checkPriceRange(String price) {
        final double min;
        final double max;

        if (price.equals("Under-100$")) {
            min = 1;
            max = 100;
        } else if (price.equals("From-100$-to-200$")) {
            min = 100;
            max = 200;
        } else if (price.equals("From-200$-to-300$")) {
            min = 200;
            max = 300;
        } else {
            // Handle case when price doesn't match any expected values
            return (root, query, criteriaBuilder) -> criteriaBuilder.conjunction(); // Returns no results
        }
        return (root, query, criteriaBuilder) -> criteriaBuilder.between(root.get(Product_.PRICE), min, max);
    }

    public static Specification<Product> checkMINPrice(String price) {
        Double real_Price = Double.parseDouble(price);
        return (root, query, criteriaBuilder) -> criteriaBuilder.greaterThan(root.get(Product_.PRICE), real_Price);
    }

    public static Specification<Product> brandSpec(List<String> brands) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.BRAND)).value(brands);
    }

}
