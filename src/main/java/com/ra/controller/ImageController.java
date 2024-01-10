package com.ra.controller;

import com.ra.model.Image;
import com.ra.service.ImageService;
import com.ra.service.UploadFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping( "/pictureController")
public class ImageController {
    @Autowired
    private ImageService imageService;
    @Autowired
    private UploadFileService uploadFileService;
    private static final int SIZE = 3;
    private static String nameDefault="" ;
    private static String directionDefault = "ASC";
    private static String sortByDefault = "imageId" ;
    private static int pageDefault = 1;

    @GetMapping("/findAll")
    public ModelAndView display(Optional<String> productId, Optional<Integer> page,
                                Optional<String> direction, Optional<String> sortBy) {
        ModelAndView mav = new ModelAndView("picture");
        nameDefault = productId.orElse(nameDefault);
        directionDefault = direction.orElse(directionDefault);
        sortByDefault = sortBy.orElse(sortByDefault);
        pageDefault = page.orElse(pageDefault);

        //Lấy dữ liệu hiển thị
        List<Image> imageList = imageService.displayData(nameDefault, pageDefault - 1, SIZE,
                directionDefault, sortByDefault);
        //Lấy ra danh sách các trang theo kết quả tìm kiếm
        List<Integer> listPages = imageService.getListPage(nameDefault, SIZE);
        //add thông tin vào modelMap
        mav.addObject("imageList", imageList);
        mav.addObject("listPages", listPages);
        mav.addObject("imageProductId", nameDefault);
        mav.addObject("sortBy", sortByDefault);
        mav.addObject("direction", directionDefault);
        mav.addObject("page", pageDefault);

        return mav;
    }


    @GetMapping(value = "/delete")
    public String delete(int id) {
        //Thực hiện gọi sang service thực hiện thêm mới
        boolean result = imageService.delete(id);
        if (result) {
            return "redirect:findAll";
        } else {
            return "error";
        }
    }
}
// k sao a, e van nghe tieng th