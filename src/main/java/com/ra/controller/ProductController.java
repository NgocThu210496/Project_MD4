package com.ra.controller;

import com.ra.model.Categories;
import com.ra.model.Product;
import com.ra.service.CategoriesService;
import com.ra.service.ImageService;
import com.ra.service.ProductService;
import com.ra.service.UploadFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.awt.*;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/productController")
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoriesService categoriesService;
    @Autowired
    private UploadFileService uploadFileService;
    @Autowired
    private ImageService imageService;

    private static final int SIZE = 5;
    private static String nameDefault = "";
    private static String directionDefault = "ASC";
    private static String sortByDefault = "productName";
    private static int pageDefault = 1;

    @GetMapping("/findAll")
    public ModelAndView display(Optional<String> productName, Optional<Integer> page,
                                Optional<String> direction, Optional<String> sortBy,
                                Optional<String> id, Optional<String> detail) {
        ModelAndView mav = new ModelAndView("product");
        nameDefault = productName.orElse(nameDefault);
        directionDefault = direction.orElse(directionDefault);
        sortByDefault = sortBy.orElse(sortByDefault);
        pageDefault = page.orElse(pageDefault);
        id.ifPresent(x -> {
            Product update = productService.findById(x);
            mav.addObject("productUpdate", update);
        });
        detail.ifPresent(x -> {
            Product details = productService.findById(x);
//            Image image= imageService.findByProduct_ProductId(x);
            mav.addObject("productDetail", details);
//            mav.addObject("imageDetail", image);
        });
        //Lấy dữ liệu hiển thị
        List<Product> productList = productService.displayData(nameDefault, pageDefault - 1, SIZE,
                directionDefault, sortByDefault);
        //Lấy ra danh sách các trang theo kết quả tìm kiếm
        List<Integer> listPages = productService.getListPage(nameDefault, SIZE);
        List<Categories> categoriesList = categoriesService.findAll();
        //add thông tin vào modelMap
        mav.addObject("productsList", productList);
        mav.addObject("listPages", listPages);
        mav.addObject("productName", nameDefault);
        mav.addObject("sortBy", sortByDefault);
        mav.addObject("direction", directionDefault);
        mav.addObject("page", pageDefault);
        mav.addObject("categoriesList", categoriesList);

        return mav;
    }

    @PostMapping(value = "/create&Update")
    public String create(Product product, MultipartFile productImage, MultipartFile[] subImages) {
        if (productImage != null) {
            String urlImage = uploadFileService.uploadFile(productImage);
            product.setImage(urlImage);
        }
        //Thực hiện gọi sang service thực hiện thêm mới
        Product productNew = productService.saveOrUpdate(product);
        if (productNew != null) {
            if (subImages != null) {
                Arrays.asList(subImages).forEach(image -> {
                    String imageLink = uploadFileService.uploadFile(image);
                    Image images = new Image();
                    images.setProduct(productNew);
                    images.setPath(imageLink);
                    //Them moi vao model Images
                    imageService.save(images);
                });
            }
            return "redirect:findAll";
        } else {
            return "error";
        }
    }

    @GetMapping(value = "/delete")
    public String delete(String id) {
        //Thực hiện gọi sang service thực hiện thêm mới
        boolean result = productService.delete(id);
        if (result) {
            return "redirect:findAll";
        } else {
            return "error";
        }
    }
}
