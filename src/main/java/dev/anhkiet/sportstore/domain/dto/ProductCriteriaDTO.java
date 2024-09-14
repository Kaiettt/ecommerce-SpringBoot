package dev.anhkiet.sportstore.domain.dto;

import java.util.Optional;

public class ProductCriteriaDTO {
    private Optional<String> page = Optional.empty();
    private Optional<String> price = Optional.empty();
    private Optional<String> brand = Optional.empty();
    private Optional<String> sort = Optional.empty();

    public Optional<String> getPage() {
        return page;
    }

    public void setPage(Optional<String> page) {
        this.page = page;
    }

    public Optional<String> getPrice() {
        return price;
    }

    public void setPrice(Optional<String> price) {
        this.price = price;
    }

    public Optional<String> getBrand() {
        return brand;
    }

    public void setBrand(Optional<String> brand) {
        this.brand = brand;
    }

    public Optional<String> getSort() {
        return sort;
    }

    public void setSort(Optional<String> sort) {
        this.sort = sort;
    }

    public int getPageAsInt() {
        return page.map(Integer::parseInt).orElse(1); // Default to 1 if not present
    }
}
