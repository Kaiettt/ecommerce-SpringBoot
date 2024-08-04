package dev.anhkiet.sportstore.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import dev.anhkiet.sportstore.domain.Product;
import dev.anhkiet.sportstore.domain.User;
import dev.anhkiet.sportstore.service.ProductService;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {
    private ProductService productService;
    private PasswordEncoder passwordEncoder;

    public ProductController(ProductService productService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/product")
    public String getProductPage(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("Products", products);
        return "admin/product/show";
    }

    @GetMapping("/product/create")
    public String getProductCreatePage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping(value = "/admin/product/create")
    public String CreateProductPage(
            @ModelAttribute("newProduct") @Valid Product newProduct, BindingResult newProductBindingResult,
            @RequestParam("anhkietfile") MultipartFile file) {
        if (newProductBindingResult.hasErrors() || file.isEmpty()) {
            return "admin/product/create";
        }
        String img = this.productService.handleSaveFileUploading(file, "product");
        newProduct.setImage(img);
        newProduct.setSold(0);
        Product product = this.productService.handleSaveProduct(newProduct);
        return "redirect:/product";

    }

    @GetMapping("/product/delete/{ID}")
    public String DeleteProductPage(Model model, @PathVariable long ID) {
        model.addAttribute("id", ID);
        model.addAttribute("product", new Product());
        return "admin/product/delete";
    }

    @PostMapping(value = "/admin/product/delete")
    public String DeleteProduct(
            @ModelAttribute("product") Product product) {
        this.productService.DeleteByID(product.getId());
        return "redirect:/product";

    }

    @GetMapping("/product/{ID}")
    public String getUserDetailPage(Model model, @PathVariable long ID) {
        Optional<Product> optionalProduct = this.productService.getProductByID(ID);
        if (optionalProduct.isPresent()) {
            Product realProduct = optionalProduct.get();
            model.addAttribute("Product", realProduct);
        }
        return "admin/product/detail";
    }

    @GetMapping("/product/update/{ID}")
    public String getProductUpdatePage(Model model, @PathVariable long ID) {
        Optional<Product> product = this.productService.getProductByID(ID);
        if (product.isPresent()) {
            Product realProduct = product.get();
            model.addAttribute("updatedProduct", realProduct);
        }
        return "admin/product/update";
    }

    @PostMapping(value = "/admin/product/update")
    public String postMethodName(@ModelAttribute("updatedProduct") Product updatedProduct) {
        Optional<Product> optionalProduct = this.productService.getProductByID(updatedProduct.getId());
        if (optionalProduct.isPresent()) {
            Product realProduct = optionalProduct.get();
            realProduct.setPrice(updatedProduct.getPrice());
            realProduct.setDetail_description(updatedProduct.getDetail_description());
            realProduct.setShort_description(updatedProduct.getShort_description());
            realProduct = this.productService.handleSaveProduct(realProduct);
        }
        return "redirect:/user";
    }

    @GetMapping("/homepage/product/{ID}")
    public String GetViewProductDetail(Model model, @PathVariable long ID) {
        Optional<Product> productOptional = this.productService.getProductByID((ID));
        if (productOptional.isPresent()) {
            Product product = productOptional.get();
            model.addAttribute("Product", product);
        }
        return "client/product/detail";
    }

}
