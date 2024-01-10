package com.ra.controller;

import com.ra.model.Categories;
import com.ra.service.CategoriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping( "/categoriesController")
public class CategoriesController {
    @Autowired
    private CategoriesService categoriesService;

    private static final int SIZE = 3;
    private static String nameDefault = "";
    private static String directionDefault = "ASC";
    private static String sortByDefault = "catalogName";
    private static int pageDefault = 1;
    @GetMapping("/findAll")
    public ModelAndView displayCategories(Optional<String> catalogName, Optional<Integer> page,
                                          Optional<String> direction, Optional<String> sortBy, Optional<String> id) {
        ModelAndView mav = new ModelAndView("categories");
        nameDefault=catalogName.orElse(nameDefault);
        directionDefault=direction.orElse(directionDefault);
        sortByDefault=sortBy.orElse(sortByDefault);
        pageDefault=page.orElse(pageDefault);
        id.ifPresent(x->{
            Categories update = categoriesService.findById(x);
            mav.addObject("catalogUpdate", update);
        });
        //Lấy dữ liệu hiển thị
        List<Categories> categoriesList = categoriesService.displayData(nameDefault,pageDefault-1,SIZE,
                directionDefault,sortByDefault);
        //Lấy ra danh sách các trang theo kết quả tìm kiếm
        List<Integer> listPages = categoriesService.getListPage(nameDefault,SIZE);
        mav.addObject("categoriesList",categoriesList);
        mav.addObject("listPages",listPages);
        mav.addObject("catalogName",nameDefault);
        mav.addObject("sortBy",sortByDefault);
        mav.addObject("direction",directionDefault);
        mav.addObject("page",pageDefault);

        return mav;
    }
    @PostMapping(value = "/create&Update")
    public String create(@ModelAttribute Categories categories) {
        //Thực hiện gọi sang service thực hiện thêm mới
        boolean result = categoriesService.saveOrUpdate(categories);
        if(result){
            return "redirect:findAll";
        } else {
            return "error";
        }
    }

    @GetMapping(value = "/delete")
    public String delete(@RequestParam("id") String id) {
        //Thực hiện gọi sang service thực hiện thêm mới
        boolean result = categoriesService.delete(id);
        if(result){
            return "redirect:/categoriesController/findAll";
        } else {
            return "error";
        }
    }
}
