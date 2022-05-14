package main.web.controller.admin;

import main.constant.Constant;
import main.dao.AdminDao;
import main.dao.domain.Admin;
import main.web.bean.PageBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin/admin")
public class AdmAdminController {

    @Resource
    private AdminDao adminDao;

    @RequestMapping(method = RequestMethod.GET)
    public String index(HttpServletRequest request, ModelMap model) {
        String username = (String) request.getSession().getAttribute(Constant.user_name);
        model.addAttribute("username", username);
        return "admin/admin";
    }

    @ResponseBody
    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    public PageBean<Admin> list(ModelMap model, Admin admin) {
        List<Admin> admins = adminDao.find(admin);
        PageBean<Admin> data = new PageBean<Admin>();
        data.setData(admins);
        return data;
    }

    @ResponseBody
    @RequestMapping(value = "/findById", method = {RequestMethod.GET, RequestMethod.POST})
    public Admin findById(ModelMap model, Admin admin) {
        return adminDao.findById(admin);
    }

    @ResponseBody
    @RequestMapping(value = "/save", method = {RequestMethod.GET, RequestMethod.POST})
    public int save(ModelMap model, Admin admin) {
        Admin adm = adminDao.findByAno(admin);
        if (adm != null) {
            return -1;
        }
        return adminDao.save(admin) ? 1 : 0;
    }

    @ResponseBody
    @RequestMapping(value = "/update", method = {RequestMethod.GET, RequestMethod.POST})
    public Boolean update(ModelMap model, Admin admin) {
        return adminDao.update(admin);
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = {RequestMethod.GET, RequestMethod.POST})
    public Boolean delete(ModelMap model, Admin admin) {

        System.out.println("进来了delete");
        return adminDao.delete(admin);
    }
}