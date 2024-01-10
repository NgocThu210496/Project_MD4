package com.ra.serviceImp;

import com.ra.model.Categories;
import com.ra.repository.CategoriesRepository;
import com.ra.service.CategoriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoriesServiceImp implements CategoriesService {
    @Autowired
    private CategoriesRepository categoriesRepository;

    @Override
    public List<Categories> displayData(String catalogName, int page, int size, String direction, String sortBy) {
        Pageable pageable = PageRequest.of(page,size,
                direction.equals("ASC")? Sort.Direction.ASC: Sort.Direction.DESC,sortBy);
        List<Categories> categoriesList = categoriesRepository.findByCatalogName(catalogName,pageable).getContent();
        return categoriesList;
    }

    @Override
    public List<Integer> getListPage(String catalogName, int size) {
        int count = categoriesRepository.countByCatalogNameContains(catalogName);
        List<Integer> listPage = new ArrayList<>();
        for (int i = 0; i < (int) Math.ceil((double) count / (double) size); i++) {
            listPage.add(i+1);
        }
        return listPage;
    }

    @Override
    public Categories findById(String id) {
        return categoriesRepository.findById(id).get();
    }

    @Override
    public boolean saveOrUpdate(Categories categories) {
        try {
            categoriesRepository.save(categories);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(String id) {
        try {
            Categories categories = findById(id);
            categories.setStatus(!categories.isStatus());
            categoriesRepository.save(categories);
            // đó thế thôi
            // bởi vì bên trong database nó ko có liên kết khoá chính khoá
            // khoá ngoại nên vẫn xoá được
            // không có mũi tên liên kết á
            // còn bình thường có khoá ngoại thì ko xoá được
            // em nghĩ chị nên đổi xoá thành thay đối trạng thái của product thôi chị ạ
            // vì dính khoá ngoại ko thể xoá được kiểu true thành false hoặc false thành true chị ạ
            // cái statsu là trạng thái dấy
            // true là hoạt động
            // false là khoá lại ko cho thêm product vào categories đấy
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Categories> findAll() {
        return categoriesRepository.findAllBy();
    }
}
